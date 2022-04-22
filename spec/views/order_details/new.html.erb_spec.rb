require 'rails_helper'

RSpec.describe "order_details/new", type: :view do
  before(:each) do
    assign(:order_detail, OrderDetail.new(
      Order: nil,
      Item: nil,
      quantity: 1,
      price: 1.5
    ))
  end

  it "renders new order_detail form" do
    render

    assert_select "form[action=?][method=?]", order_details_path, "post" do

      assert_select "input[name=?]", "order_detail[Order_id]"

      assert_select "input[name=?]", "order_detail[Item_id]"

      assert_select "input[name=?]", "order_detail[quantity]"

      assert_select "input[name=?]", "order_detail[price]"
    end
  end
end
