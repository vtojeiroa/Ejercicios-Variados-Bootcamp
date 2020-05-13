"use strict";

// search: https:/ / www.themealdb.com / api / json / v1 / 1 / search.php ? s =
// recipe: https://www.themealdb.com/api/json/v1/1/lookup.php?i=

import { getData, getRecipeImage } from "/helpers.js";

const searchForm = document.querySelector("header form");
const searchFormInput = searchForm.querySelector("input");
const searchResults = document.querySelector("#results");
const searchResultsList = searchResults.querySelector("ul");
const recipeDetails = document.querySelector("#recipe");

function showRecipeDetails(recipe) {
  searchResults.classList.add("hidden");
  recipeDetails.classList.remove("hidden");

  recipeDetails.innerHTML = "";

  const title = document.createElement("h2");
  title.textContent = recipe.strMeal;

  const image = getRecipeImage(recipe);

  const details = document.createElement("p");
  details.textContent = recipe.strInstructions;

  const ingredientsTitle = document.createElement("h3");
  ingredientsTitle.textContent = "Ingredients";

  const ingredientsList = document.createElement("ul");

  for (let index = 1; index <= 20; index++) {
    const ingredient = recipe[`strIngredient${index}`];
    const measure = recipe[`strMeasure${index}`];

    if (ingredient !== "") {
      const ingredientLi = document.createElement("li");
      ingredientLi.textContent = `${ingredient} (${measure.trim()})`;
      ingredientsList.appendChild(ingredientLi);
    } else {
      break;
    }
  }

  const backToResults = document.createElement("button");
  backToResults.textContent = "Back to results";

  backToResults.addEventListener("click", function () {
    searchResults.classList.remove("hidden");
    recipeDetails.classList.add("hidden");
  });

  recipeDetails.appendChild(title);
  recipeDetails.appendChild(image);
  recipeDetails.appendChild(details);
  recipeDetails.appendChild(ingredientsTitle);
  recipeDetails.appendChild(ingredientsList);
  recipeDetails.appendChild(backToResults);
}

function showRecipes(data) {
  searchResults.classList.remove("hidden");
  recipeDetails.classList.add("hidden");

  const fragment = document.createDocumentFragment();

  searchResultsList.innerHTML = "";

  for (const meal of data.meals) {
    const li = document.createElement("li");

    const img = getRecipeImage(meal);

    const title = document.createElement("h3");
    title.textContent = meal.strMeal;

    const button = document.createElement("button");
    button.textContent = "View Recipe";

    button.addEventListener("click", function () {
      showRecipeDetails(meal);
    });

    li.appendChild(img);
    li.appendChild(title);
    li.appendChild(button);

    fragment.appendChild(li);
  }

  searchResultsList.appendChild(fragment);
}

// Se ejecuta cuando se envía el formulario
async function handleFormSubmit(event) {
  event.preventDefault();
  const searchTerm = searchFormInput.value;

  if (searchTerm === "") return;

  const url = `https://www.themealdb.com/api/json/v1/1/search.php?s=${searchTerm}`;

  try {
    const recipes = await getData(url);
    console.log(recipes);
    if (recipes.meals) {
      showRecipes(recipes);
    } else {
      alert("No results :(");
    }
  } catch (error) {
    alert("There was an error searching for recipes");
  }
}

//Cuando se envíe el formulario cancelar el envío y mostrar el valor del input
searchForm.addEventListener("submit", handleFormSubmit);
