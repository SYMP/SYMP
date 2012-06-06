require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :subject => "Subject",
<<<<<<< HEAD
        :message => "MyText",
        :topic_id => 1,
        :user_id => 2
      ),
      stub_model(Post,
        :subject => "Subject",
        :message => "MyText",
        :topic_id => 1,
        :user_id => 2
=======
        :message => "MyText"
      ),
      stub_model(Post,
        :subject => "Subject",
        :message => "MyText"
>>>>>>> arne_branch
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
<<<<<<< HEAD
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
=======
>>>>>>> arne_branch
  end
end
