Rails.application.routes.draw do

  constraints subdomain: /^www$|^m$/ do
    get '/' => "bills#index"
  end

end
