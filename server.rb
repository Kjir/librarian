require 'data_mapper'
require 'sinatra'
require 'json'

require './models/init'
require './routes/init'

configure :development do
  DataMapper::Logger.new($stdout, :debug)
end

DataMapper.setup(:default, 'mysql://kjir@127.0.0.1/c9')
DataMapper.finalize

set :port, ENV['PORT']
set :show_exceptions, :after_handler

not_found do
  'Could not find the requested resource. Are you lost?'
end

error do
  logger.error 'There was an error: ' + env['sinatra.error']
  'There was an error processing your request. Please contact the administrator.'
end