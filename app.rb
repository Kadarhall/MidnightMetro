require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


require 'sinatra/simple-authentication'
#require './models/user'
#require 'rack-flash'


require_relative './models/user'
require_relative './config/environments'
require_relative './models/neighborhood'
require_relative './models/post'

register Sinatra::SimpleAuthentication

#use Rack::Flash, :sweep => true


Sinatra::SimpleAuthentication.configure do |c|
	c.use_password_confirmation = true
	c.min_password_length = 6
	c.max_password_length = 20
	c.taken_email_message = "Custom taken email"
	c.missing_email_message = "Custom missing email"
	c.invalid_email_message = "Custom invalid email"
	c.missing_password_message = "Custom missing password"
	c.short_password_message = "Custom short password"
	c.long_password_message = "Custom long password"
	c.missing_password_confirmation_message = "Custom missing password confirmation"
	c.password_confirmation_dont_match_password_message = "Custom doesn't match password and confirmation"
	c.login_wrong_email_message = "Custom wrong email"
	c.login_wrong_password_message = "Custom wrong password"
	c.login_successful_message = "Custom Login successful"
end



get '/' do
	login_required
	#erb :index
	redirect '/main_page'
end



get '/main_page' do
	@all_neighborhoods = Neighborhood.all
	erb :main_page
end

# get '/neighborhoods/:neighborhood_id' do
# 	@posts = Post.where(neighborhood_id: params[:neighborhood_id])
# 	erb :neighborhoods	
# end


post '/new_form' do
	@user_id = current_user.id
	@post_title = params[:title]
	@post_description = params[:body]
	@neighborhood_id = params[:neighborhood_id]

	@post = Post.new(title: @post_title, body: @post_description, user_id: @user_id, neighborhood_id: @neighborhood_id)
	@post.save


	if @post.save
		redirect "/neighborhoods/#{@neighborhood_id}/posts"
		erb :template
	else
		@post_errors = @post.errors.full_messages
		puts @post_errors
	end
	
end


get '/neighborhoods/:neighborhood_id/posts' do
	@neighborhood_title = params[:title]
	@neighborhood = Neighborhood.find(params[:neighborhood_id])
	@neighborhood_id = params[:neighborhood_id]
	@all_posts = Post.where(neighborhood_id: params[:neighborhood_id])
	erb :template
end

get '/new_form' do
	erb :template
end

# get '/adams_morgan'
# 	erb :adams_morgan_form
# end

# post 'adams_morgan_form'
# 	erb :
# end

# get '/new_thing/:thing' do
# 	@whatever_we_want = params[:thing]
# 	erb :someview
# end

get '/delete/:post_id' do
	@post = Post.find(params[:post_id])
	@post_id = @post.id
	erb :delete
end

get '/delete/:post_id/delete' do
	@post = Post.find(params[:post_id])
	@post_id = @post.id
	@neighborhood_id = @post.neighborhood.id
	puts @post.title
	@post.destroy
	redirect '/'
end
