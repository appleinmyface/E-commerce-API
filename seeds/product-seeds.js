const { Product } = require('../models');

const productData = [
  { product_name: 'Laptop', price: 799.99, stock: 10, category_id: 1 },
  { product_name: 'Smartphone', price: 699.99, stock: 10, category_id: 1 },
  { product_name: 'Tablet', price: 299.99, stock: 10, category_id: 1 },
  { product_name: 'T-Shirt', price: 9.99, stock: 10, category_id: 2 },
  { product_name: 'Dress Shirt', price: 19.99, stock: 10, category_id: 2 },
  { product_name: 'Jeans', price: 29.99, stock: 10, category_id: 2 },
  { product_name: 'Python Programming', price: 29.99, stock: 10, category_id: 3 },
  { product_name: 'JavaScript Programming', price: 29.99, stock: 10, category_id: 3 },
  { product_name: 'HTML & CSS', price: 19.99, stock: 10, category_id: 3 },
];

const seedProducts = () => Product.bulkCreate(productData);

module.exports = seedProducts;
