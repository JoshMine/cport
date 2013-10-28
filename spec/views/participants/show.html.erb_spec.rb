require 'spec_helper'

describe "participants/show" do
  before(:each) do
    @participant = assign(:participant, stub_model(Participant,
      :last_name => "",
      :first_name => "First Name",
      :middle_name => "Middle Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/First Name/)
    rendered.should match(/Middle Name/)
  end
end
