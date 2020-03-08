require 'rails_helper'

RSpec.describe "Words", type: :request do
  describe 'GET index' do
    context 'When some words are present' do
      let!(:word) { create(:word) }

      it 'request list of all words' do
        get words_path
        expect(response).to be_successful
        expect(response.body).to include(word.value)
      end

      it 'renders the index template' do
        get words_path
        expect(response).to render_template(:index)
      end
    end

    context 'When no words' do
      it 'request list of all words' do
        get words_path
        expect(response).to be_successful
        expect(response.body).to include('')
      end
    end
    it 'renders the index template' do
      get words_path
      expect(response).to render_template(:index)
    end
  end
end
