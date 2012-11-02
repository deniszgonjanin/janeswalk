Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :sponsors do
    resources :sponsors, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :sponsors, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :sponsors, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
