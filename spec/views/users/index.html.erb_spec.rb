require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :name => "Name",
        :pw_hash => "Pw Hash",
        :city => "City"
      ),
      stub_model(User,
        :name => "Name",
        :pw_hash => "Pw Hash",
        :city => "City"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Pw Hash".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
  end
end
