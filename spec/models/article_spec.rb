require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'validation tests' do
    context 'new' do
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

    context 'create' do
      # Or use "let!" to explicitly run before each test instead of lazily.
      let (:params) { { title: 'Test Title', body: 'Test body.', status: 'public' } }
      before(:each) do
        Article.new(params).save
        Article.new(params).save
        Article.new(params).save
        Article.new(params.merge(status: 'private')).save
        Article.new(params.merge(status: 'private')).save
      end

      it 'returns public articles' do
        expect(Article.public_articles.size).to eq(3)
      end

      it 'returns private articles' do
        expect(Article.private_articles.size).to eq(2)
      end
    end
  end
end
