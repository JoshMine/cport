require 'spec_helper'

describe "loans/show" do
  before(:each) do
    @loan = assign(:loan, stub_model(Loan,
      :user_id => 1,
      :category => "Category",
      :loan_type => "Loan Type",
      :amount => 2,
      :term => 3,
      :monthly_payment => 4,
      :rate => "9.99",
      :date_payment => 5,
      :required_payment => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Category/)
    rendered.should match(/Loan Type/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/9.99/)
    rendered.should match(/5/)
    rendered.should match(/false/)
  end
end
