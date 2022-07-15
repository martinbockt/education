const staticDevCoffee = "dev-coffee-site-v1"
const assets = [
  "/",
  "/index.html",
  "/team.html",
  "/price.html",
  "/team.html",
  "/css/fonts.css",
  "/css/form.css",
  "/css/main.css",
  "/css/mobilenav.css",
  "/css/price.css",
  "/css/teams.css",
  "/css/template.css",
  "/css/toggle.css",
  "/js/darkmode.js",
  "/js/main.js",
  "/js/template.js",
  "/images/appDev.svg",
  "/images/techCons.svg",
  "/images/webDev.svg",
  "/images/hero.jpg",
  "/images/XU_Logo.jpeg",
  "/images/references/abmahnsicher.png",
  "/images/references/bosch.png",
  "/images/references/mc-donalds.png",
  "/images/references/vw.png",
  "/images/references/xu-group.png",
  "/images/references/xu-university.png",
  "/images/social-media/GitHub-Mark-64px.png",
  "/images/social-media/Gmail.png",
  "/images/social-media/Instagram_Glyph_Gradient.png",
  "/images/social-media/LI-In-Bug.png",
  "/images/teams/teams-img1.jpg",
  "/images/teams/teams-img2.jpg",
  "/images/teams/teams-img3.jpg",
  "/images/teams/teams-img4.jpg",
  "/images/teams/teams-img5.jpg",
  "/images/teams/teams-img6.jpg",
  "/images/teams/teams-img7.jpg",
  "/images/teams/teams-img8.jpg",
  "/fonts/wotfard-bold-webfont.eot",
  "/fonts/wotfard-bold-webfont.ttf",
  "/fonts/wotfard-bold-webfont.woff2",
  "/fonts/wotfard-extralight-webfont.eot",
  "/fonts/wotfard-extralight-webfont.ttf",
  "/fonts/wotfard-extralight-webfont.woff2",
  "/fonts/wotfard-light-webfont.eot",
  "/fonts/wotfard-light-webfont.ttf",
  "/fonts/wotfard-light-webfont.woff2",
  "/fonts/wotfard-medium-webfont.eot",
  "/fonts/wotfard-medium-webfont.ttf",
  "/fonts/wotfard-medium-webfont.woff2",
  "/fonts/wotfard-regular-webfont.eot",
  "/fonts/wotfard-regular-webfont.ttf",
  "/fonts/wotfard-regular-webfont.woff2",
  "/fonts/wotfard-semibold-webfont.eot",
  "/fonts/wotfard-semibold-webfont.ttf",
  "/fonts/wotfard-semibold-webfont.woff2",
  "/fonts/wotfard-thin-webfont.eot",
  "/fonts/wotfard-thin-webfont.ttf",
  "/fonts/wotfard-thin-webfont.woff2"
]

self.addEventListener("install", installEvent => {
  installEvent.waitUntil(
    caches.open(staticDevCoffee).then(cache => {
      cache.addAll(assets)
    })
  )
})

self.addEventListener("fetch", fetchEvent => {
    fetchEvent.respondWith(
      caches.match(fetchEvent.request).then(res => {
        return res || fetch(fetchEvent.request)
      })
    )
  })