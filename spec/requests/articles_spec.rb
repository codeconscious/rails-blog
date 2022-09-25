require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do # TODO: Research :request.
  context 'GET /index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful # Was be_success until Rails 6.
    end
  end

  context 'GET /show' do
    let(:params) { { title: 'Test Title', body: 'Test body.', status: 'public' } }
    before(:each) do
      Article.new(params).save
      Article.new(params).save
    end

    it 'returns a successful response' do
      get :show, params: { id: Article.first.to_param }
      expect(response).to be_successful
    end
  end

  context 'POST /create' do
    let(:valid_params) { { 'article' => { 'title' => 'Article Title', 'body' => 'Body of article.', 'status' => 'public' } } }

    it 'creates new article given valid parameters' do
      expect do
        post :create, params: valid_params
      end.to change(Article, :count).by(1)
    end
  end

  context 'GET /new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  context 'GET /edit' do
    let(:params) { { title: 'Test Title', body: 'Test body.', status: 'public' } }
    before(:each) do
      Article.new(params).save
    end

    it 'returns a successful response (article ID passed)' do
      get :edit, params: { id: Article.first.to_param }
      expect(response).to be_successful
    end
  end

  context 'DELETE /destroy' do
    let(:params) { { title: 'Test Title', body: 'Test body.', status: 'public' } }
    before(:each) do
      Article.new(params).save
    end

    it 'deletes specified article, reducing article count by 1 (article ID passed)' do
      expect do
        delete :destroy, params: { id: Article.first.to_param }
      end.to change(Article, :count).by(-1)
    end
  end
end
