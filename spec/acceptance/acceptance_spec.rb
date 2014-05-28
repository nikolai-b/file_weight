require 'spec_helper'

feature "Find file weights", type: :feature do
  scenario "User enters Work Share details and is shown file weights" do
    enter_workshare_details

    see_file_weight
  end

  def enter_workshare_details
    visit "/"
    fill_in :email,    with: env_email
    fill_in :password, with: env_password
    fill_in :api_uuid, with: env_api_uuid

    click_on 'Save'
  end

  def see_file_weight
    expect(page).to have_content "File weight is"
  end
end

