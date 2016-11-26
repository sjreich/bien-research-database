require 'rails_helper'

RSpec.describe Work, type: :model do
  it { should have_many(:authors) }

  describe 'author_string' do
    subject { Work.new }
    let(:author_1) { Author.new(first_name: 'Abraham', last_name: 'Lincoln') }
    let(:author_2) { Author.new(first_name: 'Teddy', last_name: 'Roosevelt') }
    before { subject.authors = [author_1, author_2] }

    its(:author_string) { is_expected.to eq 'Abraham Lincoln, Teddy Roosevelt' }
  end
end
