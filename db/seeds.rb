# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Carrie", last_name: "Mathieu", email: "test@test.com", password: "password")

Category.create(name: "Movies")

List.create(list_title: "10 Things You Didn't Know About Star Wars", list_content: ["Yoda was almost played by a monkey", "‘Ewok’ is never actually said in the original trilogy", "Return of the Jedi almost had a very different ending.", "Depending on the movie, Yoda has a different number of toes.", "Star Wars and 2001: A Space Odyssey had the same production crew.", "E.T. was in The Phantom Menace (kind of).", "Chewbacca’s voice is a mix of other animals.", "Lightsaber noises came from an old television.", "Harrison Ford almost wasn’t.", "Darth Vader is banned from all official Star Wars parties."], user_id: 1, category_id: 1)



# create_table "categories", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

#   create_table "lists", force: :cascade do |t|
#     t.integer "user_id"
#     t.integer "category_id"
#     t.text "list_content", default: [], array: true
#     t.string "list_title"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end