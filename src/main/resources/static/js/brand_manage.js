document.addEventListener("DOMContentLoaded", function () {
  const messageElement = document.getElementById("successMessageHolder");
  if (messageElement) {
    const msg = messageElement.dataset.message;
    if (msg) {
      alert(msg);
    }
  }
});
