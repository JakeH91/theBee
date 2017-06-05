# if Rails.env.production?
# 	$redis = Redis.new(url: ENV["REDIS_URL"])
# elsif Rails.env.development?
# 	$redis = Redis.new(:host => 'localhost', :port => 6379)
# end

uri = URI.parse(ENV["REDIS_URL"] || "redis://localhost:6379/" )
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)