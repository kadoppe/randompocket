class ArticleFetcher
  @queue = :fetch_queue

  def self.perform(user_id)
    user = User.find(user_id)

    Article.where(user_id: user.id).delete_all

    client = Pocket.client(access_token: user.token)
    info = client.retrieve state: 'unread', detailType: 'simple'

    inserts = []
    info['list'].each_with_index do |item, i|
      item_id = item[1]['item_id']
      url = item[1]['resolved_url']

      unless item_id.present? && url.present?
        next
      end

      inserts.push <<-INSERT
        (
          #{item_id},
          '#{url.gsub("'", "''")}',
          #{user_id}
        )
      INSERT

      if i == info['list'].count - 1 || i % 2000
        sql = <<-SQL
          INSERT INTO articles (item_id, url, user_id)
          VALUES #{inserts.join(", ")}
        SQL
        User.connection.execute sql

        inserts.clear
      end
    end

    user.update_attribute(:fetching, false)
  end
end
