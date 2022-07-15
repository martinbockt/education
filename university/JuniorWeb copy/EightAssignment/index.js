const https = require('https')

const express = require('express')
const port = 2000

const app = express()

let data = ""

const options = {
    host: 'xu-university.com',
    method: 'get',
    path: '/'
}

const request = https.request(options, res => {
    console.log(`statusCode: ${res.statusCode}`)

    res.on('data', d => {
        data += d
    })
})

request.on('error', error => {
    console.error(error)
})

request.end()

app.get('/', (req, res) => res.send(data))
app.listen(port, () => console.log('listening on Port ' + port))