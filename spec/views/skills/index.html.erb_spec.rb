require 'spec_helper'

describe "skills/index" do
  before(:each) do
    assign(:skills, [
      stub_model(Skill,
        :user_id => 1,
        :skill => "Skill"
      ),
      stub_model(Skill,
        :user_id => 1,
        :skill => "Skill"
      )
    ])
  end

  it "renders a list of skills" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Skill".to_s, :count => 2
  end
end
