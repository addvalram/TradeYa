# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_TradeYa_session',
  :secret      => 'dd26f4e3d1695ddd7b8a7e63c6a5621d633a63d608758749641a7035b6c119be8f9130a7f18c39639248fee97be44f56d1983414e5953ade8dd3f59281e2da79'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
