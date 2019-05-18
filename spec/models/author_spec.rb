require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'all required fields are present' do
    subject { Author.create(name: 'Michael McDonald') }

    it 'is not valid' do
      expect(subject).to be_valid
    end
  end

  context 'name is not present' do
    subject { Author.create(name: '') }

    it 'is not valid' do
      expect(subject.errors).to have_key(:name)
    end
  end
end
