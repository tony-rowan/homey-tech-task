require 'rails_helper'

RSpec.describe "GET /sessions/new" do
  it "returns http success" do
    get new_session_url

    expect(response).to have_http_status(:success)
  end
end

RSpec.describe "POST /session" do
  context "with good credentials" do
    let(:credentials) do
      {
        username: "username",
        password: "password"
      }
    end

    before do
      create(:user, **credentials)
    end

    it "redirects the user to the home page" do
      post session_url, params: { session_authentication: credentials }

      expect(response).to redirect_to(root_url)
    end
  end

  context "with bad credentials" do
    let(:credentials) do
      {
        username: "username"
      }
    end

    it "responds with a 422" do
      post session_url, params: { session_authentication: credentials }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

RSpec.describe "DELETE /session" do
  before do
    login(create(:user))
  end

  it "redirects the user to the sign in page" do
    delete session_url

    expect(response).to redirect_to(new_session_url)
  end

  it "clears the user_id cookie" do
    delete session_url

    expect(cookies["user_id"]).to eq("")
  end
end
