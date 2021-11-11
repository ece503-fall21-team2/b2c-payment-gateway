
const { Pool, Client } = require("pg");

const credentials = {
  user: "postgres",
  host: "localhost",
  database: "b2c_payment_gateway",
  password: "123",
  port: 5432,
};

// Connect with a connection pool.

async function poolDemo() {
  const pool = new Pool(credentials);
  const now = await pool.query("SELECT NOW()");
  await pool.end();

  return now;
}

// Connect with a client.

async function clientDemo() {
  const client = new Client(credentials);
  await client.connect();
  const now = await client.query("SELECT name FROM customer_data");
  await client.end();

  return now;
}

// Use a self-calling function so we can use async / await.

(async () => {
  const poolResult = await poolDemo();
  console.log("Time with pool: " + poolResult.rows[0]["now"]);

  const clientResult = await clientDemo();
  console.log("Time with client: " + clientResult.rows);
})();

async function getNames() {
const pool = new Pool(credentials);
const text = `SELECT name FROM customer_data`;
return pool.query(text);
}

(async () => {
    const getNamesResult = await getNames();
    console.log(
      "Result of SELECT query for names '" +
         
        "': " +
        JSON.stringify(getNamesResult.rows, null, "  ")
    );
  
})();