# frozen_string_literal: true

class CreateTaskForm
  include ActiveModel::Model

  attr_accessor :content, :description, :priority, :deadline

  validates :content, presence: true
  validate :valid_priority
  validates :deadline, date: true, allow_nil: true

  def initialize(attributes = {})
    super
    self.description = nil if description.blank?
    self.priority = nil if priority.blank?
    self.deadline = nil if deadline.blank?
  end

  def priorities
    Task::Priority.all
  end

  private

  def valid_priority
    return unless priority

    begin
      Task::Priority.from_integer(priority.to_i)
    rescue ArgumentError
      errors.add(:priority, :invalid)
    end
  end
end
