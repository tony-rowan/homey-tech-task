require "rails_helper"

RSpec.describe "Projects" do
  it "User can view the comments on a project" do
    project = create(:project)
    create(
      :comment,
      body: "Comment Body",
      user: create(:user, username: "User"),
      project: project
    )

    login(create(:user))
    visit(project_path(project))

    expect(page).to have_text("Comment Body")
  end

  it "User can add a comment to a project" do
    project = create(:project)

    login(create(:user))
    visit(project_path(project))
    click_on("Add Comment")
    fill_in("Add a Comment", with: "Comment Body")
    click_on("Add")

    expect(page).to have_text("Comment Body")
    expect(Comment.count).to eq(1)
  end
end
