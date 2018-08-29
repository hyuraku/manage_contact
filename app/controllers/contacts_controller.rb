class ContactsController < ApplicationController
  def index
    if params[:group_id].present?
      @contacts = Contact.where(group_id: params[:group_id]).page(params[:page]).per(7)
    else
      @contacts = Contact.page(params[:page]).per(7)
    end
    @groups = Group.all
  end
end
