const express = require("express");
const bodyParser = require("body-parser");
const monitor = require("./monitor");
const db = require("./db");

const app = express();
const PORT = 3000;

app.use(express.static("frontend"));
app.use(bodyParser.json());

app.get("/api/monitor", async (req, res) => {
  try {
    const results = await db.query(
      "SELECT * FROM monitor_data ORDER BY timestamp DESC"
    );
    res.json(results);
  } catch (error) {
    console.error("Error fetching monitor data:", error);
    res.status(500).send("Internal Server Error");
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  monitor.start();
});
