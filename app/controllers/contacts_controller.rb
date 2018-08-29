class ContactsController < ApplicationController
  def index
    @contacts = Contact.page.per(7)
    @groups = Group.all
  end
end
