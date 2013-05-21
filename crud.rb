require 'mongo'

# setting

@con = Mongo::Connection.new
@db = @con['tutorial']
@users = @db['users']

# scheme

smith = { "last_name" => "smith", "age" => 30 }
jones = { "last_name" => "jones", "age" => 40 }

# Create

smith_id = @users.insert(smith)
jones_id = @users.insert(jones)

# views results

p @users.find_one({ "_id" => smith_id })
p @users.find_one({ "_id" => jones_id })

# find

cursor = @users.find({"age" => {"$gt" => 20}})

cursor.each do |doc|
	puts doc["last_name"]
end

# Update

@users.update({"last_name" => "smith"}, {"$set" => {"city" => "New Your"}}, :multi => true)

# Remove

@users.remove({"age" => {"$gte" => 40}})		# $gte :: >=

# Remove all

@users.remove

# Drop collection

@db.drop_collection('users')
