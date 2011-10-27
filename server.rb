require 'pathname'

require 'haml'
require 'sinatra'


set :static, true
set :public_folder, File.dirname(__FILE__) + '/public'


get '/' do
  feature_links = {}

  Dir.glob('features/*.feature').each do |filename|
    link = /^features\/(.*)\.feature/.match(filename).captures[0]
    feature_name = get_feature_name(filename)
    feature_links[link] = feature_name
  end

  haml :index, :locals => {
    :pwd => Dir.pwd,
    :features => feature_links
  }
end


get '/features/:feature' do |feature_name|
  filename = get_feature_filename(feature_name)
  feature_name = get_feature_name(filename)

  haml :feature, :locals => {
    :pwd => Dir.pwd,
    :feature => feature_name,
    :spec => get_feature_spec(filename)
  }
end


post '/features/:feature' do |feature_name|
  filename = get_feature_filename(feature_name)

  File.open(filename, 'w') do |file|
    file.puts params[:spec]
  end

  haml :feature, :locals => {
    :pwd => Dir.pwd,
    :feature => feature_name,
    :spec => params[:spec]
  }
end


post '/api/run' do
  `cucumber`
end


def get_feature_filename(feature_name)
  "features/#{feature_name}.feature"
end


def get_feature_name(filename)
  open(filename) do |file|
    /^Feature: (.*)$/.match(file.readline).captures[0]
  end
end


def get_feature_spec(filename)
  open(filename).read
end
