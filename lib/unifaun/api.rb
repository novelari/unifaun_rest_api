module API
  HOST = 'https://api.unifaun.com/rs-extapi'
  VERSION = 'v1'
  KEY = ENV['unifaun_key']
  def self.Url
    "#{HOST}/#{VERSION}"
  end
end
