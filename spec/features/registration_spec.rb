require "rails_helper"

RSpec.feature "Registration" do
  scenario "User can register by filling out all fields" do
    visit root_url

    expect(page).to have_text "Sign In"

    click_on "Sign Up"
    fill_in "Username", with: "username"
    fill_in "Password", with: "password"
    click_on "Sign Up"

    expect(page).to have_text("Welcome, username")
    expect(User.count).to eq(1)
    expect(User.last.username).to eq("username")
  end

  scenario "User sees an error if the form is incorrectly filled out" do
    visit new_user_path
    click_on "Sign Up"

    expect(page).to have_text("Username can't be blank")
    expect(page).to have_text("Password can't be blank")
  end
end
