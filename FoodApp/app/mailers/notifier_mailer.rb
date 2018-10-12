class NotifierMailer < ApplicationMailer
	default from: 'ramarathore76@gmail.com',
          return_path: 'ramarathore76@gmail.com'

  def confirmation_email
   #@user = current_user
 end
end
