require 'spec_helper'

describe "topics/index" do
  before(:each) do
    assign(:topics, [
      stub_model(Topic,
<<<<<<< HEAD
        :title => "Title",
        :section_id => 1,
        :user_id => 2
      ),
      stub_model(Topic,
        :title => "Title",
        :section_id => 1,
        :user_id => 2
=======
        :title => "Title"
      ),
      stub_model(Topic,
        :title => "Title"
>>>>>>> arne_branch
      )
    ])
  end

  it "renders a list of topics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
<<<<<<< HEAD
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
=======
>>>>>>> arne_branch
  end
end
