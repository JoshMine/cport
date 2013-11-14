require 'spec_helper'

describe Outcome do
  describe "validates" do
    subject { FactoryGirl.build(:outcome) }
    it { should be_valid }
    it { should belong_to(:user) }
    it { should belong_to(:currency) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:outcome_type) }
    it { should validate_presence_of(:date_out) }
  end

end
