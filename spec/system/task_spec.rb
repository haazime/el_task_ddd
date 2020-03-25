# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Manage tasks' do
  it do
    visit tasks_path

    within('[data-test="new_task_form"]') do
      fill_in '内容', with: 'タスクAAA'
      fill_in '説明', with: 'タスクの説明です'
      choose '高'
      fill_in '期限', with: '2020-04-15'

      click_button '追加する'
    end

    within('[data-test="task_list_body"]') do
      expect(page).to have_content('タスクAAA')
      expect(page).to have_content('タスクの説明です')
      expect(page).to have_content('未着手')
      expect(page).to have_content('高')
      expect(page).to have_content('2020-04-15')
    end
  end
end
