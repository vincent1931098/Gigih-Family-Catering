require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  it 'is valid with a name, phone, address, and email' do
    customer = Customer.new(
      name: 'Vincent',
      phone: '081234567890',
      address: 'Jalan Permata Blok 5',
      email: 'vincent@gmail.com'
    )
    expect(customer).to be_valid
  end

  it 'is invalid without a name' do
    customer = Customer.new(
      name: nil,
      phone: '081234567890',
      address: 'Jalan Permata Blok 5',
      email: 'vincent@gmail.com'
    )
    customer.valid?

    expect(customer.errors[:name]).to include("can't be blank")
  end

  it 'is Invalid if phone does not match with format (ex: +6281134567890 or 081134567890)' do
    customer = Customer.new(
      name: "Vincent",
      phone: '12345678',
      address: 'Jalan Permata Blok 5',
      email: 'vincent@gmail.com'
    )
    customer.valid?

    expect(customer.errors[:phone]).to include("is invalid")
  end

  it 'is Invalid if email does not match with format' do
    customer = Customer.new(
      name: "Vincent",
      phone: '12345678',
      address: 'Jalan Permata Blok 5',
      email: 'vincent@gmail'
    )
    customer.valid?

    expect(customer.errors[:email]).to include("is invalid")
  end
end

