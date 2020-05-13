"use strict";

async function getData(url) {
  const response = await fetch(url);
  const json = await response.json();
  console.log(json);
  return json;
}

function getRecipeImage(recipe) {
  const image = document.createElement("img");
  image.setAttribute("src", recipe.strMealThumb);
  image.setAttribute("alt", recipe.strMeal);

  return image;
}

export { getData, getRecipeImage };
