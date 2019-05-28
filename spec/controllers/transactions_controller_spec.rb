require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'POST #create' do
    before do
      @ticket = Ticket.create(category: 'premium', price: 50000, quota: 10, event_id: 1)
      @ticket.save
    end
    
    context 'When create a transaction with enough quota of ticket' do
      subject { post :create, params: { transaction: { customer_id: 1, 
              tickets: [{ticket_id: @ticket.id, amount: 1}] } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end
  end
end