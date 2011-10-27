require 'haml'
require 'sinatra'

get '/' do
  features = Dir.glob('features/*').collect do |filename|
    open(filename) do |file|
      match = /^Feature: (.*)$/.match file.readline
      match.captures[0]
    end
  end

  haml :index, :locals => {
    :pwd => Dir.pwd,
    :features => features
  }
end
