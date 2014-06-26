require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "pixtr"
)

class Gallery < ActiveRecord::Base
  has_many :images
end

class Image < ActiveRecord::Base
end

get "/" do
  @galleries = Gallery.all
  erb :index, :layout => :structure
end

get "/galleries/new" do
  erb :new_gallery
end

post "/galleries" do 
  gallery = Gallery.new(params[:gallery])
  gallery.save
  redirect to('/')
end

get "/:name" do
  @name = params[:name]
  @gallery = Gallery.find_by(name: @name)
  @images = @gallery.images
  erb :gallery, :layout => :structure
end
