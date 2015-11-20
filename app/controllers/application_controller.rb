class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :persist_search
  
  protected
    def persist_search
      @search = Search.new params[:search]
    end

    def authorize_user
      redirect_to :back, error: "You can't perform this action" unless current_user.present?
    end

    def authorize_super_admin
      redirect_to :back, error: "You can't perform this action" unless current_user.present?
    end
end
