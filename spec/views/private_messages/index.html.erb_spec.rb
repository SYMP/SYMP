require 'spec_helper'

describe "private_messages/index" do
  before(:each) do
    assign(:private_messages, [
      stub_model(PrivateMessage,
        :sender => 1,
        :recipient => 2,
        :message => "MyText",
        :unread => false
      ),
      stub_model(PrivateMessage,
        :sender => 1,
        :recipient => 2,
        :message => "MyText",
        :unread => false
      )
    ])
  end

  it "renders a list of private_messages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
