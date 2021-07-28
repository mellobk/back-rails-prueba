Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post '/user/create', to: 'user#create'
      post '/user/login', to: 'user#login'
      post '/user/emailCheck', to: 'user#emailCheck'
      get '/user/tokenVerify', to: 'user#tokenVerify'
      get '/user/Projects', to: 'user#myProjects'

      post '/project/create', to: 'proyect#createProyecjt'
      put '/project/edit/:projectId', to: 'proyect#editProject'
      get '/project/allProject', to: 'proyect#getAllProject'
      get '/project/:projectId', to: 'proyect#projectInfo'
  
      

      post '/lead/create', to: 'lead#create'
      get '/project/lead/:projectId', to: 'lead#leadsProject'
    end
  end

end
