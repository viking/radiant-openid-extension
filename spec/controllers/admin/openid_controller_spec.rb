require File.dirname(__FILE__) + '/../../spec_helper'

describe Admin::OpenidController do
  dataset :users

  it "GET 'login' should be successful" do
    get 'login'
    response.should be_success
  end

  describe "POST 'login" do
    before(:each) do
      @identity = 'http://example.com/foo'
      @params = {:openid_identifier => @identity}
      @result = stub('open id result')
      @controller.should_receive(:authenticate_with_open_id).and_yield(@result, @identity)
    end

    describe "with successful Open ID authentication" do
      before(:each) do
        @result.stub!(:successful?).and_return(true)
      end

      it "should log in valid user" do
        @user = create_user('Open ID User', :identity_url => @identity)
        @controller.should_receive(:current_user=).with(@user).and_return(@user)

        post 'login', @params
        response.should redirect_to(welcome_url)
      end

      it "should not log in non-existent user" do
        @controller.should_receive(:current_user=).with(nil).and_return(nil)

        post 'login', @params
        response.should be_success
      end
    end

    describe "non-successful Open ID authentication" do
      before(:each) do
        @result.stub!(:successful?).and_return(false)
      end

      it "should re-display view" do
        post 'login', @params
        response.should be_success
      end
    end
  end
end
