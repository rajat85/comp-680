require 'sinatra'
require 'dotenv/load'
require_relative './app'

run Sinatra::Application

