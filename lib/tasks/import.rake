require 'csv_importer'

namespace :import do
  desc 'Import list of works from CSV'
  task :works_csv => :environment do
    CsvImporter.import_works('doc/sample_database_schema.csv')
  end
end
