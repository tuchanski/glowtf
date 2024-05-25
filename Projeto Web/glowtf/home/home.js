document.addEventListener("DOMContentLoaded", function () {
  const cardContainer = document.getElementById("corpo");

  fetch("home.php")
    .then((response) => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json(); // Parse the response as JSON
    })
    .then((data) => {
      if (!data || data.length === 0) {
        console.log("Invalid or empty data return!");
      } else {
        // For each row in the data, create an h1 element and append it to the cardContainer
        data.forEach((row) => {
          const h1 = document.createElement("h1");
          h1.textContent = row.someProperty; // Replace 'someProperty' with the actual property name from your data
          cardContainer.appendChild(h1);
        });
      }
    })
    .catch((error) => {
      console.error("Fetch error:", error);
    });
});
