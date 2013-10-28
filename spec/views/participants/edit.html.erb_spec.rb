require 'spec_helper'

describe "participants/edit" do
  before(:each) do
    @participant = assign(:participant, stub_model(Participant,
      :last_name => "",
      :first_name => "MyString",
      :middle_name => "MyString"
    ))
  end

  it "renders the edit participant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => participants_path(@participant), :method => "post" do
      assert_select "input#participant_last_name", :name => "participant[last_name]"
      assert_select "input#participant_first_name", :name => "participant[first_name]"
      assert_select "input#participant_middle_name", :name => "participant[middle_name]"
    end
  end
end
