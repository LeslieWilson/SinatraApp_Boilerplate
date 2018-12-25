require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require 'csv'



set :bind, '0.0.0.0'

get "/articles" do
    erb :home

end

get "/articles/new" do
    erb :articles
end



post "/articles" do
article_name = params["article_name"]
article_description = params["article_description"]

CSV.open("myfile.csv", "a") do |csv|
  csv << ["title:" + article_name]
  csv << ["description:" + article_description]
end

redirect  "/articles"
end