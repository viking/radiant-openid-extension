module Openid
  module ApplicationControllerExtensions
    def login_url
      oid_login_url
    end

    def logout_url
      oid_logout_url
    end
  end
end
