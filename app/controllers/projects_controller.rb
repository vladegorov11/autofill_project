class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy, :edit]
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(params_project)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(params_project)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def params_project
    params.require(:project).permit(:title, :description)
  end

end
