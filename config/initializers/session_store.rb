<<<<<<< HEAD
# Be sure to restart your server when you modify this file.

Stck::Application.config.session_store :cookie_store, key: '_stck_session'
=======
require File.join(Rails.root,'lib','openshift_secret_generator.rb')

# Be sure to restart your server when you modify this file.

# Set token based on intialize_secret function (defined in initializers/secret_generator.rb)
RailsApp::Application.config.session_store :cookie_store, :key => initialize_secret(
  :session_store,
  '_railsapp_session'
)
>>>>>>> ee5bd40868cd70e8c7e1a08ae51c161ebc640b8c

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
<<<<<<< HEAD
# Stck::Application.config.session_store :active_record_store
=======
# RailsApp::Application.config.session_store :active_record_store
>>>>>>> ee5bd40868cd70e8c7e1a08ae51c161ebc640b8c
