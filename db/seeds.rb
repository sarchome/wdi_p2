# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
menu_items = MenuItem.create([{item:'Kale Salad', price:'10.5', category:'Salad'},{item:'Crispy Baked Bubble Cake', price:'5.0', category:'dessert'}])

user = User.new(
    email:'email@email.com', 
    first_name: 'Bryan',
    last_name: 'Adams',
    is_admin: false, 
    is_restaurant: true,
    user_type: 'restaurant',
    password: 'password'

    )

rest = Restaurant.create(
        {name:'Monster Salads', 
        owner:'Mary',
        city: 'Los Angeles',
        # user: User.new(email:'charzar@cartoon.com', 
        #     is_admin: true, 
        #     user_type: 'restaurant',
        #     password: 'Admin.12345')
        
        menu_items: menu_items,
        user: user
        })


# rest.user = user
# rest.save