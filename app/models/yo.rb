class Yo
  def self.yo(yo_username)
    return false if yo_username.nil?
    result = RestClient.post "http://api.justyo.co/yo/", api_token: ENV['YO_TOKEN'], username: yo_username.upcase
    if result.code == 201
      true
    else
      false
    end
  end

  def self.yoall
    result = RestClient.post "http://api.justyo.co/yoall/", api_token: ENV['YO_TOKEN']
    if result.code == 201
      true
    else
      false
    end
  end
end
