require 'rails_helper'

RSpec.describe Item, type: :model do
  
  it 'is valid with a name and a description' do
    item = Item.new(
      name: 'Nasi Uduk',
      price: 15000,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!'
    )
    expect(item).to be_valid
  end

  it 'is invalid without a name' do
    item = Item.new(
      name: nil,
      price: 15000,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!'
    )

    item.valid?

    expect(item.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    item1 = Item.create(
      name: "Nasi Uduk",
      price: 10000,
      description: "Betawi style steamed rice cooked in coconut milk. Delicious!"
    )
    
    item2 = Item.new(
      name: "Nasi Uduk",
      price: 10000,
      description: "Just with a different description."
    )

    item2.valid?
    
    expect(item2.errors[:name]).to include("has already been taken")
  end

  it "is invalid with a non numeric value price" do
    item = Item.new(
      name: "Nasi Uduk",
      price: "ten thousand",
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!'
    )

    item.valid?

    expect(item.errors[:price]).to include("is not a number")
  end

  it "is invalid with a price less than 0.01" do
    item = Item.new(
      name: "Nasi Uduk",
      price: 0.001,
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!'
      
    )

    item.valid?

    expect(item.errors[:price]).to include("must be greater than 0.01")
  end


  it "is invalid with a description more than 150 character" do
    item = Item.new(
      name: "Nasi Uduk",
      price: 10000,
      description: 'one of numerous Indonesian rice-based dishes. The rice in nasi uduk is cooked in coconut milk together with lemongrass, cloves, pandan leaves, and cinnamon. The process results in wonderfully fluffy, fragrant rice, and right before it is served, each portion is usually topped with fried shallots.',
    )

    item.valid?

    expect(item.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

end