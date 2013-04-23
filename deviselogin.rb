require 'devise'
ApplicationController.allow_forgery_protection = false

app.post('/login', {"/login"=>{"email"=>"tovianus@gmail.com", "password"=>"freepass"}})

