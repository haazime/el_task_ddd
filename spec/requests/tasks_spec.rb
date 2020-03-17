# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/tasks' do
  describe '#create' do
    context '正しいパラメータの場合' do
      it do
        expect {
          post tasks_path, params: { form: { content: 'タスクAAA' } }
        }.to change(Dao::Task, :count).by(1)

        expect(response).to redirect_to(tasks_path)
      end
    end

    context '不正なパラメータの場合' do
      it do
        expect {
          post tasks_path, params: { form: { content: '' } }
        }.to change(Dao::Task, :count).by(0)

        expect(response.body).to include(i18n_error_message(:blank))
      end
    end
  end
end