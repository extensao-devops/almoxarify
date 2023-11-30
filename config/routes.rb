Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :categories
      resources :items
      resources :update_item
    end
  end
end