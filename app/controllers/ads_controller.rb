# require 'lib/ya/api/direct/client.rb'

class AdsController < ApplicationController
	def index
		request = {
	    "SelectionCriteria" => {
	      "CampaignIds" => ["216587"]
	    },
	    "FieldNames" => ["AdCategories", "AgeLabel", 
	    	               "AdGroupId", "CampaignId", 
	    	               "Id", "State", "Status", 
	    	               "StatusClarification", "Type", "Subtype"]
		}

		options = { token: 'AQAAAAAJjZCHAARGXyfKnq7kkE8nkXU1hY5Px5c' }
		direct = Ya::API::Direct::Client.new(options)
		json = direct.ads.get request
		render json: json
	end
end
