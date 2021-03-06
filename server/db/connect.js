const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  password: 'Khyshu#12345',
  host: 'localhost',
  port: 5432,
  database: 'b2c_payment'
});

const getClient = async () => {
  try {
    const client = await pool.connect();
    return client;
  } catch (error) {
    return null;
  }
};

module.exports = { pool, getClient };