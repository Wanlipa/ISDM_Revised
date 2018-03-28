# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create([{name: 'Architecture'},
                 { name: 'Art & Culture'},
                 { name: 'Biology & Life Sciences'},
                 { name: 'Business & Management'},
                 { name: 'Chemistry'},
                 { name: 'Computer Science'}
                ])

# Initial Data for Role
@admin = Role.create(name: "Admin")
@member = Role.create(name: "Member")
# Admin
User.create(email: "admin@ait.asia",
            password: "admin123",
            password_confirmation: "admin123",
            role: @admin)
# Member
User.create(email: "member@ait.asia",
            password: "member123",
            password_confirmation: "member123",
            role: @member)