class TasksController < ApplicationController
  # before_action :set_task, only: [:show, :create]
  def index
    @tasks = Task.all
  end

  def show
     @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task.id)
  end

  def new
    @task = Task.new
  end

  private

  # def set_task
  #   @task = Task.find(task_params)
  # end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
