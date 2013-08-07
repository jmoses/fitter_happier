Rails.application.routes.draw do
  get '/fitter_happier' => 'fitter_happier#index'
  get '/fitter_happier/site_check' => 'fitter_happier#site_check'
  get '/fitter_happier/site_and_database_check' => 'fitter_happier#site_and_database_check'
end
