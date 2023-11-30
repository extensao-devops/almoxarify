# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tool_category = Category.create({
    name: 'tool',
    description: 'Ferramentas de uso geral'
})

material_category = Category.create({
    name: 'material',
    description: 'Materiais de uso geral'
})

Item.create({
    name: 'pliers',
    description: 'Alicate de corte',
    category: tool_category,
    quantity: 5
})

Item.create({
    name: 'knife',
    description: 'Faca',
    category: tool_category,
    quantity: 3
})

Item.create({
    name: 'tape_measure',
    description: 'Fita métrica',
    category: tool_category,
    quantity: 10
})

Item.create({
    name: 'hammer',
    description: 'Martelo',
    category: tool_category,
    quantity: 8
})

Item.create({
    name: 'axe',
    description: 'Machado pequeno',
    category: tool_category,
    quantity: 5
})