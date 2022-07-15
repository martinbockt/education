const express = require('express')
const fs = require('fs')
const path = require('path');

// const router = express.Router();

let data = fs.readFileSync("data.json","utf-8")

const app = express()
// app.use("/",router);




app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname+'/index.html'))
})

app.post('/customer', (req, res) => {
    if (req.query.user === undefined || req.query.password === undefined) {
        return res.send("data missing")
    }
    let customer = {
        name: req.query.user,
        password: req.query.password,
    }

    let data = fs.readFileSync(__dirname+ "/"+ "customer.json")
    let myObject = JSON.parse(data)

    for (const element of myObject) {
        if (customer.name === element.name) {
            return res.send("customer already exists")
        }
    }

    myObject.push(customer)
    var newData2 = JSON.stringify(myObject)

    fs.writeFile("customer.json", newData2, (err) => {
    if (err) throw err;
    res.send("New data added")
    console.log("New data added")
    })
})


app.put('/customer', (req, res) => {
    let customer = {
        name: req.query.user,
        password: req.query.password,
    }

    let data = fs.readFileSync(__dirname+ "/"+ "customer.json")
    let myObject = JSON.parse(data)
    for (const element of myObject) {
        if (customer.name === element.name) {
            element.password = customer.password
        }
    }

    var newData2 = JSON.stringify(myObject);

    fs.writeFile("customer.json", newData2, (err) => {
    if (err) throw err;
    res.send("New data added")
    console.log("New data added")
    })
})

app.delete('/customer/:id', (req, res) => {
    let data = fs.readFileSync(__dirname+ "/"+ "customer.json")
    let myObject = JSON.parse(data)

    let filteredObj = myObject.filter( (value, index, arr) => { 
            return value.name !== req.params.id;
    })

    var newData2 = JSON.stringify(filteredObj)

    fs.writeFile("customer.json", newData2, (err) => {
    if (err) throw err;
    res.send("New data added")
    console.log("New data added")
    })
})

app.post('/project', (req, res) => {
    if (req.query.name === undefined || req.query.description === undefined) {
        return res.send("data missing")
    }
    let customer = {
        name: req.query.name,
        description: req.query.description,
    }

    let data = fs.readFileSync(__dirname+ "/"+ "project.json")
    let myObject = JSON.parse(data)

    for (const element of myObject) {
        if (customer.name === element.name) {
            return res.send("customer already exists")
        }
    }

    myObject.push(customer)
    var newData2 = JSON.stringify(myObject)

    fs.writeFile("project.json", newData2, (err) => {
    if (err) throw err;
    res.send("New data added")
    console.log("New data added")
    })
})


app.put('/project', (req, res) => {
    let customer = {
        name: req.query.name,
        description: req.query.description,
    }

    let data = fs.readFileSync(__dirname+ "/"+ "project.json")
    let myObject = JSON.parse(data)
    for (const element of myObject) {
        if (customer.name === element.name) {
            element.description = customer.description
        }
    }

    var newData2 = JSON.stringify(myObject);

    fs.writeFile("project.json", newData2, (err) => {
    if (err) throw err;
    res.send("New data added")
    console.log("New data added")
    })
})

app.delete('/project/:id', (req, res) => {

    let data = fs.readFileSync(__dirname+ "/"+ "project.json")
    let myObject = JSON.parse(data)

    let filteredObj = myObject.filter( (value, index, arr) => { 
            return value.name !== req.params.id;
    })

    var newData2 = JSON.stringify(filteredObj)

    fs.writeFile("project.json", newData2, (err) => {
    if (err) throw err;
    res.send("New data added")
    console.log("New data added")
    })
})

app.post('/contract', (req, res) => {
    if (req.query.name === undefined || req.query.description === undefined) {
        return res.send("data missing")
    }
    let customer = {
        name: req.query.name,
        description: req.query.description,
    }

    let data = fs.readFileSync(__dirname+ "/"+ "contract.json")
    let myObject = JSON.parse(data)

    for (const element of myObject) {
        if (customer.name === element.name) {
            return res.send("customer already exists")
        }
    }

    myObject.push(customer)
    var newData2 = JSON.stringify(myObject)

    fs.writeFile("contract.json", newData2, (err) => {
        if (err) throw err;
        res.send("New data added")
        console.log("New data added")
    })
})


app.put('/contract', (req, res) => {
    let customer = {
        name: req.query.name,
        description: req.query.description,
    }

    let data = fs.readFileSync(__dirname+ "/"+ "contract.json")
    let myObject = JSON.parse(data)
    
    for (const element of myObject) {
        if (customer.name === element.name) {
            element.description = customer.description
        }
    }

    var newData2 = JSON.stringify(myObject);

    fs.writeFile("contract.json", newData2, (err) => {
    if (err) throw err;
    res.send("New data added")
    console.log("New data added")
    })
})

app.delete('/contract/:id', (req, res) => {

    let data = fs.readFileSync(__dirname+ "/"+ "contract.json")
    let myObject = JSON.parse(data)

    let filteredObj = myObject.filter( (value, index, arr) => { 
            return value.name !== req.params.id;
    })

    var newData2 = JSON.stringify(filteredObj)

    fs.writeFile("contract.json", newData2, (err) => {
    if (err) throw err;
    res.send("New data added")
    console.log("New data added")
    })
})


app.listen(3000,() => {
    console.log("Started on PORT 3000");
})