require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/bookmarker')



#New
get '/bookmarker/new' do
  erb(:new)
end

#Create
post '/bookmarker'  do
  @bookmark = Bookmarker.new(params)
  @bookmark.save
  erb(:create)
end


#Index
get '/bookmarker' do
  @bookmark = Bookmarker.all
  erb(:index)
end


#Show
get '/bookmarker/:id' do
  @bookmark = Bookmarker.select(params[:id])
  erb(:show)
end



#Edit
get '/bookmarker/:id/edit'  do
  @bookmark = Bookmarker.select(params[:id])
  erb(:edit)
end


#Update
post '/bookmarker/:id' do
  @bookmark = Bookmarker.update(params)
  redirect to ("/bookmarker/#{params[:id]}")

end


#Destroy
post '/bookmarker/:id/delete'  do
 Bookmarker.destroy(params[:id])
 redirect to ("/bookmarker")
end

