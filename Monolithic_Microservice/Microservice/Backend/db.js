const mysql = require("mysql2/promise");

const connection = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "password",
  database: "mac_monitor",
});

module.exports = connection;
