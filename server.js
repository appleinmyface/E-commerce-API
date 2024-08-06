const express = require('express');
const routes = require('./routes');
const sequelize = require('./config/connection'); // Sequelize

const app = express();
const PORT = process.env.PORT || 3001;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(routes);

// Define a route handler for the root URL
app.get('/', (req, res) => {
  res.send('Welcome to the E-commerce API');
});

// Redirect root URL to /api/products
app.get('/redirect', (req, res) => {
  res.redirect('/api/products');
});

// Catch-all route for undefined routes
app.use((req, res) => {
  res.status(404).send('Wrong route');
});

// sync sequelize models to the database, then turn on the server
sequelize.sync().then(() => {
  app.listen(PORT, () => {
    console.log(`App listening on port ${PORT}!`);
  });
});
