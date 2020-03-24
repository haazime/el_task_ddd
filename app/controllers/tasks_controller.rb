# frozen_string_literal: true

class TasksController < ApplicationController

  def index
    @tasks = TaskListQuery.call
    @form = CreateTaskForm.new
  end

  def create
    @form = CreateTaskForm.new(create_params)

    if @form.valid?
      usecase = CreateTaskUsecase.new
      usecase.run(@form.content, description: @form.description, deadline: @form.deadline)
      redirect_to tasks_path
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:form).permit(:content, :description, :priority, :deadline)
  end
end
