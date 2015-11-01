$LOAD_PATH.unshift File.dirname(__FILE__)
Dir["lib/ruboty/handlers/*.rb"].each { |file| require file }
