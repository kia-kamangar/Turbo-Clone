class TasksController < ApplicationController
  before_action :set_task, only: %i[ edit update destroy ]
  def index
    @tasks = Task.all
  end

  # def show
  #   @task
  # end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)

    if task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      # render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

private
  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end