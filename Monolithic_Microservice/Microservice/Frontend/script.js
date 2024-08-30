document.addEventListener("DOMContentLoaded", () => {
  fetchData();
  setInterval(fetchData, 30000); // Fetch data every 30 seconds

  function fetchData() {
    fetch("http://localhost:3000/api/monitor")
      .then((response) => response.json())
      .then((data) => {
        const tbody = document.querySelector("#monitorTable tbody");
        tbody.innerHTML = "";
        data.forEach((row) => {
          const tr = document.createElement("tr");
          tr.innerHTML = `<td>${new Date(
            row.timestamp
          ).toLocaleString()}</td><td>${row.data}</td>`;
          tbody.appendChild(tr);
        });
      })
      .catch((error) => console.error("Error fetching data:", error));
  }
});
