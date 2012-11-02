Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :sessions do
    resources :sessions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :sessions, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :sessions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
