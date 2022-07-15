const headerString = `
<input id="mobileToggle" type="checkbox"/>
<div class="wrapper">
    <img src="./images/XU_Logo.jpeg" height="80" style="height: 100%;" alt="XU Logo">
    <div class="flex">
        <nav>
            <ul>
                <a href="./index.html"><li>Home</li></a>
                <a href="./team.html"><li>Team</li></a>
                <a href="./price.html"><li>Price Calculator</li></a>
                <a href="./contact.html"><li>Contact</li></a>
            </ul>
        </nav>
        <div style="width: 50px; height: 30px;">
           <!-- <input name="toggle" id="toggle-input" class="toggle" type="checkbox">
            <label for="toggle-input" id="toggle-label">
                <span id="toggle-span" data-on="On" data-off="Off"></span>
            </label> -->
        </div>
        <label for="mobileToggle" class="icon nav-icon">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </label>
    </div>
</div>
<nav class="mobile">
    <ul>
        <a href="./index.html"><li>Home</li></a>
        <a href="./team.html"><li>Team</li></a>
        <a href="./price.html"><li>Price Calculator</li></a>
        <a href="./contact.html"><li>Contact</li></a>
    </ul>
</nav>
`

const footerString = `
<div class="wrapper flex">
    <address class="flex-column align-left" style="text-align: initial;">
        <h3>Address</h3>
        XU Code Factory GmbH<br/>
        Mehringdamm 33<br/>
        10961 Berlin<br/>
    </address>
    <div class="flex-column align-left">
        <h3>Group</h3>
        <a href="digital.xu-group.de/" target="_blank" rel="noreferrer noopener">XU Group</a>
        <a href="https://xu-university.com" target="_blank" rel="noreferrer noopener">XU University</a>
    </div>
    <div id="partner" class="flex-column align-left">
        <h3>Partner</h3>
        <a href="https://www.adesso.de/de/index.jsp" target="_blank" rel="noreferrer noopener">Adesso</a>
        <a href="https://www.bosch.de" target="_blank" rel="noreferrer noopener">Bosch</a>
    </div>
    <img src="./images/XU_Logo.jpeg" height="200" style="height: 100%; position: absolute; right: 0;"  alt="XU Logo">
</div>
`

// const header = document.getElementById('header')
// const footer = document.getElementById('footer')

const currentLocation = () => window.location.pathname
const activeNav = () => document.querySelector(`[href=".${currentLocation()}"]`)

export const insertHeader = () => header.innerHTML = headerString
export const insertFooter = () => footer.innerHTML = footerString
export const setActiveNav = () => activeNav().setAttribute("class","active")