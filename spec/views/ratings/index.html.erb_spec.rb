require 'spec_helper'

describe "ratings/index" do
  before(:each) do
    assign(:ratings, [
      stub_model(Rating,
        :rated_user => 1,
        :rating_user => 2,
        :rating => 3,
        :rating_user_comment => "Rating User Comment",
        :rated_user_comment => "Rated User Comment"
      ),
      stub_model(Rating,
        :rated_user => 1,
        :rating_user => 2,
        :rating => 3,
        :rating_user_comment => "Rating User Comment",
        :rated_user_comment => "Rated User Comment"
      )
    ])
  end

  it "renders a list of ratings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Rating User Comment".to_s, :count => 2
    assert_select "tr>td", :text => "Rated User Comment".to_s, :count => 2
  end
end
