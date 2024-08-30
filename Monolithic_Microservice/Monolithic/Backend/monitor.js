const { exec } = require("child_process");
const db = require("./db");

function runCommand() {
  console.log("***************** Runing *****************");
  exec(
    " echo 'password' | sudo powermetrics --samplers cpu_power |  grep 'CPU Power' ",
    async (error, stdout, stderr) => {
      console.log(stdout);
      if (error) {
        console.error("Error executing powermetrics:", error);
        return;
      }
      const data = stdout.trim();
      const timestamp = new Date();

      try {
        await db.query(
          "INSERT INTO monitor_data (timestamp, data) VALUES (?, ?)",
          [timestamp, data]
        );
        console.log("Data stored:", timestamp, data);
      } catch (error) {
        console.error("Error storing data in database:", error);
      }
    }
  );
}

function start() {
  setInterval(runCommand, 10000); // Run every 30 seconds
}

module.exports = { start };
