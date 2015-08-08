desc "clean up old data and combine duplicate items in the cart"
task :clean_up_line_items => :environment do
  # replace multiple items for a single product in a cart with a single item
  Cart.all.each do |cart|
    # count the number of product in the cart
    sums = cart.line_items.group(:product_id).sum(:quantity)

    sums.each do |product_id, quantity|
      if quantity > 1
        # remove individual items
        cart.line_items.where(product_id: product_id).delete_all

        # replace with a single item
        item = cart.line_items.build(product_id: product_id)
        item.quantity = quantity
        item.save!
      end
    end
  end
end
