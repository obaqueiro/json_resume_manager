require 'sinatra'
require 'erb'
require 'redcarpet'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true,
     fenced_code_blocks: true)

get '/' do
  markdown.render(ERB.new(File.read('./views/greeting.erb')).result())
end

get '/resume' do
 markdown.render( ERB.new(File.read('./views/instructions.erb')).result())
end

post '/resume' do
 # validate JSON body
 # Validate required fields
 # Save JSON data in databaase
end

