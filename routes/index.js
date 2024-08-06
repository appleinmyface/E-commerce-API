const router = require('express').Router();
const apiRoutes = require('./api');

// API routes
router.use('/api', apiRoutes);

// Handle all other routes with a 404 message
router.use((req, res) => {
  res.status(404).send("<h1>Wrong Route!</h1>");
});

module.exports = router;
