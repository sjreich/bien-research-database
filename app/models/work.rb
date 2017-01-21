class Work < ActiveRecord::Base
  include PgSearch

  has_many :authorings, dependent: :destroy
  has_many :authors, through: :authorings

  pg_search_scope :full_search,
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
                  using: {
                    tsearch: {
                      prefix: true,
                      dictionary: 'english',
                    }
                  }

  def self.search(query)
    return all if query.empty?
    full_search(query)
  end

  def author_string
    authors.map(&:to_s).join(', ')
  end
end
