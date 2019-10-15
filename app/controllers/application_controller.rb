class ApplicationController < ActionController::Base
  before_action :set_categories

  protected

  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor_user?
  end
  def uthenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin_user?
  end

  private

  def set_categories
    @categories = Category.all
  end
end
