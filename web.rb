require "bundler/setup"
require "sinatra"
require "haml"
require './web_interface'

configure do
  set :haml, {:format => :html5, :escape_html => true}
end


get '/' do
     haml :index
end

post '/process' do
  web_interface = WebInterface.new(params[:start], params[:end])
  web_interface.setup_engine
  web_interface.processing
end
