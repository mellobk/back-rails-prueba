class OrderMailer < ApplicationMailer

    def new_order_email(salesEmails,projectEmail,lead)
        @projectEmail=projectEmail
        @lead=lead
        @emails = salesEmails

        mail(to:@emails, subject: "Una persona esta interezad@ en un proyecto") 
 




    
       
      end
      
end
