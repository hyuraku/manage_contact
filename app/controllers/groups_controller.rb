class GroupsController < ApplicationController
  protect_from_forgery except: :create

  def create
    # @group = Group.new(group_params)
    @group = current_user.groups.create(group_params)
    if @group.valid?
      render json: @group,status: :created
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end
