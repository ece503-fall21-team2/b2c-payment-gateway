const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  password: 'Khyshu', # Enter passsword for your databse
  host: 'localhost',
  port: 5432,
  database: 'b2c_payment' # Enter your database name
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
