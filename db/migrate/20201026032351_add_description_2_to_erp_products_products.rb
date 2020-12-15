class AddDescription2ToErpProductsProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_products_products, :description_2, :text
  end
end
