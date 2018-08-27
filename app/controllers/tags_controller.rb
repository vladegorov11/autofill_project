class TagsController < ApplicationController
  layout 'dashboard'
  before_action :set_group
  before_action :authenticate_user!

  def import
    Tag.import(@group, params[:file])
    redirect_to  @group, notice: 'ok!'
  end

  def export
    respond_to do |format|
      format.html 
      format.csv { send_data @group.tags.to_csv, filename: "tags-#{@group.name}-#{Date.today}.csv" }
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

end
