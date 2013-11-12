require 'spec_helper'

describe "loans/index" do
  before(:each) do
    assign(:loans, [
      stub_model(Loan,
        :user_id => 1,
        :category => "Category",
        :loan_type => "Loan Type",
        :amount => 2,
        :term => 3,
        :monthly_payment => 4,
        :rate => "9.99",
        :date_payment => 5,
        :required_payment => false
      ),
      stub_model(Loan,
        :user_id => 1,
        :category => "Category",
        :loan_type => "Loan Type",
        :amount => 2,
        :term => 3,
        :monthly_payment => 4,
        :rate => "9.99",
        :date_payment => 5,
        :required_payment => false
      )
    ])
  end

  it "renders a list of loans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Loan Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
