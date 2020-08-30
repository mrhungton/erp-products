module Erp
  module Products
    module Backend
      class ProductImagesController < Erp::Backend::BackendController
        before_action :set_product_image, only: [:edit, :update, :destroy]
        
        # GET /product_images/new
        def new
          @product_image = productImage.new
        end
        
        # GET /product_images/1/edit
        def edit
        end
    
        # POST /product_images
        def create
          @product_image = productImage.new(product_image_params)
          @product_image.creator = current_user
          
          if @product_image.save
            if request.xhr?
              render json: {
                status: 'success',
                text: @product_image.name,
                value: @product_image.id
              }
            else
              redirect_to erp_products.edit_backend_product_image_path(@product_image), notice: t('.success')
            end
          else
            render :new
          end
        end
    
        # PATCH/PUT /categories/1
        def update
          if @product_image.update(product_image_params)
            if request.xhr?
              render json: {
                status: 'success',
                text: @product_image.name,
                value: @product_image.id
              }
            else
              redirect_to erp_products.edit_backend_product_image_path(@product_image), notice: t('.success')
            end
          else
            render :edit
          end
        end
        
        def form_line
          @product_image = ProductImage.new
          render partial: params[:partial], locals: { product_image: @product_image, uid: helpers.unique_id() }
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_product_image
            @product_image = ProductImage.find(params[:id])
          end
    
          # Only allow a trusted parameter "white list" through.
          def product_image_params
            params.fetch(:product_image, {}).permit(:product_id, :image_url, :description, :is_main)
          end
      end
    end
  end
end