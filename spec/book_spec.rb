require 'spec_helper'
require_relative '../lib/models/book'

describe Book do
  subject(:book) { Book.new('Sample Title', 'Sample Author') }

  describe '#initialize' do
    it 'initializes with given title and author' do
      expect(book.title).to eq('Sample Title')
      expect(book.author).to eq('Sample Author')
    end
  end
end
