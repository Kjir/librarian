require 'dm-migrations'

desc "migrates the db"
task :migrate do
  require './server'
  DataMapper.auto_migrate!
end

desc "upgrades the db"
task :upgrade do
  require './server'
  DataMapper.auto_upgrade! 
end