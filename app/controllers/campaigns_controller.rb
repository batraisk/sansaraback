# require 'lib/ya/api/direct/client.rb'

class CampaignsController < ApplicationController
	def index
		request = {
	    "SelectionCriteria" => {
	      "Types" => ["TEXT_CAMPAIGN"]
	    },
	    "FieldNames" => ["Id", "Name"],
	    "TextCampaignFieldNames" => ["BiddingStrategy"]
		}

		options = { token: 'AQAAAAAJjZCHAARGXyfKnq7kkE8nkXU1hY5Px5c' }
		direct = Ya::API::Direct::Client.new(options)
		json = direct.campaigns.get request
		render json: json
	end

	def ads
		request = {
	    "SelectionCriteria" => {
	      "CampaignIds" => [params[:campaign_id]]
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
