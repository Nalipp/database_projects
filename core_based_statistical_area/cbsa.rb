require 'pry'

require "sinatra"
require "sinatra/content_for"
require "tilt/erubis"

require_relative "sequel_persistence"

configure do
  enable :sessions
  set :session_secret, "secret"
  set :erb, escape_html: true
  set :port, 8787
end

configure(:development) do
  require "sinatra/reloader"
  also_reload "sequel_persistence.rb"
end

before do
  @storage = SequelPersistence.new(logger)
end

get "/" do
  redirect "/query_results"
end

get "/query_results" do
  erb :query_results, layout: :layout
end