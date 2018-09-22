require 'rails_helper'

RSpec.describe Contact, type: :model do
  let!(:user){ User.create(id: 1,name: "jone doe",email: "heaven@gmail.com",password: "abcdefg") }
  let!(:group){ Group.create(id: 1,name: "Organization",user_id: user.id)}
  let!(:group_id){ group.id }
  let!(:user_id){ user.id }
  let!(:contact_params){ {name: "Tim ford",company: "Tomas",address:"123town", email: "fard@test.com",group_id: 1,user_id: 1} }

  describe "create new contact" do
    context "enter all item" do
      it "need all item for contact" do
        new_contact = Contact.create!(contact_params)
        expect(Contact.count).to eq 1
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

    after(:all) { Group.destroy_all }
    after(:all) { User.destroy_all }
  end
end
