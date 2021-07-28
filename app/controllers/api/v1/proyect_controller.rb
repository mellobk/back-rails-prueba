class Api::V1::ProyectController < ApplicationController

    skip_before_action :authorized, only: [:getAllProject]

    def createProyecjt
        @proyect = Proyect.create(proyect_params)
       
        if @proyect.valid?

            @token = decoded_token()
            UserProyect.create(user_id:  @token[0]['user_id'],  proyect_id: @proyect.id)
            
          render json: {status: :ok, message: 'proyecto creado correctamente' }
        else
          render json: {message: "ocurrio un error porfavor intente de nuevo", status: :error}
        end
      end


      def editProject
        @Proyect = Proyect.where(id: params[:projectId])
        
       
        if @Proyect.empty?

            render json: {message: "ocurrio un error porfavor intente de nuevo", status: :error}
        else
            @proyectupdate = @Proyect.update(proyect_params)

            render json: {status: :ok, message: "proyecto actualizado exitosamente" }
      
        end
      end

      def getAllProject
        @Proyects = Proyect.all
        
       
        if @Proyects.empty?

            render json: {message: "ocurrio un error porfavor intente de nuevo", status: :error}
        else
       

            render json: {status: :ok, data: @Proyects }
      
        end
      end

   

      def projectInfo
        @ProyectInfo = Proyect.where(id: params[:projectId])
        
       
        if @ProyectInfo.empty?

            render json: {message: "ocurrio un error porfavor intente de nuevoss", status: :error}
        else
       

            render json: {status: :ok, data: @ProyectInfo }
      
        end
      end

       
    def proyect_params
        params.permit(:name, :type_proyect,:city_name,:proyect_address, :price ,:privateArea,:builtArea,:vis_value, :bathrooms_numbres, :parking_lot,:sales_email )
      end



end
