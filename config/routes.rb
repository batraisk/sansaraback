Rails.application.routes.draw do
	scope :api do
	  mount_devise_token_auth_for 'User', at: 'auth'
	  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
		resources :campaigns, only: [:index, :show, :create, :update] do
			get :ads
		end
		resources :ads
	end
end


# scope :api do
#     mount_devise_token_auth_for 'User', at: 'auth', controllers: {
#       registrations: 'users/registrations',
#       sessions: 'users/sessions',
#       token_validations: 'users/token_validations'
#     }

#     resource :account, only: [:show, :update] do
#       collection do
#         delete :personal_photo_document
#         delete :current_address_document
#       end
#     end

#     resources :campaigns, only: [:index, :show, :create, :update] do
#       resources :faqs,         only: [:create, :update, :destroy]
#       # TODO: Remove ShareholdersController if not needed
#       # Shareholders managed via nested attributes
#       # resources :shareholders, only: [:create, :update, :destroy]
#       resources :team_members, only: [:create, :update, :destroy] do
#         delete :avatar
#       end
#     end

#     get :investment_campaigns, controller: 'mocks'
#     get :investment_opportunities, controller: 'mocks'
#   end
# end
