require "rails_helper"

RSpec.describe "Projects" do
  it "User can see the list of projects" do
    create(:project, name: "Project One", status: "To Do")
    create(:project, name: "Project Two", status: "Done")

    login(create(:user))
    visit(root_path)

    expect(page).to have_text("Project One - To Do")
    expect(page).to have_text("Project Two - Done")
  end

  it "User can view a single project" do
    create(:project, name: "Project Name", status: "Project Status")

    login(create(:user))
    visit(root_path)
    click_on("View")

    expect(page).to have_text("Project Name")
    expect(page).to have_text("Status: Project Status")
  end

  it "User can create a new project" do
    login(create(:user))
    visit(root_path)
    click_on("Add Project")
    fill_in("Name", with: "Project Name")
    fill_in("Status", with: "Project Status")
    click_on("Add")

    expect(page).to have_text("Project Name - Project Status")
    expect(Project.count).to eq(1)
  end

  it "User can edit an existing project" do
    create(:project, name: "Old Project Name", status: "Old Project Status")

    login(create(:user))
    visit(root_path)
    click_on("Edit")
    fill_in("Name", with: "New Project Name")
    fill_in("Status", with: "New Project Status")
    click_on("Update")

    expect(page).to have_text("New Project Name - New Project Status")
  end

  it "User can delete an existing project" do
    create(:project, name: "Project Name", status: "Project Status")

    login(create(:user))
    visit(root_path)
    click_on("Delete")

    expect(page).not_to have_text("Project Name - Project Status")
  end
end
