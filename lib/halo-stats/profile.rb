module HaloStats
  class Profile
    require 'takeout'
    attr_accessor :stats_client
    
    def initialize(options={})
      title = 'h5'
      key = options[:api_key] || "0361031b16c54d7bb8657504360409ff"
      profile_prefix = "/stats/#{title}"
      profile_schemas = { get: {
                            emblem: "#{profile_prefix}/profiles/{{gamertag}}/emblem"
                        }
                      }
      profile_endpoints = {get: profile_schemas[:get].keys}

      self.stats_client = Takeout::Client.new(uri: "www.haloapi.com", endpoints: profile_endpoints, schemas: profile_schemas, headers: {'Ocp-Apim-Subscription-Key' => key}, ssl: true)

      return self
    end

    def get_emblem(gamertag)
      return stats_client.get_emblem(gamertag: gamertag)
    end
  end
end