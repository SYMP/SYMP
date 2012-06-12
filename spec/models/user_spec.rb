require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"

  it { should respond_to(:relationships) }
  it { should respond_to(:followed_users) }
	it { should respond_to(:reverse_relationships) }
  	it { should respond_to(:followers) }
  .
  .

  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }
  .
  .
  .
  describe "following" do
    let(:other_user) { FactoryGirl.create(:user) }    
    before do
      @user.save
      @user.follow!(other_user)
    end
    describe "and unfollowing" do
      before { @user.unfollow!(other_user) }

    	it { should be_following(other_user) }
    	its(:followed_users) { should include(other_user) }

    	describe "followed user" do
      		subject { other_user }
      		its(:followers) { should include(@user) }
    	end
	end
  end
end
