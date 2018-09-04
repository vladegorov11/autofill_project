class GroupsController < ApplicationController
  layout 'dashboard'
  before_action :set_group, except: [:index, :new, :create]
  before_action :set_project, only: [:new, :create]
  before_action :authenticate_user!


  def show
    authorize @group
  end

  def edit
    authorize @group
  end

  def update
    authorize @group
    respond_to do |format|
      if @group.update(params_group)
        format.html { redirect_to @group, success: 'group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @group = @project.groups.build
    authorize @group
  end

  def create
    @group = @project.groups.build(params_group)
    authorize @group
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, success: 'group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @group
    @group.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, success: 'group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_group
    @group = Group.friendly.find(params[:id])
  end

  def params_group
    params.require(:group).permit(:name, :description, :all_tags)
  end
end
