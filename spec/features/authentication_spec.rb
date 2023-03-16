require "rails_helper"

RSpec.describe "Authentication" do
  it "User signs in after providing correct credentials" do
    create(:user, username: "username", password: "password")

    visit(root_path)
    fill_in("Username", with: "username")
    fill_in("Password", with: "password")
    click_on("Sign In")

    expect(page).to have_text("Welcome, username")
  end

  it "User sees an error after using bad credentials" do
    visit(root_path)
    fill_in("Username", with: "username")
    fill_in("Password", with: "password")
    click_on("Sign In")

    expect(page).to have_text("Could not log you in with those credentials")
  end

  it "User can sign out" do
    login(create(:user))

    visit(root_path)
    click_on("Sign Out")

    expect(page).to have_text("Sign In")
  end
end
