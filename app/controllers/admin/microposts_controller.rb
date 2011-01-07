class Admin::MicropostsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user, :except => :create

	def index
		@title = "All microposts"
    @microposts = Micropost.paginate(:page => params[:page])
		@all_microposts = Micropost.all
	end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
      @micropost = Micropost.find(params[:id])
      if @micropost.update_attributes(params[:micropost])
        flash[:success] = 'Micropost was successfully updated.'
        redirect_to admin_microposts_path
      else
        render "edit" 
      end
  end

  def destroy
    if Micropost.find(params[:id]).destroy
      flash[:notice] = 'Post was successfully deleted.'
   	else 
      flash[:error] = 'Problem - Post still exists.'
		end
    	redirect_to admin_microposts_path
  end
end
