class Api::V1::LeadController < ApplicationController

  skip_before_action :authorized, only: [:create]

    def create
       lead = Lead.create(lead_params)

        @projectEmail = Proyect.where(id: params[:proyect_id])
        @salesEmails = @projectEmail[0]['sales_email'].split(',') 
       
        if lead.valid?
          @salesEmails.each { |emails|   OrderMailer.new_order_email(emails, @projectEmail,lead).deliver }
          
         

          render json: {status: :ok, message: 'lead creado correctamente' }
        else
          render json: {message: "ocurrio un error porfavor intente de nuevo", status: :error}
        end
      end


      

    def leadsProject
        leadProject = Lead.where(proyect_id: params[:projectId])
       

        render json: {data: leadProject, status: :ok}

      end

      def lead_params
        params.permit(:name, :last_name,:email,:phone, :proyect_id )
      end

    

end
