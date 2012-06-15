require 'spec_helper'

describe "private_messages/new" do
  before(:each) do
    assign(:private_message, stub_model(PrivateMessage,
      :sender => 1,
      :recipient => 1,
      :message => "MyText",
      :unread => false
    ).as_new_record)
  end

  it "renders new private_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => private_messages_path, :method => "post" do
      assert_select "input#private_message_sender", :name => "private_message[sender]"
      assert_select "input#private_message_recipient", :name => "private_message[recipient]"
      assert_select "textarea#private_message_message", :name => "private_message[message]"
      assert_select "input#private_message_unread", :name => "private_message[unread]"
    end
  end
end
