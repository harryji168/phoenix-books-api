import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :books_api, BooksApi.Repo,
  username: "harryji",
  password: "12345678",
  hostname: "localhost",
  database: "books_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :books_api, BooksApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9bDmSWkAC7VL2b0joo05Lm6U9d+QBUrjVQWo7u+1gmtYeIjjXY8Rc2S4fUVV4syj",
  server: false

# In test we don't send emails.
config :books_api, BooksApi.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
