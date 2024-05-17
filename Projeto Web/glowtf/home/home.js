document.addEventListener("DOMContentLoaded", function () {
  const appListContainer = document.getElementById("appList");
  const appDetails = document.getElementById("appDetails");

  fetch("home.php").then((response) => {
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    console.log(response.status);
    console.log(response.json());
  });
});
