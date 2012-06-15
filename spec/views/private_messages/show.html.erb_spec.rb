require 'spec_helper'

describe "private_messages/show" do
  before(:each) do
    @private_message = assign(:private_message, stub_model(PrivateMessage,
      :sender => 1,
      :recipient => 2,
      :message => "MyText",
      :unread => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
