module Test
  module Spree
    module Admin
      module ProductsControllerDecorator
        def import
          document = ::Spree::Product::Import.call(import_params)

          if document.errors.any?
            flash[:error] = document.errors.full_messages.first
          else
            flash[:notice] = ::Spree.t('admin.products.import.success')
          end

          redirect_to admin_products_path
        end

        private

        def import_params
          params.merge(user: spree_current_user)
        end
      end
    end
  end
end

Spree::Admin::ProductsController.prepend Test::Spree::Admin::ProductsControllerDecorator
