require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do # TODO: Research :request.
  context 'GET /index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful # Was be_success until Rails 6.
    end
  end
end
