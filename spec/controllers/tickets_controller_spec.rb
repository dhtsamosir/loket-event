require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'POST #create' do
    before do
      @event = Event.create(description: 'Ruby meet up', origanizer: 'Gojek', start_date: '2013-02-02 01:00:00', end_date: '2013-02-02 01:00:00', location_id: 1)
    end

    context 'When create a ticket' do
      subject { post :create, params: { ticket: { category: 'premium', price: 50000, 
                quota: 10, event_id: @event.id } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end

    context 'When price is not number' do
      subject { post :create, params: { ticket: { category: 'premium', price: "seribu", 
                quota: 10, event_id: @event.id } } }

      it 'returns a 400 or bad request status' do
        expect(subject).to have_http_status(400)
      end
    end

    context 'When event id is not found' do
      subject { post :create, params: { ticket: { category: 'premium', price: 50000, 
                quota: 10, event_id: -1 } } }

      it 'returns a 404 event id not found' do
        expect(subject).to have_http_status(:not_found)
      end
    end
  end
end