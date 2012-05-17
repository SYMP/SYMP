require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :subject => "MyString",
      :message => "MyText",
      :topic_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path(@post), :method => "post" do
      assert_select "input#post_subject", :name => "post[subject]"
      assert_select "textarea#post_message", :name => "post[message]"
      assert_select "input#post_topic_id", :name => "post[topic_id]"
      assert_select "input#post_user_id", :name => "post[user_id]"
    end
  end
end
