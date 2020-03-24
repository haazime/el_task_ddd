# frozen_string_literal: true

class CreateTaskForm
  include ActiveModel::Model

  attr_accessor :content, :description, :deadline

  validates :content, presence: true
  validates :deadline, date: true, allow_nil: true

  def initialize(attributes = {})
    super
    self.description = nil if description.blank?
    self.deadline = nil if deadline.blank?
  end
end
