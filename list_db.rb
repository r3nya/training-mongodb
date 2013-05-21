require "mongo"

@con = Mongo::Connection.new
@admin_db = @con['admin']
puts @admin_db.command({"listDatabases" => 1})
