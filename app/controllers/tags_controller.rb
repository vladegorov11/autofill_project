class TagsController < ApplicationController
  layout 'dashboard'
  before_action :set_group
  before_action :set_tag, only: [:destroy_tag]
  before_action :authenticate_user!, except: [:destroy_tag]

  def import
    Tag.import(@group, params[:file])
    redirect_to  @group, notice: 'File imported'
  end

  def export
    respond_to do |format|
      format.html
      format.csv { send_data @group.tags.to_csv, filename: "tags-#{@group.name}-#{Date.today}.csv" }
    end
  end

  def destroy_tag
    Tagging.where(group_id: @group.id, tag_id: @tag.id).destroy_all
  end

  private

  def set_group
    @group = Group.friendly.find(params[:group_id])
  end

  def set_tag
    @tag = Tag.find(params[:tag_id])
  end

end
