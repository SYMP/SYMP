require 'spec_helper'

describe "relationships/index" do
  before(:each) do
    assign(:relationships, [
      stub_model(Relationship),
      stub_model(Relationship)
    ])
  end

  it "renders a list of relationships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
