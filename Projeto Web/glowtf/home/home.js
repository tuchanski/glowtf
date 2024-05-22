document.addEventListener("DOMContentLoaded", function () {
  const cardContainer = document.getElementById("corpo");

  let data;
  fetch("home.php").then((response) => {
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }

    if(response == null || response == undefined){
      console.log("Invalid data return!");
    }
    console.log(response.status);
    console.log(response.json());
  })
  .then((response) => {
    data = response.json();
   
  })

  console.log(data);
});
