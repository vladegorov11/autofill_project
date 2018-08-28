require 'rails_helper'
RSpec.describe Tag, type: :model do

  before(:all) do
    @tag1 = create(:tag)
  end

  context "Associations tests" do
    # it { should have_many(:groups) }
  end

end
