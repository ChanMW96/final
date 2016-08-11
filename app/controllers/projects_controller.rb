class ProjectsController < ApplicationController

  def search
    @projects = Project.search params[:search][:search], match: :phrase
    render :index
  end

  # def email
  #   project =Project.find(params[:id])
  #   case project.user_type
  #   when 1
  #     user = Individual.find(project.user_id)
  #   when 2
  #     user = Company.find(project.user_id)
  #   end
  #   AppMailingJob.perform_later(user.email,params[:msg])
  #   redirect_to request.referer
  # end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      redirect_to new_projects_path
    end
  end

  def edit
    @project = Project.find(:project_id)
  end

  def update
    @project = Project.find(params[:project_id])
    if @project.update(project_params)
      redirect_to projects_path(@project.id)
    else
      redirect_to edit_projects_path
    end
  end

  def show
    @project = Project.find(params[:id])
    byebug
    @link = @project.youtubelink.match(/=(.+)/).captures.first
    #this is real implementation
    # case @project.user_type
    # when 1
    #   @user = Individual.find(@project.user_id)
    # when 2
    #   @user = Company.find(@project.user_id)
    # end
    @user = Individual.find(@project.user_id)

    # @time = (@project.time-(@project.created_at-Time.now).to_i).round

  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  def index
      @projects = Project.all
  end

  def project_params
    params.require(:project).permit(:time,:title,:subtitle,:user_id,:required_talents,:goal,:total_amount,:description,{images:[]}, :youtubelink)
  end
end
