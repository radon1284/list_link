# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'glenn@giverfund.com', password: 'qazx1234', password_confirmation: 'qazx1234')
AdminUser.create!(email: 'radon@radongrafix.com', password: 'qazx1234', password_confirmation: 'qazx1234')
