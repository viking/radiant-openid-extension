require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::OpenidController do

  #Delete these examples and add some real ones
  it "should use Admin::OpenidController" do
    controller.should be_an_instance_of(Admin::OpenidController)
  end


  it "GET 'login' should be successful" do
    get 'login'
    response.should be_success
  end
end
