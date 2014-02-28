class RootController < ApplicationController
  before_filter :authenticate_user!, only: %w[viewer]

  def index
    if user_signed_in?
      current_user.update_attribute(:fetching, true)
      Resque.enqueue ArticleFetcher, current_user.id
      render 'loading', layout: 'signed_in'
    else
      render 'top'
    end
  end

  def viewer
    @article = current_user.random_article
    if @article.present?
      render layout: 'signed_in'
    else
      render 'empty', layout: 'signed_in'
    end
  end
end
