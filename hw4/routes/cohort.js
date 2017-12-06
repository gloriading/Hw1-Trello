
const express = require('express');
const router = express.Router();
const knex = require('../db');
// ---------------------------------------------------------------------
const multer = require('multer');
const path = require('path');
const UPLOADS_DIR = 'uploads';
const upload = multer({dest: path.join(__dirname, '..', 'public', UPLOADS_DIR)});
// ---------------------------------------------------------------------

router.get('/new', (request, response) => { //real path: cohort/new
  response.render('cohort/new');
});

// '/' has to match the form action="/cohort"
router.post('/', upload.single('picture'), (request, response) => {
  const cohortsName = request.body.cohortsName;
  const members = request.body.members;

  if (cohortsName && members && request.file) { // all the inputs must not be empty
    const filename = request.file.filename;
    const logoUrl = path.join(UPLOADS_DIR, filename);

    knex
      .insert({logoUrl, cohortsName, members})
      .into('cohorts') //table name
      .returning('id')
      .then(result => response.redirect(`/cohort/${result}`)) // result is the returning id
      .catch(error => response.send(error));

  } else {
    response.render('cohort/new'); //show the page again
  }
});

// // a GET request is made to the route `/:id`, retrieving data from db
// // and render `showNew.ejs`
router.get('/:id', (request, response) =>{
  const id = request.params.id;
  knex // is the database
  .first() // want the first thing
  .from('cohorts') // from which table
  .where({id}) // with this id
  .then(entry=>{
      response.render('cohort/showNew', {entry:entry, result:"",quantity:"", checked1:null, checked2:null});
  })
  .catch(error => response.send(error));

});

// PATH: /:id VERB: POST
router.post('/:id', (request, response) => {
  const method = request.body.method;
  const quantity = request.body.quantity;
  const id = request.params.id;  // retrieve data from database again

  knex
  .first()
  .from('cohorts')
  .where({id})
  .then(entry=>{ //put the logic here because we need data from database
      const members = entry.members;
      const cohortsName = entry.cohortsName;
      // console.log(entry);
      // with .first() entry will be an object
      // with .select() entry will be an array
      let checked1, checked2, result=[];
      const nameArr = members.replace(/\s+/gi, '').split(',');

    // shuffle nameArr
      for (let i = nameArr.length - 1; i > 0; i--) {
          let j = Math.floor(Math.random() * (i + 1));
          [nameArr[i], nameArr[j]] = [nameArr[j], nameArr[i]];
      }

      function numberPerTeam(arr, n){
        let times; // times of iteration
        if(arr.length % n === 0){
          times = arr.length / n;
        }else{
          times = Math.ceil(arr.length / n);
        }
        for(let i=0; i<times; i++){
          result.push(arr.splice(0,n));
        }
        return result;
      }

      function teamCount(arr, n){
        let tempNumPerTeam;
        tempNumPerTeam = Math.floor(arr.length / n);
        for(let i=0; i<n; i++){
          result.push(arr.splice(0,tempNumPerTeam));
        }
        for(i=0; i<arr.length; i++){
          result[i].push(arr[i]);
        }
        return result;
      }

      if(method ==="numPerTeam"){
        result = numberPerTeam(nameArr, quantity);
        checked2 = "checked";
      }else if(method === "teamCount"){
        result = teamCount(nameArr, quantity);
        checked1 = "checked";
      }

      response.render('cohort/showNew', {entry, result, quantity, checked1, checked2});

  })
});


// List of cohorts  --------------------------------------------------------
router.get('/', (request, response) => {

  knex
    .select()
    .from('cohorts')
    .orderBy('created_at', 'DESC')
    .then(lists => {
      response.render('cohort/cohorts', {lists});
    });

})


module.exports = router;









//
