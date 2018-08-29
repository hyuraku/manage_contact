class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @groups = Group.all
  end
end
