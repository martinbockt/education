const express = require('express')
const port = 2000

const app = express()

app.get('/', (req, res) => res.send('Hello World'))

app.get('/student', (req, res) => res.send('Hello World'))

app.post('/student', (req, res) => res.send('Hello World'))

app.post('/students', (req, res) => {
    var students = {name: 'John Doe', name2: 'Max Mustermann'}
    res.contentType('application/json')
    res.send(JSON.stringify(students))
})

app.listen(port, () => console.log('listening on Port ' + port))