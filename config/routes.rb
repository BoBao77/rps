Rails.application.routes.draw do
  get '/' => 'throw#index'
  post '/throw' => 'throw#play'
end
