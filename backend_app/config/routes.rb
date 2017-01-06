Rails.application.routes.draw do
  root 'contact#index'

  controller :contact do
    get 'contact' => 'contact#index'
    get 'contact/index' => 'contact#index'
    post 'contact' => 'contact#create'
  end

  controller :event do
    post 'event' => 'event#create'
  end
end
