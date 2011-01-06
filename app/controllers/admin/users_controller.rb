class Admin::UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :admin_user

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page],:order => "name")
    @all_users = User.count
    @active_users = User.count(:conditions => "active = true")
    @inactive_users = User.count(:conditions => "active = false")
  end

  def toggle_active
    user = User.find(params[:id])
    if user.toggle!(:active)
      status = "activated"
      status = "deactivated" unless user.active?
      flash[:success] = "#{user.name} has been #{status}."
    redirect_to admin_users_path
    else
      flash[:notice] = "#{user.name} status unchanged"
    redirect_to admin_users_path
    end
  end

  def toggle_admin
    user = User.find(params[:id])
		if (multiple_admin || user.admin == false)
		  if user.toggle!(:admin)
		    status = "granted"
		    status = "removed" unless user.admin?
		    flash[:success] = "#{user.name} has 'Admin' #{status}."
		  	redirect_to admin_users_path
		  else
		    flash[:notice] = "#{user.name} status unchanged"
		  	redirect_to admin_users_path
		  end
		else
		flash[:error] = "Admin status remains -- #{user.name} is the last Admin!"
		redirect_to admin_users_path
		end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to admin_users_path
  end

  private

	def multiple_admin
		return true if User.count(:conditions => "admin = true") > 1
		return false
	end

end
