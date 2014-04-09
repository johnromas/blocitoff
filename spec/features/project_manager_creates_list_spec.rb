require 'spec_helper'

feature 'Project manager creates List' do
  scenario 'Successfully' do
    visit new_list_path
  end
end