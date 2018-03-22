document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  // let input = document.getElementsByClassName("favorite-input")[0];
  // let inputButton = document.getElementsByClassName("favorite-submit")[0];
  // let ul = document.getElementById('sf-places');
  //
  // inputButton.onclick = function(e) {
  //   e.preventDefault();
  //   // console.log(e);
  //   // console.log(e.target);
  //   let value = input.value;
  //   let li = document.createElement("LI");
  //   li.innerHTML = value[0].toUpperCase() + value.slice(1);
  //   ul.appendChild(li);
  //   input.value = "";
  // };

  const handleFavoriteSubmit = (e) => {
    e.preventDefault();

    const input = document.querySelector(".favorite-input");
    let ul = document.getElementById('sf-places');

    let value = input.value;
    input.value = "";
    let li = document.createElement("LI");
    li.textContent = value;
    ul.appendChild(li);

  };

  const inputButton = document.getElementsByClassName("favorite-submit")[0];
  inputButton.addEventListener("click", handleFavoriteSubmit);


  // adding new photos

  // --- your code here!
  let photoUl = document.getElementsByClassName('dog-photos')[0];
  let showButton = document.getElementsByClassName('photo-show-button')[0];

  showButton.onclick = function(e) {
    e.preventDefault();
    let li = document.createElement("LI");
    let img = document.createElement("IMG");
    img.src = "http://www.golden-retriever.com/wp-content/uploads/2015/06/cute-golden-retriever-happy-puppies.jpg";
    li.appendChild(img);
    photoUl.appendChild(li);
  };





});
