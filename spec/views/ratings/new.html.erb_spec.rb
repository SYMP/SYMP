require 'spec_helper'

describe "ratings/new" do
  before(:each) do
    assign(:rating, stub_model(Rating,
      :rated_user => 1,
      :rating_user => 1,
      :rating => 1,
      :rating_user_comment => "MyString",
      :rated_user_comment => "MyString"
    ).as_new_record)
  end

  it "renders new rating form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ratings_path, :method => "post" do
      assert_select "input#rating_rated_user", :name => "rating[rated_user]"
      assert_select "input#rating_rating_user", :name => "rating[rating_user]"
      assert_select "input#rating_rating", :name => "rating[rating]"
      assert_select "input#rating_rating_user_comment", :name => "rating[rating_user_comment]"
      assert_select "input#rating_rated_user_comment", :name => "rating[rated_user_comment]"
    end
  end
end
