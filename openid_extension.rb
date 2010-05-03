# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class OpenidExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/openid"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :openid
  #   end
  # end
  
  def activate
    # admin.tabs.add "Openid", "/admin/openid", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Openid"
  end
  
end
