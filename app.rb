require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'
require 'mork'

def recognize_instructions(image)
  lines = 10
  sheet = Mork::SheetOMR.new(image, 'layout.yml')
  marks = sheet.mark_array(lines)
  if marks.nil?
    sheet.status
  else
    marks
  end
end

set :public_folder, Proc.new { File.join(root, "www") }

get '/' do
  redirect 'index.html'
end

get '/api' do
  redirect '/help'
end

get '/help' do
  erb :help
end

get '/card' do
  send_file './punchcard.jpg', filename: 'punchcard.jpg', type: 'image/jpeg'
end

get '/instructions' do
  erb :instructions
end

post '/instructions' do
  tempfile = params['file'][:tempfile]
  instructions = recognize_instructions(tempfile.path)
  json instructions
end
