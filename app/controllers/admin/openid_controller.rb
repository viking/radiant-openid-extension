class Admin::OpenidController < ApplicationController
  no_login_required

  def login
    if using_open_id?
      authenticate_with_open_id do |result, identity_url|
        if result.successful?
          if self.current_user = User.find_by_identity_url(identity_url)
            redirect_to welcome_url
          else
            flash.now[:error] = "Invalid identity."
            render :template => 'admin/welcome/login'
          end
        else
          flash.now[:error] = "Open ID authentication failed."
          render :template => 'admin/welcome/login'
        end
      end
    end
  end
end
