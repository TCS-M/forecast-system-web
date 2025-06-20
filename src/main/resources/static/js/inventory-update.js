function updateInventory() {
  const date = document.getElementById("saleDate").value;
  if (!date) return;

  fetch('/api/inventory?date=' + date)
    .then(response => response.json())
    .then(data => {
      const rows = document.querySelectorAll(".sales-table tbody tr");
      rows.forEach((row, index) => {
        const productName = row.querySelector("td").textContent.trim();
        const stockCell = row.querySelector(".stock-cell");
        stockCell.textContent = data[productName] ?? 0;
      });
    });
}

document.addEventListener("DOMContentLoaded", () => {
  const dateInput = document.getElementById("saleDate");
  if (dateInput) {
    dateInput.addEventListener("change", updateInventory);
  }
});
