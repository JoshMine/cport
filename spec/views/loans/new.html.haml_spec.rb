require 'spec_helper'

describe "loans/new" do
  before(:each) do
    assign(:loan, stub_model(Loan,
      :user_id => 1,
      :category => "MyString",
      :loan_type => "MyString",
      :amount => 1,
      :term => 1,
      :monthly_payment => 1,
      :rate => "9.99",
      :date_payment => 1,
      :required_payment => false
    ).as_new_record)
  end

  it "renders new loan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", loans_path, "post" do
      assert_select "input#loan_user_id[name=?]", "loan[user_id]"
      assert_select "input#loan_category[name=?]", "loan[category]"
      assert_select "input#loan_loan_type[name=?]", "loan[loan_type]"
      assert_select "input#loan_amount[name=?]", "loan[amount]"
      assert_select "input#loan_term[name=?]", "loan[term]"
      assert_select "input#loan_monthly_payment[name=?]", "loan[monthly_payment]"
      assert_select "input#loan_rate[name=?]", "loan[rate]"
      assert_select "input#loan_date_payment[name=?]", "loan[date_payment]"
      assert_select "input#loan_required_payment[name=?]", "loan[required_payment]"
    end
  end
end
