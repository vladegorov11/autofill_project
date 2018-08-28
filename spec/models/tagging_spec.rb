require 'rails_helper'
RSpec.describe Tagging, type: :model do

  before(:all) do
    @tagging1 = create(:tagging)
  end

  context "Associations tests" do
    # it { should belong_to(:group) }
    # it { should belong_to(:tag) }
  end

end
