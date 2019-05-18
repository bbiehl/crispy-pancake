require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'name is not present' do
    subject { Author.create(name: '') }

    it 'is not valid' do
      expect(subject.errors).to have_key(:name)
    end
  end
end
