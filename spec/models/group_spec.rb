require 'rails_helper'
RSpec.describe Group, type: :model do

  before(:all) do
    @group1 = create(:group)
  end

  context "validations tests" do
    it {should validate_presence_of(:name)}
    it {should allow_value("title one").for(:name)}
    it {should_not allow_value("", "hello"*50).for(:name)}
    it {should validate_presence_of(:description)}
    it {should allow_value("i"*20).for(:description)}
    it {should_not allow_value("", "hello"*200).for(:description)}
  end

  context "Associations tests" do
    it { should belong_to(:project) }
    it { should have_many(:tags) }
  end
end
