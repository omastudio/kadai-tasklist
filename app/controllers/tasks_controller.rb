class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    # @tasks = Task.all
    # @tasks = Task.where(user_id: current_user.id)
    @tasks = current_user.tasks
  end
  
  def show
    # if @task.user != current_user
    #   redirect_to root_url
    # end
    # redirect_to root_url unless @task.user == current_user
  end

  def new
    # @task = Task.new
    # @task.user = current_user
    @task = current_user.tasks.build
  end

  def create
    # @task = Task.new(task_params)
    # @task.user = current_user
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'タスクが正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクが投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_to tasks_url
  end
  
  private
  

  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = Task.find(params[:id])
    redirect_to root_url if @task.user != current_user
  end
end
