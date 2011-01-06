# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter_session',
  :secret      => 'a2160eed863e79b0fd91fc947804f8654d92dae24a53cc8dcc3bbfdf19c5e4e761432b2e944d7c1f2397ab76d74d4515ab009818d9f48f986c2245be33ebc230'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
