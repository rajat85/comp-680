# frozen_string_literal: true

require 'sinatra'
require_relative 'slack_bot'

post '/' do
  content_type :json
  slack_request = SlackBot.post_reminder(params[:text], params[:channel_id])
  status slack_request.response.code
end

post '/cloudwatch' do

end
