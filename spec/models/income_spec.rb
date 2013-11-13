require 'spec_helper'

describe Income do

  describe "validates" do
    subject { FactoryGirl.build(:income) }
    it { should be_valid }
    it { should belong_to(:user) }
    it { should belong_to(:currency) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:income_type) }
    it { should validate_presence_of(:date_in) }
  end

end
