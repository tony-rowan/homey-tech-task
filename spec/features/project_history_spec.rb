require "rails_helper"

RSpec.describe "Project History" do
  it "The project page should show the full history" do
    project = create(:project, status: "To Do")

    project.update(status: "In Progress")
    create(:comment, body: "Comment One", project: project)
    create(:comment, body: "Comment Two", project: project)
    project.update(status: "Done")

    login(create(:user))
    visit(project_path(project))

    expect(page).to have_text(project.name)
    expect(page).to have_text("Status: Done")
    expect(page).to have_text("To Do")
    expect(page).to have_text("Comment One")
    expect(page).to have_text("Comment Two")
    expect(page).to have_text("Done")
  end
end
