require 'rails_helper'

RSpec.describe Contact, type: :model do
  let!(:first_user){ User.create(id: 1,name: "jone doe",email: "heaven@gmail.com",password: "abcdefg") }
  let!(:first_group){ Group.create(id: 1,name: "Organization",user_id: first_user.id)}

  let!(:second_user){ User.create(id: 2,name: "jone tim",email: "earth@gmail.com",password: "abcdefg") }
  let!(:second_group){ Group.create(id: 1,name: "Organization",user_id: first_user.id)}

  let!(:contact_params){ {name: "Tim ford",company: "Tomas",address:"123town", email: "fard@test.com",user_id: user_id,group_id: group_id} }

  describe "create new contact" do
    let(:user_id){ first_user.id }
    let(:group_id){ first_group.id }
    context "enter all item" do
      it "need all item for contact" do
        new_contact = Contact.create!(contact_params)
        expect(new_contact.save).to be_truthy
      end
    end

    context "without one item" do
      it "without name is NG" do
        new_contact = Contact.new(contact_params.merge!(name: ""))
        expect(new_contact.save).to be_falsey
      end

      it "without company is OK" do
        new_contact = Contact.new(contact_params.merge!(company: ""))
        expect(new_contact.save).to be_truthy
      end

      it "without email is NG" do
        new_contact = Contact.new(contact_params.merge!(email: ""))
        expect(new_contact.save).to be_falsey
      end

      it "without address is OK" do
        new_contact = Contact.new(contact_params.merge!(address: ""))
        expect(new_contact.save).to be_truthy
      end

      it "without group_id is NG" do
        new_contact = Contact.new(contact_params.merge!(group_id: ""))
        expect(new_contact.save).to be_falsey
      end

      it "without user_id is NG" do
        new_contact = Contact.new(contact_params.merge!(user_id: ""))
        expect(new_contact.save).to be_falsey
      end
    end
  end

  describe "update one contact" do
    let(:user_id){ first_user.id }
    let(:group_id){ first_group.id }
    context "change one item" do
      it "change name" do
        new_contact = Contact.create(contact_params)
        expect{ new_contact.update( name: "Tom ford" )}.to change{ new_contact.name }.from("Tim ford").to("Tom ford")
      end
    end

    context "delete one item" do

    end
  end

  describe "delete one contact" do
    # let(:user_id){ first_user.id }
    # let(:group_id){ first_group.id }
    context "delete his/her own contact" do

    end
  end

  after(:all) { Group.destroy_all }
  after(:all) { User.destroy_all }
end
