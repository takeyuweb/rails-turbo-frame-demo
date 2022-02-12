class Tasks::ChildrenController < ApplicationController
  def index
    @task = Task.find(params[:task_id])
    @children = @task.children.order(created_at: :desc)
  end
end
