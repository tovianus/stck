<<<<<<< HEAD
=======

require File.join(Rails.root,'lib','openshift_secret_generator.rb')
>>>>>>> ee5bd40868cd70e8c7e1a08ae51c161ebc640b8c
# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
<<<<<<< HEAD
Stck::Application.config.secret_token = '9a4633bf1a544655af1f42b5f5ea72fdd07bd08bafb95cac82836b7302a3000062000ef9ed039b739534f20745c9a6e2ae8bd04d959b41db8f8668cf8b84a751'
=======

# Set token based on intialize_secret function (defined in initializers/secret_generator.rb)
RailsApp::Application.config.secret_token = initialize_secret(
  :token,
  '335a4e365ef2daeea969640d74e18f0e3cd9fae1abd8f4125691a880774ea6d456a29c0831aa6921bf86a710fe555e916f0673f5657619ec9df22e0409bec345'
)
>>>>>>> ee5bd40868cd70e8c7e1a08ae51c161ebc640b8c
