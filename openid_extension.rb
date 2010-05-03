# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class OpenidExtension < Radiant::Extension
  version "1.0"
  description "Provides Open ID logins for Radiant"
  url "http://yourwebsite.com/openid"

  define_routes do |map|
    map.namespace :admin do |admin|
      admin.oid_login 'openid/login', :controller => 'openid', :action => 'login'
    end
  end

  def activate
    # admin.tabs.add "Openid", "/admin/openid", :after => "Layouts", :visibility => [:all]
    OpenIdAuthentication.store = :file
    admin.users.edit.add(:form, "edit_identity_url", :after => "edit_password")
  end

  def deactivate
    # admin.tabs.remove "Openid"
  end

end
