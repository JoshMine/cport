require 'spec_helper'

describe "participants/index" do
  before(:each) do
    assign(:participants, [
      stub_model(Participant,
        :last_name => "",
        :first_name => "First Name",
        :middle_name => "Middle Name"
      ),
      stub_model(Participant,
        :last_name => "",
        :first_name => "First Name",
        :middle_name => "Middle Name"
      )
    ])
  end

  it "renders a list of participants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
  end
end
