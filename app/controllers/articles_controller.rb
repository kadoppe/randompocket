class ArticlesController < ApplicationController
  before_filter :authenticate_user!

  def random
    article = current_user.random_article
    if article.present?
      render json: article
    else
      render nothing: true, status: 404
    end
  end

  def favorite
    article = Article.find(params[:id])

    unless article.user == current_user
      render text: 'Forbidden', status: 403
      return
    end

    article.favorite!
    render nothing: true, status: :ok
  end

  def archive
    article = Article.find(params[:id])

    unless article.user == current_user
      render text: 'Forbidden', status: 403
      return
    end

    article.archive!
    render nothing: true, status: :ok
  end
end
