class Api::V1::UserController < ApplicationController

    skip_before_action :authorized, only: [:login, :create,:emailCheck]


    def emailCheck 

      @email = User.where(email: params[:email])
      @emailCheck =@email.empty? ? false : true
      render json: { data: @emailCheck }
    end
    
    def tokenVerify 

      token = decoded_token()

      render json: { message:'load user', toke:token[0], status: :ok}
    end
    
    # REGISTER
    def create
      @user = User.create(user_params)
     
      if @user.valid?
        @user_role = User.find(@user.id)
        @user_role.add_role :user

        @user = User.find_by(email: params[:email])
        user_proyects = UserProyect.where(user_id: @user.id).select("proyect_id as data_user")
        
        token = encode_token({email: @user.email,user_id:@user.id}) 
        render json: { token: token, user_email:@user.email, status: :ok,message: 'usuario creado correctamente'}
      else
        render json: {message: "Invalid username or password", status: :error}
      end
    end
  
    # LOGGING IN
    def login
      @user = User.find_by(email: params[:email])
      user_proyects = UserProyect.where(user_id: @user.id).select("proyect_id as data_user")
      
      if @user && @user.authenticate(params[:password])
        token = encode_token({email: @user.email,user_id:@user.id}) 
        render json: { token: token, user_email:@user.email, status: :ok}
      else
        render json: {error: "Nombre de usuario o contraseña incorrecta", status: :error}
      end
    end
  
    def myProjects
      token = decoded_token()
      myProjects = UserProyect.joins(:proyect).where(user_id: token[0]['user_id'] ).select('*')
      #Author.joins(:articles).where(articles: { author: author })

      render json: { data:myProjects, status: :ok}
      
     

    end


    def auto_login
      render json: @user
    end
  
    private
  
    def user_params
      params.permit(:name, :last_name,:phone,:email, :password, )
    end
 
end
