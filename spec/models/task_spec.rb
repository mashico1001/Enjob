# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, "モデルに関するテスト", type: :model do
  describe '保存' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:task)).to be_valid
    end
  end
end