class ProjectsController < ApplicationController

  def search
    @projects = Project.search params[:search][:search], match: :phrase
    render :index
  end

  def email
    case session[:type]
    when 1
      user = Individual.find(session[:user_id])
    when 2
      user = Company.find(session[:user_id])
    end
    AppMailingJob.perform_later(user,params[:msg])
    redirect_to request.referer
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.valid?
      @project.save
      redirect_to projects_path(@project.id)
    else
      redirect_to new_projects_path
    end
  end

  def edit
    @project = Project.find(:project_id)
  end

  def update
    @project = Project.find(:project_id)
    if @project.update(project_params)
      redirect_to projects_path(@project.id)
    else
      redirect_to edit_projects_path
    end
  end

  def show
    @project = Project.find(2)
    #this is real implementation
    # case @project.user_type
    # when 1
    #   @user = Individual.find(@project.user_id)
    # when 2
    #   @user = Company.find(@project.user_id)
    # end
    @user = Individual.find(1)
    @time = ((@project.time-(Time.now-@project.created_at))/(3600*24)).round
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  def index
      @projects = Project.all
  end

  def project_params
    params.require(:proj).permit(:time,:title,:name,:user_id,:user_type,:required_talents,:goal,:total_amount,:description_1,:description_2,:description_3,{images:[]})
  end
end
