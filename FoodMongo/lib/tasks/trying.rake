namespace :trying do
  desc "TODO"
  task try: :environment do
  	@users=User.where(type_of_u: "customer")
  	@users.each do |user|
  		@order=Order.where(user_id: user.id).last
  		if @order.nil?
        diff=Time.now.hour-user.created_at.hour
        if diff>20
  			 user.destroy
        end
  		else
  		diff=Time.now.hour-@order.created_at.hour
  		puts diff
  		if diff>20
  			user.destroy
  		end
  	end
  	end
  end

end
