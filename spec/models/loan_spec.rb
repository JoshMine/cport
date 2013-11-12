require 'spec_helper'

describe Loan do
  describe "validates" do
    subject { FactoryGirl.build(:loan) }
    it { should be_valid }
    it { should belong_to(:user) }
    it { should belong_to(:currency) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:date_payment) }
    it { should validate_presence_of(:issue_date) }
    it { should validate_presence_of(:loan_type) }
    it { should validate_presence_of(:monthly_payment) }
    it { should validate_presence_of(:rate) }
    it { should validate_presence_of(:term) }
  end
end
