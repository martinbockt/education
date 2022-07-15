let images = {
    image1: "./images/img1.jpg",
    image2: "./images/img2.jpg",
    image3: "./images/img3.jpg",
    image4: "./images/img4.jpg",
  };
  
const scoreInput = document.getElementById("score");
const time = document.getElementById("time");

const imagesList = [1, 2, 3, 4];

let sameImages = [];
let lastID = [];
let finished = [];
let timerState = false;

let list = [...imagesList, ...imagesList];

const timer = () => {
  time.value = "0";
  timerState = true;

  var interval = setInterval(() => {
    time.value = (10 * time.value + 1) / 10;
    if (!timerState) clearInterval(interval);
  }, 100);
};

const createDivs = (number, id) => {
  const div = document.createElement("div");
  const imageClass = `image${number}`;
  div.setAttribute("id", `image${id}`);
  div.setAttribute("class", `image${number}`);
  div.style.background = `url(${images[imageClass]})`;
  div.innerHTML = `<button onclick="reveal(${id})">?</button>`;
  document.getElementById("main").appendChild(div);
};

const reset = (id) => {
  const div = document.getElementById(`image${id}`);
  div.innerHTML = `<button onclick="reveal(${id})">?</button>`;
};

const reveal = (id) => {
  const div = document.getElementById(`image${id}`);
  const divClass = div.className;

  div.innerHTML = "";

  if (lastID.length === 0) {
    lastID = [id, divClass];
    return;
  }

  if (lastID[1] !== divClass) {
    reset(lastID[0]);
    lastID = [id, divClass];
  } else {
    finished.push(divClass);
    lastID = [];
    let score = parseInt(scoreInput.value);
    score += 1;
    scoreInput.value = score;
  }

  if (finished.length == imagesList.length) {
    timerState = false;
  }
};

const start = () => {
  document.getElementById("group").removeAttribute("hidden");

  finished = [];
  document.getElementById("main").innerHTML = "";
  timer();

  list = list.sort(() => Math.random() - 0.5);
  list.forEach((x, i) => createDivs(x, i));
};  