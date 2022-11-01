# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
r1 = Role.create({ name: 'User' })
r2 = Role.create({ name: 'Admin' })

u1 = User.create({ name: 'User1', email: 'fernando_torres36@yahoo.com', password: '12345678', password_confirmation: '12345678', role_id: r1.id })
u2 = User.create({ name: 'Admin1', email: 'fernando.torres.valencia@gmail.com', password: '12345678', password_confirmation: '12345678', role_id: r2.id })

d1 = Dealership.create({name: 'Dealership1', user_id: u2.id})
d2 = Dealership.create({name: 'Dealership2', user_id: u2.id})

c1 = Car.create({name:'Acura', price:12000, category:'Used', model:2021, depreciation:0, user_id: u2.id, dealership_id: d1.id})
c1 = Car.create({name:'Ferrari', price:2400, category:'New', model:2021, depreciation:0, user_id: u2.id, dealership_id: d2.id})