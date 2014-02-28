class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :url, :item_id, :user_id

  def fetch!
    uri = URI.parse(url)

    if uri.scheme == 'http'
      conn = Net::HTTP.new(uri.host)
    else uri.scheme == 'https'
      conn = Net::HTTP.new(uri.host, 443)
    end

    response = conn.get(uri.path.presence || '/')
    response.each_capitalized do |h, v|
      if h == 'X-Frame-Options' && ['deny', 'sameorigin'].include?(v.downcase)
        update_attribute('can_display', false)
      end
    end

    update_attribute('title', Nokogiri::HTML.parse(response.body).xpath('//title').text)
  end

  def favorite!
    client = Pocket.client(access_token: user.token)
    client.modify [action: 'favorite', item_id: item_id]
  end

  def archive!
    client = Pocket.client(access_token: user.token)
    client.modify [action: 'archive', item_id: item_id]
  end
end
