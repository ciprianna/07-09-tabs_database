# Creates the database connection
DATABASE = SQLite3::Database.new("products.db")

# Creates the table
DATABASE.execute("CREATE TABLE IF NOT EXISTS products (id INTEGER PRIMARY KEY, name TEXT NOT NULL, general_info TEXT NOT NULL, technical_specs TEXT NOT NULL, where_to_buy TEXT NOT NULL);")

# Returns the results as a Hash
DATABASE.results_as_hash = true
