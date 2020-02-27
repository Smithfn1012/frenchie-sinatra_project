a = User.create(name: "Abby", username: "HappyAbby123", password: "password")
b = User.create(name: "Blaine", username: "BlainestheName", password: "passwordismygame")

a.dogs.create(name: "Princess", gender: "female", coat_color: "maskless fawn", age: 5, for_sale: true, price: 1500)
a.dogs.create(name: "Gucci", gender: "male", coat_color: "isabella platinum", age: 3, for_sale: true, price: 7500)
b.dogs.create(name: "Stephan", gender: "male", coat_color: "brindle", age: 1, for_sale: true, price: 1700)
b.dogs.create(name: "Davinci", gender: "male", coat_color: "lilac tri color", age: 1, for_sale: true, price: 3500)
b.dogs.create(name: "Rizzo", gender: "female", coat_color: "blue", age: 2, for_sale: true, price: 2500)