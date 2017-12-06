const express = require('express');
const bodyParser = require('body-parser');
const app = express();
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended:false}));

//-------------------------------------------------------------
const path = require('path');
app.use(express.static(path.join(__dirname, 'public')));

//-------------------------------------------------------------
app.get('/', (request, response)=>{
  response.send('stay calm...it is working...');
});

const coRouter = require('./routes/cohort');
app.use('/cohort', coRouter);



const DOMAIN = 'localhost';
const PORT = '3002';
app.listen(PORT, DOMAIN, ()=>{
  console.log(`Server is listening on http://${DOMAIN}: ${PORT}`);
});


// to chrome: http://localhost:3002/





//
