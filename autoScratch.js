const axios = require('axios');
const  fs = require('fs');
axios.get('https://dear-family-server.herokuapp.com/db.json', {responseType: 'blob'}).then(response => {
    console.log(response.data)
    fs.writeFile('public/db.json', JSON.stringify(response.data), (err) => {
        if (err) throw err;
        console.log('The file has been saved!');
    });
});