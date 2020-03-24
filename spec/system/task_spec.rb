# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Manage tasks' do
  it do
    visit tasks_path

    fill_in '内容', with: 'タスクAAA'
    fill_in '説明', with: 'タスクの説明です'
    fill_in '期限', with: '2020-04-15'

    click_button '追加する'

    expect(page).to have_content('タスクAAA')
    expect(page).to have_content('タスクの説明です')
    expect(page).to have_content('2020-04-15')
  end
end
