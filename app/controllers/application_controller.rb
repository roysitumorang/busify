class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_gettext_locale
  protect_from_forgery with: :exception
  PER_PAGE = 20
  add_breadcrumb :root

  def default_url_options(options = {})
    { locale: FastGettext.locale }.merge options
  end
end
