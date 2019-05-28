require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject { described_class.new(customer_id: '1', tickets: "ticket_id: '1', :amount: 10") }
  
  context 'when transaction is appropriate' do
    it { is_expected.to be_valid }
  end

  context 'when transaction is inappropriate' do
    before do
      subject.customer_id = nil
    end

    it { is_expected.to_not be_valid }
  end
end
