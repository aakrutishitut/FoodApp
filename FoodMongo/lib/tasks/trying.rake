namespace :trying do
  desc "TODO"
  task try: :environment do
  	@restaurant=Restaurant.last
  	@restaurant.destroy
  end

end
