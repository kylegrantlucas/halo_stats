module HaloStats
  class Stats
    require 'takeout'
    attr_accessor :stats_client
    

    def initialize(options={})
      title = 'h5'
      key = options[:api_key] || "0361031b16c54d7bb8657504360409ff"
      stats_prefix = "/stats/#{title}"
      stats_schemas = { get: {
                          player_matches: "#{stats_prefix}/players/{{gamertag}}/matches",
                          arena_matches: "#{stats_prefix}/arena/matches/{{id}}",
                          campign_matches: "#{stats_prefix}/campaign/matches/{{id}}",
                          warzone_matches: "#{stats_prefix}/warzone/matches/{{id}}",
                          custom_game_matches: "#{stats_prefix}/custom/matches/{{id}}",
                          arena_service_record: "#{stats_prefix}/servicerecords/arena",
                          campaign_service_record: "#{stats_prefix}/servicerecords/campaign",
                          warzone_service_record: "#{stats_prefix}/servicerecords/warzone",
                          custom_game_service_record: "#{stats_prefix}/servicerecords/custom"
                        }
                      }
      stats_endpoints = {get: stats_schemas[:get].keys}

      self.stats_client = Takeout::Client.new(uri: "www.haloapi.com", endpoints: stats_endpoints, schemas: stats_schemas, headers: {'Ocp-Apim-Subscription-Key' => key}, ssl: true)

      return self
    end

    def get_matches(gamertag)
      return stats_client.get_player_matches(gamertag: gamertag)
    end

    def get_arena_carnage_report(id)
      return stats_client.get_arena_matches(id: id)
    end

    def get_campaign_carnage_report(id)
      return stats_client.get_campaign_matches(id: id)
    end

    def get_warzone_carnage_report(id)
      return stats_client.get_warzone_matches(id: id)
    end

    def custom_game_carnage_report(id)
      return stats_client.get_custom_game_matches(id: id)
    end

    def get_arena_service_record(gamertags)
      return stats_client.get_arena_service_record(players: [gamertags].flatten(1).join(',')) 
    end

    def get_campaign_service_record(gamertags)
      return stats_client.get_campaign_service_record(players: [gamertags].flatten(1).join(',')) 
    end

    def get_custom_game_service_record(gamertags)
      return stats_client.get_custom_game_service_record(players: [gamertags].flatten(1).join(',')) 
    end

    def get_warzone_service_record(gamertags)
      return stats_client.get_warzone_service_record(players: [gamertags].flatten(1).join(',')) 
    end
  end
end