require 'rails_helper'
# require 'rspec/retry'
RSpec.describe Bill, type: :model do
  let(:whitelisted_params) { params.permit(:name, :tax_code, :price) }
  let(:params) { ActionController::Parameters.new(parameters) }
  let(:parameters) { {
    name: 'Movie',
    tax_code: 3,
    price: 1000,
  } }
  let(:bill) { Bill.new whitelisted_params }
  describe '#mass_assignmets' do
    context 'with whitelisted_params' do
      subject { described_class.new(whitelisted_params) }
      it {expect(subject[:name]).to eq('Movie')}
      it { expect(subject[:tax_code]).to eq('entertainment') }
      it { expect(subject[:price]).to eq(1000) }
    end
  end

  describe 'validation' do
    context 'validate presence' do
      it { is_expected.to validate_presence_of(:price) }
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:tax_code) }
    end
  end

  describe 'check tax based on food type' do
    context 'Food Type' do
      let(:food_type) { BillType::Food.new bill }
      it { expect(food_type.type).to eq('Food & Beverage') }
      it { expect(food_type.refundable).to eq(true) }
      it { expect(food_type.tax).to eq(100.0) }
    end

    context 'Entertainment Type' do
      let(:bill) { Bill.new(price: 1100)}
      let(:entertainment_type) { BillType::Entertainment.new bill }
      let(:bill_free) { Bill.new(price: 50)}
      let(:entertainment_type_free_tax) { BillType::Entertainment.new bill_free }
      it { expect(entertainment_type.type).to eq('Entertainment') }
      it { expect(entertainment_type.refundable).to eq(false) }
      it { expect(entertainment_type.tax).to eq(10.0) }
      it { expect(entertainment_type_free_tax.tax).to eq(0) }
    end



    context 'Tobacco Type' do
      let(:tobacco_type) { BillType::Tobacco.new bill }
      it { expect(tobacco_type.type).to eq('Tobacco') }
      it { expect(tobacco_type.refundable).to eq(false) }
      it { expect(tobacco_type.tax).to eq(30.0) }
    end

    context ''
  end
end