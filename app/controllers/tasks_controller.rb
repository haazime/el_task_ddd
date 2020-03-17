# frozen_string_literal: true

class TasksController < ApplicationController

  def index
    @tasks = []
  end

  def new
    @form = CreateTaskForm.new
  end

  def create
    @form = CreateTaskForm.new(create_params)

    if @form.valid?
      service = TaskService.new
      service.create_task(@form.content)
      redirect_to tasks_path
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:form).permit(:content)
  end
end
