require 'pathname'

require 'haml'
require 'sinatra'


set :static, true
set :public_folder, File.dirname(__FILE__) + '/public'


get '/' do
  `cucumber -f html`
end
