# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class OpenidExtension < Radiant::Extension
  version "1.0"
  description "Provides Open ID logins for Radiant"
  url "http://github.com/viking/radiant-openid-extension"

  define_routes do |map|
    map.oid_login  'admin/openid/login',  :controller => 'admin/openid', :action => 'login'
    map.oid_logout 'admin/openid/logout', :controller => 'admin/openid', :action => 'logout'
  end

  def activate
    OpenIdAuthentication.store = :file
    admin.users.edit.add(:form, "edit_identity_url", :after => "edit_password")

    if Radiant::Config["openid.override"] == "true"
      ApplicationController.send(:include, Openid::ApplicationControllerExtensions)
    end
  end

  def deactivate
  end

end
