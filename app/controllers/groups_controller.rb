class GroupsController < ApplicationController

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group,status: :created
    else
      render json: @group.errors.full_message, status: :Unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end
