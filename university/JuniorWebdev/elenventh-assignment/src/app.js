const express = require('express');
const path = require('path');
const app = express();
const nano = require('nano')('http://admin:321start@127.0.0.1:5984');
const port = 1999
const db = nano.db.use('eleventh-database');

app.use( (req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept'
    );
    next();
});


const getData = async ({id}) => {
    try {
        const info = await db.get(id)
        return info
    } catch (error) {
        return error
    }
}

const getBulk = async () => {
    try {
        let datalist = []
        const doclist = await db.list({include_docs: true})
        .then((body) =>
            body.rows.forEach((row) => {
                datalist.push(row.doc)
        }), (error) => {
            return error
        })
        return datalist
    } catch (error) {
        return error
    }

}

const createData = async ({name, phone}) => {
    try {
        const response = await db.insert({ name: name, phone: phone })
        return response
    } catch (error) {
        return error
    }
}

const updateData = async ({id, rev, name, phone}) => {
    try {
        console.log(id + name + phone)
        const response = await db.insert({ _id: id, _rev: rev, name: name, phone: phone })
        return response 
    } catch (error) {
        return error
    }
}

const deleteData = async ({id, rev}) => {
    try {
        const response = await db.destroy(id, rev)
        return response
    } catch (error) {
        return error
    }
}

app.get('/', async (req, res) => {
    const data = await getData(req.query)
    return res.send(data);
});

app.get('/bulk', async (req, res) => {
    const data = await getBulk()
    return res.send(data)
})

app.post('/', async (req, res) => {
    const data = await createData(req.query)
    return res.send(data);
  });
  
app.put('/', async (req, res) => {
    data = await updateData(req.query)
    return res.send(data);
});
  
app.delete('/', async (req, res) => {
    const data = await deleteData(req.query)
    return res.send(data)
});
  




app.listen(port, () => {
  console.log('App is listening on port' + port);
});