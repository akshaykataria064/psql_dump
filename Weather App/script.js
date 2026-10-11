const weatherIcon = document.getElementById("weather-icon");
const mainTemp = document.getElementById("main-temperature");
const feelsLike = document.getElementById("feels-like");
const humidity = document.getElementById("humidity");
const wind = document.getElementById("wind");
const windGust = document.getElementById("wind-gust");
const windDirection = document.getElementById("wind-direction");
const weatherMain = document.getElementById("weather-main");
const cityLocation = document.getElementById("location");
const dropdown = document.querySelector("select");
const getWeatherBtn = document.getElementById("get-weather-btn");
const result = document.getElementById("result");

async function getWeather(city) {
  try {
    const res = await fetch(`https://weather-proxy.freecodecamp.rocks/api/city/${city}`);
    const data = await res.json();
    return data;
  }
  catch (error) {
    console.log(error);
  }
}

async function showWeather(city) {
  const data = await getWeather(city);

  if (data === undefined || data.cod === "404" || !data.main) {
    alert("Something went wrong, please try again later");
    return;
  }

  mainTemp.innerText = data.main.temp !== undefined ? `${data.main.temp}° C` : "N/A";
  feelsLike.innerText = `Feels Like: ${data.main.feels_like !== undefined ? data.main.feels_like + "° C" : "N/A"}`;
  humidity.innerText = `Humidity: ${data.main.humidity !== undefined ? data.main.humidity + "%" : "N/A"}`;
  wind.innerText = `Wind: ${data.wind.speed !== undefined ? data.wind.speed + " m/s" : "N/A"}`;
  windGust.innerText = `Gusts: ${data.wind.gust !== undefined ? data.wind.gust + " m/s" : "N/A"}`;
  weatherMain.innerText = data.weather[0].main !== undefined ? data.weather[0].main : "N/A";
  cityLocation.innerText = data.name !== undefined ? data.name : "N/A";
  weatherIcon.src = data.weather[0].icon !== undefined
    ? data.weather[0].icon
    : "";

  windDirection.style.transform = data.wind.deg !== undefined
    ? `translate(-50%, -100%) rotate(${data.wind.deg}deg)`
    : "translate(-50%, -100%) rotate(0deg)";

  result.classList.remove("hidden");
}

getWeatherBtn.addEventListener("click", () => {
  const city = dropdown.value;
  if (city === "") {
    return;
  }
  showWeather(city);
});