class TasksController < ApplicationController
  def index
    @tasks = Task.root.order(created_at: :desc)
  end

  def new
    parent = params[:parent_id] ? Task.find(params[:parent_id]) : nil
    @task = parent ? parent.children.build : Task.new
  end

  def create
    task_params = params.require(:task).permit(:label, :parent_id)
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    task_params = params.require(:task).permit(:label)
    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end
