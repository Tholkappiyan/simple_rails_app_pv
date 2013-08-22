config = YAML::load_file(File.join("#{File.dirname(__FILE__)}/../..", 'config', 'redis.yml'))[RAILS_ENV]

# $redis = Redis.new(:host => config["host"], :port => config["port"])
puts "1234567890"
puts config
puts "1234567890"

$redis = Redis.new(:host => config["host"], :port => config["port"])
