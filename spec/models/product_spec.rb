require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:each) do
      @category = Category.new
      @product = Product.new
    end
    # ({
    #     name: "Test Product",
    #     price: 3000,
    #     quantity: 100,
    #     category: @category,
    #   })
    context "validate with empty product" do
      it "is not valid without required presence" do
        @product.name = nil
        expect(@product).to_not be_valid
        # puts @product.erros
        # expect(@product.errors.messages[:name]).to include('is invalid')
      end
    end
    context "validate without a name" do
      it "is not valid if name is empty" do
        @productprice = 3000
        @product.quantity = 100
        @product.category = @category
        expect(@product).to_not be_valid
      end
    end

    context "validate without a category" do
      it "is not valid if name is empty" do
        @product.name = "Test Product"
        @product.price = 3000
        @product.quantity = 100
        expect(@product).to_not be_valid
      end
    end

    context "validate without a price" do
      it "is not valid if price is empty" do
        @product.name = "Test Product"
        @product.quantity = 100
        @product.category = @category
        expect(@product).to_not be_valid
      end
    end

    context "validate with just a quantity" do
      it "is not valid if quantity is empty" do
        @product.name = "Test Product"
        @product.price = 3000
        @product.category = @category
        expect(@product).to_not be_valid
      end
    end




      # it "validate price presence: true" do
      #   expect(@product.price).to eql(3000)
      # end
      # it "validate quantity presence: true" do
      #   expect(@product.quantity).to eql(100)
      # end
      # it "validate category presence: true" do
      #   expect(@product.category).to eql(@category)
      # end
      # context "validates :price, presence: true" do
      #   it "return true" do
      #     expect().to eql()
      #   end
      # end

      # context "validates :quantity, presence: true" do
      #   it "return true" do
      #     expect().to eql()
      #   end
      # end

      # context "validates :category, presence: true" do
      #   it "return true" do
      #     expect().to eql()
      #   end
      # end
    # end
  end
end