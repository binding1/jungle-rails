require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(id: 1, name: "Flower")
      @product = Product.new(id: 1, name: 'Lilac', price_cents: 999, quantity: 20, category: @category)
  end

  it "is valid" do
      expect(@product).to be_valid
  end

  it "has a valid name" do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
  end

  it "has a valid price" do
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
  end

  it "has a valid quantity" do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
  end

  it "has a valid category" do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to_not be_empty
  end

  end
end