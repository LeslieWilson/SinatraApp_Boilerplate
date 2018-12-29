require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require 'csv'
set :bind, '0.0.0.0'

get "/information" do
    @information = []
    CSV.foreach("myfile.csv") do |line|
        @information << line
    end

    erb :information
    end


post "/information" do
@info_name = params[:info_name]
@info_description = params[:info_description]

CSV.open("myfile.csv", "a") do |csv|
  csv << [:info_name]
    end
redirect "/information"
end
