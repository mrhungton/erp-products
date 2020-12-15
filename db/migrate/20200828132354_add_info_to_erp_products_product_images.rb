class AddInfoToErpProductsProductImages < ActiveRecord::Migration[5.1]
  def change
    add_column :erp_products_product_images, :description, :text
    add_column :erp_products_product_images, :is_main, :boolean, default: false
  end
end
