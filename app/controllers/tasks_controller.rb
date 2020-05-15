class TasksController < ApplicationController
  def index
  end
  
  def new
    @project = Project.find(params[:project_id])
    @task = Task.new
  end
  
  def create
    Task.create(tasks_params)
    @task = params[:task]
    notifier
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end
  
  def update
    task = Task.find(params[:id])
    task.update(tasks_params)
  end
  
  def destroy
  task = Task.find(params[:id])
  task.destroy
  end
  
  private
  def tasks_params
    params.require(:task).permit(:title, :detail, :datetime).merge(project_id: params[:project_id])
  end
  
  def notifier
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    title = @task[:title] 
    detail = @task[:detail]
    
    text = <<-EOC
      -----------------------------
       新しいタスクです。
      
      ▼タイトル
      #{title}
      ▼内容
      #{detail}
    EOC
    
    notifier.ping("#{text}")
  end
end
