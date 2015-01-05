# -------------------------------------------------------------------
# Kn0xery is a DropBox album gallery

require 'rubygems'
require 'sinatra'
require 'pp'
require 'active_record'
require 'securerandom'
require 'dropbox_sdk'
require 'uri'
require 'httparty'
require 'json'
require 'bcrypt'

require "./models/init"

# Rack will issue a warning if no session secret key is set.  A real web app would not have
# a hard-coded secret in the code but would load it from a config file.
use Rack::Session::Cookie, :secret => 'kljl hjl       ikjhk           98b uhk'

set :port, 5000
enable :sessions

# App Settings
VERSION = '0.7.6'

# Create Database Connection
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => 'db/datastore.db'
)
