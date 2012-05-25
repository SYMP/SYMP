require 'spec_helper'

describe "searches/new" do
  before(:each) do
    assign(:search, stub_model(Search,
      :user => "MyString",
      :skill => "MyString",
      :city => "MyString"
    ).as_new_record)
  end

  it "renders new search form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => searches_path, :method => "post" do
      assert_select "input#search_user", :name => "search[user]"
      assert_select "input#search_skill", :name => "search[skill]"
      assert_select "input#search_city", :name => "search[city]"
    end
  end
end
