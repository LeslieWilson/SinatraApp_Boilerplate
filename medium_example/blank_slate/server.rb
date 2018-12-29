require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require 'csv'
set :bind, '0.0.0.0'

get "/information" do
    @information = []
    CSV.foreach("myfile.csv") do |line|
        @information << [line[0], line[1]]
    end
    erb :information
end
get "/information/new" do
    erb :information
end
post "/information" do
info_name = params["info_name"]
info_description = params["info_description"]
if info_description == 'hello'
    @error = 'err'
    erb :information
else
CSV.open("myfile.csv", "a") do |csv|
  csv << ["title:" + info_name,"description:" + info_description ]
    end
redirect  "/information"
end

end
