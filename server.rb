require 'sinatra'
GALLERIES = {
  "cats" =>  ["fancat.jpg", "fatcat.jpg", "windowcat.jpg"],
  "dogs" => ["doge1.jpg", "doge2.jpg", "such-logo.gif"]
}

get "/" do
  @galleries = GALLERIES.keys
  erb :index, :layout => :structure
end


get "/:name" do
  @name = params[:name]
  @filenames = GALLERIES[@name]
  if GALLERIES.has_key?(@name)
  erb :gallery, :layout => :structure
  else
    erb :error, :layout => :structure
  end
end
