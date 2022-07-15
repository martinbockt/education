// const root = document.querySelector(':root').style

// const inputSwitch = () => document.querySelector('#toggle-input')
// const currentTheme = () => localStorage.getItem('theme')

// const setSyle = (light, dark, changeTo) => {
//     root.setProperty('--light', `var(--${light})`)
//     root.setProperty('--dark', `var(--${dark})`)
//     localStorage.setItem('theme', changeTo)
// }

// const setLight = () => setSyle('ON', 'OFF', 'light')
// const setDark = () => setSyle('OFF', 'ON', 'dark')

// export const currentMode = () => currentTheme() === 'dark' ? setDark() : setLight()
// export const eventListener = () => inputSwitch().addEventListener('click', () => currentTheme() === 'dark' ? setLight() : setDark())


const storageMode = () => localStorage.getItem('theme')
const setStorage = (changeTo) => localStorage.setItem('theme', changeTo)

const currentMode = () => toggleinput.checked
const toggleCheckbox = () => toggleinput.checked = true

export const setStorageMode = () => storageMode() === 'true' ? toggleCheckbox() : null

export const eventListener = () => toggleinput.addEventListener('change', () => currentMode() === true ? setStorage('true') : setStorage('false'))
// export const eventListener = () => toggleinput.addEventListener('change', () => console.log('test'))