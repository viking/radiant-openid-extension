require File.dirname(__FILE__) + '/../../../spec_helper'

describe "/admin/openid/login" do
  before do
    render 'admin/openid/login'
  end

  it "should have an open id form" do
    response.should have_tag("form[action=#{admin_oid_login_url}]") do
      with_tag("input[name=openid_identifier]")
    end
  end
end
