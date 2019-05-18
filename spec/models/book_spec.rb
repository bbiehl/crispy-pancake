require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { Book.create(name: 'How to be a Fuckface', price: 1.00) }

  context 'when all required fields are filled in' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'name is not filled in' do
    it 'is not valid' do
      subject.update_attributes(name: '')
      expect(subject.errors[:name]).to include("can't be blank") 
    end
  end

  context 'price is not filled in' do
    it 'is not valid' do
      subject.update_attributes(price: nil)
      expect(subject.errors[:price]).to include("can't be blank") 
    end
  end

  context 'price is not a number' do
    it 'is not valid' do
      subject.update_attributes(price: 'number')
      expect(subject.errors[:price]).to include("is not a number") 
    end
  end

  context 'name is not unique' do
    before { Book.create(name: 'Fuck you, you fucking fuck', price: 1.99) }
    subject { Book.create(name: 'Fuck you, you fucking fuck', price: 2.99) }

    it 'is not valid' do
      expect(subject.errors[:name]).to include("has already been taken") 
    end
  end
end


