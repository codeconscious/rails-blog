require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validation tests' do
    it 'successfully creates English article' do
      article = Article.new(id: 0, title: 'Test Title', body: 'Test body.', status: 'public')
      expect(article.id).to eq(0)
      expect(article.title).to eq('Test Title')
      expect(article.body).to eq('Test body.')
      expect(article.status).to eq('public')
    end

    it 'successfully creates Japanese article' do
      article = Article.new(id: 0, title: 'テスト用のタイトル', body: 'テスト用の文章。', status: 'public')
      expect(article.id).to eq(0)
      expect(article.title).to eq('テスト用のタイトル')
      expect(article.body).to eq('テスト用の文章。')
      expect(article.status).to eq('public')
    end
  end
end
