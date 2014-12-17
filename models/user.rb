class User < ActiveRecord::Base
	Sinatra::SimpleAuthentication.require_adapter
	include Sinatra::SimpleAuthentication::Models::ActiveRecord::Adapter

	has_many :posts
	has_many :neighborhoods
end
