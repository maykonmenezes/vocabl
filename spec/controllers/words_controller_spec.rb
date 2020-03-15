require 'rails_helper'

RSpec.describe WordsController do
  describe 'GET index' do
    before { get :index }

    context 'When some words are present' do
      let!(:word) { create(:word) }

      it 'assigns @words' do
        expect(assigns(:words)).to eq([word])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'When no words' do
      it 'assigns @words' do
        expect(assigns(:words)).to eq([])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET new' do
    before do
      get :new
    end

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before do
        sign_in(user)
        get :new
      end

      it 'assigns @word' do
        expect(assigns(:word)).to be_a_new(Word)
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it do
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is NOT signed in' do
      it 'assigns @word' do
        expect(assigns(:word)).to eq(nil)
      end

      it 'does not renders the new template' do
        expect(response).not_to render_template(:new)
      end

      it do
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'POST create' do
    subject { post :create, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      context 'valid params' do
        let!(:language_1) { create(:language) }
        let(:params) do
          { word: { content: 'dog', language_id: language_1.id } }
        end

        it 'creates a new word' do
          expect { subject }.to change(Word, :count).from(0).to(1)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end

        context 'when some translation is present' do
          let!(:language_2) { create(:language, :portuguese) }
          let(:params) do
            { word:
              {
                content: 'cat',
                language_id: language_1.id,
                translations_attributes:
                  {
                    '1541932687026' =>
                    {
                      content: 'gato',
                      language_id: language_2.id,
                      _destroy: false
                    }
                  }
              }
            }
          end

          it 'creates a new word' do
            expect { subject }.to change(Word, :count).from(0).to(2)
          end

          it 'creates translation for last word' do
            subject
            expect(Word.first.reload.translations.count).to eq(1)
          end
        end
      end

      context 'invalid params' do
        let(:params) do
          { word: { content: '' } }
        end

        it 'does not create new word' do
          expect { subject }.not_to change(Word, :count)
        end

        it do
          subject
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let!(:language) { create(:language) }
        let(:params) do
          { word: { content: 'dog', language_id: language.id } }
        end

        it 'does not create a new word' do
          expect { subject }.not_to change(Word, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end

      context 'invalid params' do
        let(:params) do
          { word: { content: '' } }
        end

        it 'does not create new word' do
          expect { subject }.not_to change(Word, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
    end
  end

  describe 'GET show' do
    before { get :show, params: params }

    let(:params) do
      { id: word.id }
    end
    let!(:word) { create(:word) }

    it 'assigns @word' do
      expect(assigns(:word)).to eq(word)
    end

    it 'renders the new template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    subject { get :edit, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }
      let(:params) { { id: word.id } }
      let!(:word) { create(:word, user: user) }

      before do
        sign_in(user)
        subject
      end

      it 'assigns @word' do
        expect(assigns(:word)).to eq(word)
      end

      it 'renders the edit template' do
        expect(response).to render_template(:edit)
      end

      it do
        subject
        expect(response).to have_http_status(200)
      end
    end

    context 'when user is NOT signed in' do
      let(:params) { { id: word.id } }
      let!(:word) { create(:word) }

      it 'does not assigns @word' do
        expect(assigns(:word)).to eq(nil)
      end

      it 'does not renders the edit template' do
        expect(response).not_to render_template(:edit)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'POST update' do
    subject { post :update, params: params }

    let(:user) { create(:user) }
    let!(:word) { create(:word, user: user, content: 'cat', language: language_1) }
    let!(:language_1) { create(:language, name: 'English') }
    let!(:language_2) { create(:language, name: 'Portuguese') }

    context 'when user is signed in' do

      before { sign_in(user) }

      context 'valid params' do
        let(:params) do
          { id: word.id, word: { content: 'dog' , language_id: language_2.id } }
        end

        it 'updates word' do
          expect { subject }.to change { word.reload.content }
          .from('cat').to('dog')
          .and change { word.reload.language }
          .from(language_1)
          .to(language_2)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end

      context 'invalid params' do
        let(:params) do
          { id: word.id, word: { content: '' } }
        end

        it 'does not create new word' do
          expect { subject }.not_to change { word.reload.content }
        end

        it do
          subject
          expect(response).to have_http_status(200)
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let(:params) do
          { id: word.id, word: { content: 'dog' , language_id: language_2.id } }
        end

        it 'does not updates word' do
          expect { subject }.not_to change { word.reload.content }
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end

      context 'invalid params' do
        let(:params) do
          { id: word.id, word: { content: '' } }
        end

        it 'does not update word' do
          expect { subject }.not_to change { word.reload.content }
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
    end

  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }

    let(:user) { create(:user) }
    let!(:word) { create(:word, user: user) }

    context 'when user is signed in' do
      before { sign_in(user) }

      context 'valid params' do
        let(:params) { { id: word.id } }

        it 'deletes word' do
          expect { subject }.to change(Word, :count).from(1).to(0)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
    end

    context 'when user is NOT signed in' do
      context 'valid params' do
        let(:params) { { id: word.id } }

        it 'does not delete word' do
          expect { subject }.not_to change(Word, :count)
        end

        it do
          subject
          expect(response).to have_http_status(302)
        end
      end
    end
  end
end
