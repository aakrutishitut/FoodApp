namespace :summary do
  desc "TODO"
  task create: :environment do
  	# collection = db[:restaurants]
	summary=Restaurant.collection.aggregate([{"$unwind" => "$reviews"},{"$group" => {"_id" => "$city_id","rating" => {"$avg" => "$reviews.rating"}}}])
  	summary.map do |each|
  		c=City.find_by(id: each["_id"])
  		puts c.name
  		puts each["rating"]
  	end
  end

end
