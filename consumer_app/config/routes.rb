Rails.application.routes.draw do

  root 'home#index'

  controller :home do
    get 'home/index'
    get 'home/about'
    get 'home/contact'
  end

end
