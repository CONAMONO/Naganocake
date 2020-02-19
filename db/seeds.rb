# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 Admin.create(
 	email: "admin@co.jp",
 	password: "adminadmin"
	)


# Genre.create(
# 	status: true,
# 	name: "cake"
# 	)


# CartItem.create(
# 	quantity: 3,
# 	product_id: 1,
# 	user_id: 1
# 	)

# User.create(
# 	email: "a@com",
# 	encrypted_password: "123456",
# 	first_name: "123456",
# 	last_name: "123456",
# 	first_name_kata: "123456",
# 	last_name_kata: "123456",
# 	street_address: "123456",
# 	postal_code: "123456",
# 	phone_number: "123456",
# 	user_status: true
# 	)


# CartItem.create(
# 	quantity: 100,
# 	product_id: 1,
# 	user_id: 1
# 	)

# Product.create(
# 	name: "ケーキなんじゃない？",
# 	image_id: "",
# 	explain: "",
# 	non_taxed_price: 1000,
# 	genre_id: 1,
# 	sale_status: true
# 	)

CartItem.create(
	quantity: 100,
	product_id: 12,
	user_id: 1
	)

CartItem.create(
	quantity: 100,
	product_id: 1,
	user_id: 1
	)

# ShippingAddress.create(
# 	name_address: "宛先　太郎",
# 	street_address: "テスト県テスト市1-2-3",
# 	postal_code: "123-4567",
# 	user_id: 1
# 	)


# ShippingAddress.create(
# 	name_address: "宛先　次郎",
# 	street_address: "テスト県テスト市4-5-6",
# 	postal_code: "234-5678",
# 	user_id: 1
# 	)
