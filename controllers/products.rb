# ------------------------------------------------------------------------------
# View all products
# ------------------------------------------------------------------------------
get "/all_products" do
  erb :"products/all_products"
end

# ------------------------------------------------------------------------------
# Add new product
# ------------------------------------------------------------------------------
# Step 1 - Display a form
get "/add_product" do
  erb :"products/add_product"
end

# Step 2 - Save new product to database
get "/save_new_product" do
  new_product = Product.new({"name" => params["products"]["name"], "general_info" => params["products"]["general_info"], "technical_specs" => params["products"]["technical_specs"], "where_to_buy" => params["products"]["where_to_buy"]})

  if new_product.add_to_database
    erb :"products/success"
  else
    @error = true
    erb :"products/add_product"
  end
end
