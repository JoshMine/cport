require 'spec_helper'

describe WishDecorator do
  let(:wish) { FactoryGirl.create(:wish) }
  let(:decorated) { wish.decorate }

  describe "#amount_currency" do
    it "should should be string" do
      decorated.amount_currency.should be_kind_of(String)
    end

    it "should be present" do
      decorated.amount_currency.should_not be_blank
    end

    it "should have amount" do
      decorated.amount_currency.should match(/\d+/)
    end
  end

  describe "#need_amount_currency" do
    it "should should be string" do
      decorated.need_amount_currency.should be_kind_of(String)
    end

    it "should be present" do
      decorated.need_amount_currency.should_not be_blank
    end

    it "should have amount" do
      decorated.need_amount_currency.should match(/\d+/)
    end
  end

end
