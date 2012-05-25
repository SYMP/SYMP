require 'spec_helper'

describe "sections/new" do
  before(:each) do
    assign(:section, stub_model(Section,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sections_path, :method => "post" do
      assert_select "input#section_title", :name => "section[title]"
      assert_select "textarea#section_description", :name => "section[description]"
    end
  end
end
