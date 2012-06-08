require 'spec_helper'

describe "roles/new" do
  before(:each) do
    assign(:role, stub_model(Role,
      :user_id => 1,
      :role => 1
    ).as_new_record)
  end

  it "renders new role form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => roles_path, :method => "post" do
      assert_select "input#role_user_id", :name => "role[user_id]"
      assert_select "input#role_role", :name => "role[role]"
    end
  end
end
