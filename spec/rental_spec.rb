require 'spec_helper'
require_relative '../lib/models/rental'

describe Rental do
  let(:book) { instance_double('Book', rentals: []) }
  let(:person) { instance_double('Person', rentals: []) }

  subject(:rental) { Rental.new('2023-10-10', book, person) }
  describe '#initialize' do
    it 'initializes with a given date, book, and person' do
      expect(rental.date).to eq('2023-10-10')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end
  end
end
