require 'pathname'

require 'haml'
require 'nokogiri'
require 'sinatra'


set :static, true
set :public_folder, File.dirname(__FILE__) + '/public'


get '/' do
  html = `cucumber -f html`
  doc = Nokogiri::HTML(html)
  nodes = doc.css 'div.step_file'
  nodes.wrap('<a href="#"></a>')
  nodes.each do |path|
    path.parent.attributes['href'].value = path.content
  end
  doc.to_html
end
