require 'spec_helper'

describe "relationships/new" do
  before(:each) do
    assign(:relationship, stub_model(Relationship).as_new_record)
  end

  it "renders new relationship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => relationships_path, :method => "post" do
    end
  end
end
