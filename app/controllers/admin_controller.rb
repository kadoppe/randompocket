class AdminController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin

  def dashboard
    @user_count = User.count
    @article_count = Article.count
  end

  private
  def is_admin
    unless current_user.name == 'kadoppe'
      render text: 'Forbidden', status: 403
    end
  end
end
