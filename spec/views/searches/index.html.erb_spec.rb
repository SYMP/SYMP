require 'spec_helper'

describe "searches/index" do
  before(:each) do
    assign(:searches, [
      stub_model(Search,
        :user => "User",
        :skill => "Skill",
        :city => "City"
      ),
      stub_model(Search,
        :user => "User",
        :skill => "Skill",
        :city => "City"
      )
    ])
  end

  it "renders a list of searches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Skill".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end
end
