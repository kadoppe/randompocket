class User < ActiveRecord::Base
  devise :rememberable, :trackable, :omniauthable
  attr_accessible :name, :uid, :token

  has_many :articles, dependent: :destroy
  has_many :unread_articles, class_name: Article.name, conditions: ["articles.read = ?", false]

  def self.find_for_pocket_oauth(auth, signed_in_resource = nil)
    user = User.where(uid: auth.uid).first
    unless user
      user = User.create(
        name: auth.info.name,
        uid: auth.uid,
        token: auth.credentials.token
      )
    end
    user
  end

  def random_article
    unread_articles.offset(rand(unread_articles.count)).each_with_index do |article, i|
      article.fetch!
      if article.can_display
        article.update_attribute('read', true)
        return article
      end
    end
  end
end
