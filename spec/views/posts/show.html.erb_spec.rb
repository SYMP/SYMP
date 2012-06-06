require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :subject => "Subject",
<<<<<<< HEAD
      :message => "MyText",
      :topic_id => 1,
      :user_id => 2
=======
      :message => "MyText"
>>>>>>> arne_branch
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
<<<<<<< HEAD
    rendered.should match(/1/)
    rendered.should match(/2/)
=======
>>>>>>> arne_branch
  end
end
