require 'rails_helper'
RSpec.describe User, type: :model do

  before(:all) do
    @user1 = create(:user)
  end

  context "Associations tests" do
    it { expect(@user1).to have_many(:projects).dependent(:destroy) }
  end

  context "validations tests" do
    it {should validate_presence_of(:email)}
    it {should allow_value("user@example.com").for(:email)}
    it {should_not allow_value("not-an-email").for(:email)}
  end
end
