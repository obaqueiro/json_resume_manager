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
 begin 
  json = JSON.parse(request.body.read.to_s)
 rescue => ex
   return "Invalid JSON detected in body, try again.\n"
 end
 missing = ['basics','basics.name', 'basics.email', 'basics.work']
 
 missing.dup.each { |x| missing.delete(x) if json.dig(*x.split('.')) }

 if missing.length > 0 
   return "Missing keys in JSON:  #{missing.join(',')}"
 end
 # validate JSON body
 # Validate required fields
 # Save JSON data in databaase
end

