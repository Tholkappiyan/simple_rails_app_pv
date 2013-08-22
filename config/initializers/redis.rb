config = YAML::load_file(File.join("#{File.dirname(__FILE__)}/../..", 'config', 'redis.yml'))[RAILS_ENV]

# $redis = Redis.new(:host => config["host"], :port => config["port"])

$redis = Redis.new(:host => config["host"], :port => config["port"])
