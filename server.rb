require 'pathname'

require 'erb'
require 'haml'
require 'sinatra'


set :static, true
set :public_folder, File.dirname(__FILE__) + '/public'


get '/' do
  html = `cucumber -f html`
  html = html.gsub /<Response>/, '&lt;Response&gt;'
  html.gsub /<\/body>/, '<link rel="stylesheet" type="text/css" href="/css/trepang.css" /><script type="text/javascript" src="/js/trepang.js"></script></body>'
end

get '/file/*' do |path|
  base_path = `pwd`

  File.read("#{base_path.chomp}/#{path}")
end

post '/file/*' do |path|
  base_path = `pwd`

  unless params[:content] == ''
    File::open "#{base_path.chomp}/#{path}", 'w' do |f|
      f << params[:content]
    end
  end
end
