class Work < ActiveRecord::Base
  include PgSearch

  has_many :authorings, dependent: :destroy
  has_many :authors, through: :authorings

  PG_SEARCH_CONFIG = {
    tsearch: {
      prefix: true,
      dictionary: 'english',
    }
  }.freeze

  pg_search_scope :search_by_full_search,
                  against: [
                    :title,
                    :journal,
                    :keywords,
                  ],
                  associated_against: {
                    authors: [
                      :first_name,
                      :last_name,
                    ]
                  },
                  using: PG_SEARCH_CONFIG

  pg_search_scope :search_by_title, against: [:title], using: PG_SEARCH_CONFIG
  pg_search_scope :search_by_keywords, against: [:keywords], using: PG_SEARCH_CONFIG

  scope :search_by_language, -> (language) { where(language: language) }
  scope :search_by_author, -> (author) { joins(:authors).where(authors: { id: author }).uniq }
  scope :search_by_type_of_work, -> (type_of_work) { where(type_of_work: type_of_work) }
  scope :search_by_published_after, -> (date) { where('publication_date > ?', date) }
  scope :search_by_published_before, -> (date) { where('publication_date < ?', date) }

  def self.search(params)
    params.reduce(all) do |results, (param, value)|
      results.send("search_by_#{param}", value)
    end
  end

  def author_string
    authors.map(&:to_s).to_sentence
  end
end
