require 'spec_helper'

describe ChangePasswordController do

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

  describe "GET 'update_password'" do
    it "returns http success" do
      get 'update_password'
      response.should be_success
    end
  end

end
