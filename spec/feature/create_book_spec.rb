require 'rails_helper'

RSpec.describe 'Creating an book', type: :feature do
  before {visit new_book_path}

  scenario 'valid inputs' do
    fill_in 'Name', with: 'How to not suck at Ruby on Rails'
    fill_in 'Price', with: 15.99
    click_on 'Create Book'
    expect(page).to have_content('Book was successfully created.')
  end

  scenario 'blank name' do
    fill_in 'Name', with: ''
    fill_in 'Price', with: 15.99
    click_on 'Create Book'
    expect(page).to have_content("Name can't be blank")
  end

  scenario 'blank price' do
    fill_in 'Name', with: 'How to not suck at Ruby on Rails'
    fill_in 'Price', with: nil
    click_on 'Create Book'
    expect(page).to have_content("Price can't be blank")
  end
end
