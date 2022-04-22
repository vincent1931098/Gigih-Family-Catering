require 'rails_helper'

RSpec.describe "order_details/edit", type: :view do
  before(:each) do
    @order_detail = assign(:order_detail, OrderDetail.create!(
      Order: nil,
      Item: nil,
      quantity: 1,
      price: 1.5
    ))
  end

  it "renders the edit order_detail form" do
    render

    assert_select "form[action=?][method=?]", order_detail_path(@order_detail), "post" do

      assert_select "input[name=?]", "order_detail[Order_id]"

      assert_select "input[name=?]", "order_detail[Item_id]"

      assert_select "input[name=?]", "order_detail[quantity]"

      assert_select "input[name=?]", "order_detail[price]"
    end
  end
end
