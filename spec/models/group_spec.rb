require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "create group" do
    let(:first_user){ User.create(name: "jone doe",email: "heaven@gmail.com",password: "abcdefg") }
    let(:second_user){ User.create(name: "jone tim",email: "earth@gmail.com",password: "abcdefg") }
    let(:group_params){ {name: "Station",user_id: user_id} }

    context "create new group" do
      let(:user_id){ first_user.id }

      it "need all item for group" do
        new_contact = Group.new(group_params)
        expect(new_contact.save).to be_truthy
      end
      
    end
  end
end
