require 'rake/testtask'

namespace :db do
  task :environment do
    require 'active_record'
    ActiveRecord::Base.establish_connection(
      :adapter  => 'sqlite3',
      :database => 'db/datastore.db'
    )
  end

  desc 'Migrate the database'
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end

end

task :default => :test

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
end
