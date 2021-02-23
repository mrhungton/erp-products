class AddCustomOrderToErpProductsProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_products_products, :custom_order, :integer
  end
end
