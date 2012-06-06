require 'spec_helper'

describe "topics/show" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
<<<<<<< HEAD
      :title => "Title",
      :section_id => 1,
      :user_id => 2
=======
      :title => "Title"
>>>>>>> arne_branch
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
<<<<<<< HEAD
    rendered.should match(/1/)
    rendered.should match(/2/)
=======
>>>>>>> arne_branch
  end
end
