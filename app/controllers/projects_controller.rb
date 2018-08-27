class ProjectsController < ApplicationController
  layout 'dashboard'
  before_action :set_project, except: [:index, :new, :create, :archive]
  before_action :authenticate_user!

  def index
  #  @projects = Project.where(archived: false).paginate(:page => params[:page], :per_page => 3)
    @projects = policy_scope(Project.where(archived: false)).paginate(:page => params[:page], :per_page => 3)
    authorize @projects
  end

  def show
    authorize @project
    @project = @project.decorate
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(params_project)
        format.html {
          redirect_to @project
          flash[:success] = 'Project was successfully updated.'
         }
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
        format.html {
          redirect_to @project
          flash[:success] = 'Project was successfully created.'
        }
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
      format.html {
        redirect_to projects_url
        flash[:success] = 'Project was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  def archived
    @project.archived = @project.archived ?  false :  true
    if @project.save
      respond_to do |format|
        format.html {
          redirect_to  @project 
          flash[:success] = "Project was successfully #{@project.archived ? 'archived' : 'unarchived'}"
        }
        format.json { head :no_content }
      end
    else
      format.html { render :show }
      format.json { render json: @project.errors, status: :unprocessable_entity }
    end
  end

  def archive
    @projects = policy_scope(Project.where(archived: true)).paginate(:page => params[:page], :per_page => 3)
    authorize @projects
  end

  def regenerate_token
    @project.regenerate_api_token
    @project.regenerate_auth_token
    respond_to do |format|
      format.html {
        redirect_to @project
        flash[:success] = "Project keys was successfully update"
      }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def params_project
    params.require(:project).permit(:title, :description, :project_type, :domain)
  end

end
