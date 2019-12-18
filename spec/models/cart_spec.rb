require 'rails_helper'

RSpec.describe Cart, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "購物車基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      cart = Cart.new                 # 新增一台購物車
      cart.add_item 1                 # 隨便丟一個東西到購物車裡
      expect(cart.empty?).to be false # 它應該不是空的
    end

    it "如果加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
      cart = Cart.new                             # 新增一台購物車
      3.times { cart.add_item(1) }                # 加了3次的1
      5.times { cart.add_item(2) }                # 加了5次的2
      2.times { cart.add_item(3) }                # 加了2次的3

      expect(cart.items.length).to be 3           # 總共應該會有3個item
      expect(cart.items.first.quantity).to be 3   # 第1個item的數量會是3
      expect(cart.items.second.quantity).to be 5  # 第2個item的數量會是5
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      cart = Cart.new
      p1 = Product.create(title:"七龍珠")               # 建立商品1
      p2 = Product.create(title:"冒險野郎")             # 建立商品2

      4.times { cart.add_item(p1.id) }                  # 放了4次商品1
      2.times { cart.add_item(p2.id) }                  # 放了2次商品2

      expect(cart.items.first.product_id).to be p1.id   # 第1個item的商品id應該會等於商品1的id
      expect(cart.items.second.product_id).to be p2.id  # 第2個item的商品id應該會等於商品2的id
      expect(cart.items.first.product).to be_a Product  # 第1個item拿出來的東西應該是一種商品
    end
    it "每個 Cart Item 都可以計算它自己的金額（小計）"
    it "可以計算整台購物車的總消費金額"
    it "特別活動可能可搭配折扣（例如聖誕節的時候全面打 9 折，或是滿額滿千送百）"
  end

  describe "購物車進階功能" do
    it "可以將購物車內容轉換成 Hash，存到 Session 裡"
    it "可以把 Session 的內容（Hash 格式），還原成購物車的內容"
  end
end
