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

#creates array  [name description], 
get "/galleries/new" do
     erb :new_gallery
end

#then pushes array in Gallery with class to yild new row of data galleries
post "/galleries/gallery" do 
  gallery = Gallery.create(params[gallery])
  redirect to('/galleries/#{gallery}')
end


get "/galleries/:gallery/images/new" do
  @id = Gallery.find_by(params[:gallery])
  erb :new_images
end


post "/galleries/gallery/:images" do
  puts gallery[name] 
end


  get "/galleries/:name"  do
    @name = params[:name]
    @gallery = Gallery.find_by(name: @name)
    @images = @gallery.images
    erb :gallery, :layout => :structure
  end
