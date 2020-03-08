require 'rails_helper'

RSpec.describe "Words", type: :request do
  describe 'GET words' do
    context 'When some words are present' do
      it 'request list of all words' do
        word = create(:word)
        get words_path
        expect(response).to be_successful
        expect(response.body).to include('dog')
      end
    end

    context 'When no words' do
      it 'request list of all words' do
        get words_path
        expect(response).to be_successful
        expect(response.body).to include('')
      end
    end
  end
end
