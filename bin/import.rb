#!/usr/bin/env ruby

require 'bundler'

Bundler.require
Dotenv.load
$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"

require 'logger'
require 'instagram_subscribers_importer'

InstagramSubscribersImporter.import!(
  google_service_key: ENV.fetch('GOOGLE_SERVICE_KEY'),
  sheet_id:  ENV.fetch('SHEET_ID'),
  logger: $stdout
)
