require 'spec_helper'

describe "ratings/show" do
  before(:each) do
    @rating = assign(:rating, stub_model(Rating,
      :rated_user => 1,
      :rating_user => 2,
      :rating => 3,
      :rating_user_comment => "Rating User Comment",
      :rated_user_comment => "Rated User Comment"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Rating User Comment/)
    rendered.should match(/Rated User Comment/)
  end
end
