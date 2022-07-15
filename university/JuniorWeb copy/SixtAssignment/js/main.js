import { insertHeader, insertFooter, setActiveNav } from './template.js'
import { setStorageMode, eventListener } from './darkmode.js'

if ("serviceWorker" in navigator) {
    window.addEventListener("load", function() {
      navigator.serviceWorker
        .register("/serviceWorker.js")
        .then(res => console.log("service worker registered"))
        .catch(err => console.log("service worker not registered", err))
    })
}

insertHeader()
insertFooter()
setActiveNav()

setStorageMode()
eventListener()

