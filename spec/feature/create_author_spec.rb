require 'rails_helper'

RSpec.describe 'Creating an author', type: :feature do
  before {visit new_author_path}

  scenario 'valid inputs' do
    fill_in 'Name', with: 'Kenny Loggins'
    click_on 'Create Author'
    expect(page).to have_content('Author was successfully created.')
  end

  scenario 'blank input' do
    fill_in 'Name', with: ''
    click_on 'Create Author'
    expect(page).to have_content("Name can't be blank")
  end
end
