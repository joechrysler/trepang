require 'pathname'

require 'erb'
require 'haml'
require 'sinatra'

require 'config'


set :static, true
set :public_folder, File.dirname(__FILE__) + '/public'


get '/' do
  html = `cucumber -f html`
  html = html.gsub /<Response>/, '&lt;Response&gt;'
  html.gsub /<\/body>/, '<link rel="stylesheet" type="text/css" href="/css/trepang.css" /><script type="text/javascript" src="/js/trepang.js"></script></body>'
end

get '/file/:path' do |path|
  File.read(path)
end
