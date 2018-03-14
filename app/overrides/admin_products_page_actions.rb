Deface::Override.new(
  virtual_path:  'spree/admin/products/index',
  name:          'admin_products_page_actions',
  insert_before: "[data-hook='admin_products_sidebar']",
  partial:       'spree/admin/shared/products_page_actions'
)
