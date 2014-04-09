require 'spec_helper'

feature 'Project manager creates List' do
  scenario 'Successfully' do
    visit new_list_path
    fill_in 'Name', with: 'Grocery List'
    click_button 'Save'
    expect( page ).to have_content('Your new List was created successfully!')
    expect( page ).to have_content('Grocery List')
  end
end