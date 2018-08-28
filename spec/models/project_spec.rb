require 'rails_helper'
RSpec.describe Project, type: :model do

  before(:all) do
    @project1 = create(:project)
  end

  context "validations tests" do

    it "is valid with valid attributes" do
      expect(@project1).to be_valid
    end

    it "is not valid without a title" do
      project2 = build(:project, title: "")
      expect(project2).to_not be_valid
    end

    it "is not valid without a description" do
      project2 = build(:project, description: "")
      expect(project2).to_not be_valid
    end

    it "is not valid without a project type" do
      project2 = build(:project, project_type: "")
      expect(project2).to_not be_valid
    end

    it "is not valid ptoject_type without domain" do
      project2 = build(:project, project_type: 0)
      expect(project2).to_not be_valid
    end

    it "is valid ptoject_type without domain" do
      project2 = build(:project, project_type: 1)
      expect(project2).to be_valid
    end

    it "default archiveed type" do
      expect(@project1.archived).to eq(false)
    end

    it "Availability check api and auth token" do
      expect(@project1.api_token && @project1.auth_token).to_not be_nil
    end
  end

  context "Associations tests" do
    it { should belong_to(:user) }
    it { should have_many(:groups) }
  end

end
