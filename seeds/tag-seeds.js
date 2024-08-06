const { Tag } = require('../models');

const tagData = [
  { tag_name: 'New' },
  { tag_name: 'On Sale' },
  { tag_name: 'Clearance' },
  { tag_name: 'Popular' },
];

const seedTags = () => Tag.bulkCreate(tagData);

module.exports = seedTags;
