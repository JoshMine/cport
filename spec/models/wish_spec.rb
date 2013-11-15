require 'spec_helper'

describe Wish do
  describe "#validation" do
    subject { FactoryGirl.build(:wish) }
    it { should be_valid }
    it { should belong_to(:user) }
    it { should belong_to(:currency) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:need_amount) }
    it { should validate_presence_of(:final_date) }
  end
end
