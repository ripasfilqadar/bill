Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints subdomain: /^www$|^m$/ do
    resources :bills
    get '/' => "bills#index"
  end

end
