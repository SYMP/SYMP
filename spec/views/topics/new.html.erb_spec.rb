require 'spec_helper'

describe "topics/new" do
  before(:each) do
    assign(:topic, stub_model(Topic,
<<<<<<< HEAD
      :title => "MyString",
      :section_id => 1,
      :user_id => 1
=======
      :title => "MyString"
>>>>>>> arne_branch
    ).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path, :method => "post" do
      assert_select "input#topic_title", :name => "topic[title]"
<<<<<<< HEAD
      assert_select "input#topic_section_id", :name => "topic[section_id]"
      assert_select "input#topic_user_id", :name => "topic[user_id]"
=======
>>>>>>> arne_branch
    end
  end
end
