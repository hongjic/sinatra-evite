require 'sinatra'
require 'active_record'
require 'yaml'

configure (:development) do
  puts "[development environment]"
  env = ENV["SINATRA_ENV"] || "development"
  databases = YAML.load_file("config/database.yml")
  ActiveRecord::Base.establish_connection(databases[env])
end