require 'spec_helper'

describe "user_sessions/index" do
  before(:each) do
    assign(:user_sessions, [
      stub_model(UserSession),
      stub_model(UserSession)
    ])
  end

  it "renders a list of user_sessions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
