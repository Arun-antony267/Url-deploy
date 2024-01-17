# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ShortUrl.create(
  original_url: "https://amazon.in",
  shortened_url: "https://url-shortner-s7ah.onrender.com/0000001",
  created_at: "2023-02-02 09:36:08.400985",
  updated_at: "2023-02-02 09:36:08.400985",
  user_id: "27",
  job_id: "000",
)

ShortUrl.create(
  original_url: "https://amazon.in",
  shortened_url: "https://url-shortner-s7ah.onrender.com/0000000",
  created_at: "2023-01-01 09:36:08.400985",
  updated_at: "2023-01-01 09:36:08.400985",
  user_id: "27",
  job_id: "001",
)
