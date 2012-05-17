require 'spec_helper'

describe "searches/show" do
  before(:each) do
    @search = assign(:search, stub_model(Search,
      :user => "User",
      :skill => "Skill",
      :city => "City"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/Skill/)
    rendered.should match(/City/)
  end
end
