class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :persist_search
  before_filter :flash_user
  
  protected
    def persist_search
      @search = Search.new params[:search]
    end

    def authorize_user
      redirect_to root_url, alert: "You can't perform this action" unless current_user.present? && current_user.moderator?
    end

    def authorize_super_admin
      redirect_to root_url, alert: "You can't perform this action" unless current_user.present? && current_user.super_admin?
    end

    def flash_user
      if current_user && current_user.is_volunteer?
        flash[:volunteer] = "Thanks for volunteering with us. You will be able to help us after we confirmed you as moderator. Stay tuned!"
      end
    end
end
