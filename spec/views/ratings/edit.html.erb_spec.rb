require 'spec_helper'

describe "ratings/edit" do
  before(:each) do
    @rating = assign(:rating, stub_model(Rating,
      :rated_user => 1,
      :rating_user => 1,
      :rating => 1,
      :rating_user_comment => "MyString",
      :rated_user_comment => "MyString"
    ))
  end

  it "renders the edit rating form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ratings_path(@rating), :method => "post" do
      assert_select "input#rating_rated_user", :name => "rating[rated_user]"
      assert_select "input#rating_rating_user", :name => "rating[rating_user]"
      assert_select "input#rating_rating", :name => "rating[rating]"
      assert_select "input#rating_rating_user_comment", :name => "rating[rating_user_comment]"
      assert_select "input#rating_rated_user_comment", :name => "rating[rated_user_comment]"
    end
  end
end
