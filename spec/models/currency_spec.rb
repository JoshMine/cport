require 'spec_helper'

describe Currency do

  describe "validates" do
    subject { FactoryGirl.build(:currency) }
    it { should be_valid }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:symbol) }

  end
end
