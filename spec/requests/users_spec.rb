require "rails_helper"

RSpec.describe "GET /users/new" do
  it "renders a successful response" do
    get new_user_url
    expect(response).to be_successful
  end
end

RSpec.describe "POST /users" do
  context "with valid parameters" do
    let(:attributes) do
      {
        username: "username",
        password: "password"
      }
    end

    it "creates a new User" do
      expect {
        post users_url, params: {user: attributes}
      }.to change(User, :count).by(1)
    end

    it "redirects to the home page" do
      post users_url, params: {user: attributes}
      expect(response).to redirect_to(root_url)
    end
  end

  context "with invalid attributes" do
    let(:attributes) do
      {
        username: "username"
      }
    end

    it "does not create a new User" do
      expect {
        post users_url, params: {user: attributes}
      }.to change(User, :count).by(0)
    end

    it "renders a response with 422 status (i.e. to display the 'new' template)" do
      post users_url, params: {user: attributes}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "with a user that already exists" do
    let(:attributes) do
      {
        username: "username",
        password: "password"
      }
    end

    before do
      create(:user, **attributes)
    end

    it "does not create a new User" do
      expect {
        post users_url, params: {user: attributes}
      }.to change(User, :count).by(0)
    end

    it "renders a response with 422 status (i.e. to display the 'new' template)" do
      post users_url, params: {user: attributes}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
