require "rails_helper"

RSpec.describe "/" do
  it "redirects unauthenticated users to the sign up page" do
    get root_path

    expect(response).to redirect_to(new_session_path)
  end

  it "welcomes authenticated users" do
    login(create(:user, username: "username"))

    get root_path

    expect(response.body).to include("Welcome, username")
  end
end
