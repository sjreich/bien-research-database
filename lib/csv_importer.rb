require 'csv'

class CsvImporter
  class << self
    def import_works(path)
      file_contents = File.read(path)
      csv = CSV.parse(file_contents, headers: true)

      ActiveRecord::Base.transaction do
        csv.each do |row|
          Work.create! params(row.to_hash)
        end
      end
    end

    private

    # rubocop:disable Metrics/MethodLength
    def params(data)
      {
        title: data['Title'],
        bibliographic_entry: data['Bibliographic Entry'],
        keywords: data['Keywords'],
        link: data['Link'],
        language: data['Language'],
        type_of_work: data['Type'],
        journal: data['Journal'],
        publication_date: publication_date(data['Date']),
        authors: authors(data),
      }
    end
    # rubocop:enable Metrics/MethodLength

    def publication_date(date_string)
      return unless date_string.present?
      Date.parse(date_string)
    end

    def authors(data)
      author_params = data.map do |key, value|
        next unless /author \d (first|last)/i =~ key
        next [:first_name, value] if /first/i =~ key
        [:last_name, value] if /last/i =~ key
      end.compact

      author_params.each_slice(2).map do |author_data|
        next unless author_data.to_h.values.any?
        Author.find_or_create_by(author_data.to_h)
      end.compact
    end
  end
end
