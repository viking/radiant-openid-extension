require File.dirname(__FILE__) + '/../../spec_helper'

class FakeApplicationController < ActionController::Base
  include Openid::ApplicationControllerExtensions
end

describe "Openid::ApplicationControllerExtensions", :type => :controller do
  describe FakeApplicationController do
    it "#login_url" do
      login_url.should == oid_login_url
    end

    it "#logout_url" do
      logout_url.should == oid_logout_url
    end
  end
end
