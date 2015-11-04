module HaloStats
  class Stats
    require 'takeout'
    attr_accessor :stats_client
    

    def initialize(options={})
      title = 'h5'
      key = "0361031b16c54d7bb8657504360409ff"

      self.stats_client = Takeout::Client.new(uri: "www.haloapi.com", endpoints: {get: :matches}, schemas: {get: {matches: "/stats/#{title}/players/{% if gamertag %}/{{gamertag}}{% endif %}/{{endpoint}}"}}, headers: {'Ocp-Apim-Subscription-Key' => key}, ssl: true)
    end

    def get_matches(gamertag)
      return stats_client.get_matches(gamertag: gamertag)
    end
  end
end