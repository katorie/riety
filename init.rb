Bundler.require(:default, :production) if ENV['IDOBATA_API_TOKEN']

$LOAD_PATH.unshift File.dirname(__FILE__)
Dir["lib/riety/handlers/*.rb"].each { |file| require file }
Dir["lib/riety/actions/*.rb"].each { |file| require file }
Dir["lib/riety/ext/*.rb"].each { |file| require file }
