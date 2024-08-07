# E-Commerce API

## Description

The E-Commerce API is a RESTful web service built using Node.js, Express, and PostgreSQL. It provides endpoints to manage products, categories, tags, and related data in an e-commerce platform. This API includes features for CRUD operations on products, categories, tags, and order management.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Setting Up the Database](#setting-up-the-database)
  - [Seeding the Database](#seeding-the-database)
  - [Starting the Server](#starting-the-server)
- [API Endpoints](#api-endpoints)
  - [Products](#products)
  - [Categories](#categories)
  - [Tags](#tags)
  - [Orders](#orders)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Features

- Create, read, update, and delete products, categories, and tags.
- Associate products with categories and tags.
- Manage customer orders and order items.

## Technologies Used

- Node.js
- Express.js
- Sequelize (ORM for PostgreSQL)
- PostgreSQL
- Insomnia/Postman (for API testing)

## Getting Started

### Prerequisites

Ensure you have the following installed:

- [Node.js](https://nodejs.org/) (v14 or higher recommended)
- [PostgreSQL](https://www.postgresql.org/download/)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/your-repository.git
   cd your-repository
   
2. **Install Dependencies**
    
    npm install

## Setting Up the Database

 Create a PostgreSQL database:

 * createdb -U postgres ecommerce_db

Run the schema to create tables:

 * psql -U postgres -d ecommerce_db -f db/schema.sql

*If you encounter an error, make sure the ecommerce_db database exists.*

Seeding the Database

*Seed the database with initial data:*

 * npm run seed

This command populates the database with sample categories, products, tags, and product tags.

Starting the Server

Start the server:

 * npm start

The server will start and listen on port 3001 by default. You can change the port by setting the PORT environment variable.

## API Endpoints
### Products

 * GET /api/products
 * Retrieve all products. Includes associated category and tag data.

 * GET /api/products/:id
 * Retrieve a single product by its ID. Includes associated category and tag data.

 * POST /api/products
 * Create a new product. Request body should include product_name, price, stock, category_id, and optionally an array of tagIds.

Example request body:

{
  "product_name": "New Product",
  "price": 19.99,
  "stock": 15,
  "category_id": 2,
  "tagIds": [1, 2]  // Optional
}

 * PUT /api/products/:id
 * Update a product by its ID. Request body should include fields to update and optionally an array of tagIds.

 * DELETE /api/products/:id
 * Delete a product by its ID.

### Categories

 * GET /api/categories
 * Retrieve all categories.

 * GET /api/categories/:id
 * Retrieve a single category by its ID.

 * POST /api/categories
 * Create a new category. Request body should include name.

Example request body:

{
  "name": "New Category"
}

 * PUT /api/categories/:id
 * Update a category by its ID. Request body should include name.

 * DELETE /api/categories/:id
 * Delete a category by its ID.

### Tags

 * GET /api/tags
 * Retrieve all tags.

 * GET /api/tags/:id
 * Retrieve a single tag by its ID.

 * POST /api/tags
 * Create a new tag. Request body should include tag_name.

Example request body:

{
  "tag_name": "New Tag"
}

 * PUT /api/tags/:id
 * Update a tag by its ID. Request body should include tag_name.

 * DELETE /api/tags/:id
 * Delete a tag by its ID.

### Contributing

Contributions are welcome! Please fork the repository, make changes, and submit a pull request. Ensure that your code adheres to the project's coding style and includes tests if applicable.


