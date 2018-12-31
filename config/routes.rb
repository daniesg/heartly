Rails.application.routes.draw do
  root "homes#index"

  devise_for :users, skip: :registrations
  devise_scope :user do
    resource :registration, only: [:new, :create], path: 'users', path_names: { new: 'sign_up' }, controller: 'devise/registrations', as: :user_registration
  end
end
