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


  # Frontend routes
  namespace :walks do
    resources :walks, :path => '', :only => [:index, :show, :create, :new]
  end

  # Admin routes
  namespace :walks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :walks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
