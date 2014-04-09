require 'spec_helper'

feature 'User creates Todo' do
  scenario 'Successfully' do
    visit new_todo_path
    fill_in 'Desc' with: 'Buy Milk'
  end
end