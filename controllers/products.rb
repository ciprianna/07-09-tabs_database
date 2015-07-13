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

# ------------------------------------------------------------------------------
# Edit product information
# ------------------------------------------------------------------------------
# Step 1 - Select the product to update
get "/edit_product" do
  erb :"products/edit_product"
end

# Step 2 - Display the form for the selected product
get "/edit_product/:id" do
  @selected_product = Product.find(params["id"])
  erb :"products/edit_product_form"
end

# Step 3 - Save the edited information
get "/save_edited_product" do
  @selected_product = Product.find(params["products"]["id"])
  @selected_product.name = params["products"]["name"]
  @selected_product.general_info = params["products"]["general_info"]
  @selected_product.technical_specs = params["products"]["technical_specs"]
  @selected_product.where_to_buy = params["products"]["where_to_buy"]

  saved_product = @selected_product.save_valid

  if (saved_product != false) && (!params["products"].nil?)
    erb :"products/success"
  else
    @selected_product
    @error = true
    erb :"products/edit_product_form"
  end

end

# ------------------------------------------------------------------------------
# Delete a product
# ------------------------------------------------------------------------------
# Step 1 - Select a product to delete
get "/delete_product" do
  erb :"products/delete_product"
end

# Step 2 - Confirm product to delete
get "/delete/:id" do
  @product_to_delete = Product.find(params["id"])
  erb :"products/confirm_delete"
end

# Step 3 - Delete
get "/really_delete" do
  if params["products"]["confirm_delete"] == "yes"
    product_to_delete = Product.find(params["products"]["id"])
    product_to_delete.delete
    erb :"products/delete_success"
  else
    erb :"index"
  end
end
