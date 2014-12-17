require 'sinatra'
require 'sinatra/activerecord'
require 'active_record'
require 'sinatra/simple-authentication'
require_relative "../config/environments"
require_relative "../models/user"
require_relative "../models/post"
require_relative "../models/neighborhood"

Neighborhood.create([

	{ :title => "Adams Morgan", :body => "DC"},
	{ :title => "U Street", :body => "DC"},
	{ :title => "Petworth", :body => "DC"},
	{ :title => "Shaw", :body => "DC"},
	{ :title => "Dupont Circle", :body => "DC"},
	{ :title => "Georgetown", :body => "DC"},
	{ :title => "Chinatown", :body => "DC"},
	{ :title => "Columbia Heights", :body => "DC"},
	{ :title => "H Street", :body => "DC"},
])