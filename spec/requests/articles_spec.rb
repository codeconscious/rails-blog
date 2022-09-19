require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do # TODO: Research :request.
  context 'GET /index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful # Was be_success until Rails 6.
    end
  end

  context 'GET /show' do
    let (:params) { { title: 'Test Title', body: 'Test body.', status: 'public' } }
    before(:each) do
      Article.new(params).save
      Article.new(params).save
    end

    it 'returns a successful response' do
      get :show, params: { id: Article.first.to_param }
      expect(response).to be_successful
    end
  end
end
