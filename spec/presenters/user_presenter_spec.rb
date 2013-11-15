require 'spec_helper'

describe UserPresenter do
  let(:user) { FactoryGirl.create(:user, :confirmed) }
  let(:currency) { FactoryGirl.create(:currency) }
  let!(:income) { FactoryGirl.create(:income, user: user, amount: 2, currency: currency) }
  let!(:income2) { FactoryGirl.create(:income, user: user, amount: 1, currency: currency) }

  let!(:outcome) { FactoryGirl.create(:outcome, user: user, amount: 3, currency: currency) }
  let!(:outcome2) { FactoryGirl.create(:outcome, user: user, amount: 4, currency: currency) }

  let(:presenter) { UserPresenter.new(user) }

  describe "Initialize" do
    it "should have enabled user" do
      presenter.user.should_not be_blank
      presenter.user.should be_kind_of(User)
    end
  end

  describe "Dashboard" do
    it "should returm arrray #incomes" do
      dashboard_incomes = presenter.dashboard_incomes
      dashboard_incomes.should be_kind_of(Hash)
      dashboard_incomes.should_not be_blank
      month = dashboard_incomes.values
      month.first.should eq({3 => 'USD'})
    end

    it "should returm arrray #outcomes" do
      dashboard_outcomes = presenter.dashboard_outcomes
      dashboard_outcomes.should be_kind_of(Hash)
      dashboard_outcomes.should_not be_blank
      month = dashboard_outcomes.values
      month.first.should eq({7 => 'USD'})
    end
  end

end
