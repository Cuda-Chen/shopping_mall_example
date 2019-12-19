require 'rails_helper'

RSpec.describe CartItem, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "每個Cart Item都可以計算自己的金額（小計）" do
    p1 = Product.create(title:"七龍珠", price: 80)      # 建立商品1
    p2 = Product.create(title:"冒險野郎", price: 200)   # 建立商品2

    cart = Cart.new
    3.times { cart.add_item(p1.id) }                    # 加3次商品1
    4.times { cart.add_item(p2.id) }                    # 加4次商品2
    2.times { cart.add_item(p1.id) }                    # 加2次商品1

    expect(cart.items.first.price).to be 400            # 第1條cart item應該是400塊
    expect(cart.items.second.price).to be 800           # 第2條cart item應該是800塊
  end
end
