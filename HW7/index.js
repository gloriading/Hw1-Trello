$(document).ready(function() {

// Setups:
  let counter = 0;
  let results = ['Berlin','Vienna','Seoul','Moscow','Brussels','Budapest',"Ottawa","London","Tehran","Lisbon"]
  let resultsLength = results.length;
  let random = Math.floor(Math.random() * resultsLength);
  let result = results[random];
  console.log(result);
  let resultLength = result.length;
  let resultSplit = result.toLowerCase().split("");

//initial solution lines/divs
  for(let i=0; i<resultLength; i++){
    $('.solution').append(`
      <div class="line box" id="${resultSplit[i]}"></div>
      `)
  }
  $('p').append(resultLength);

// audio function
  function audio(status){

    return $("<audio></audio>").attr({ // MUST put things on the same line of return
      'src':`sounds/${status}.wav`,
      'volume':0.8,
      'autoplay':'autoplay'
    }).appendTo("body")

  }
// game reset function
  function reset(){
      let r1= $('.pic img').attr('src',`images/gallows.jpg`);
      let r2= $('.letter').removeClass('coral correct');
      let r3= $('.line').removeClass('correct');
      let r4= $('.solution .line').html(' ');
      return r1, r2, r3, r4, counter = 0;
  }

// -----------------------------------------------------------------------
// [stretch] CHOOSE WITH KEYPRESS

// $(document).on("keypress", e => {
//   // console.log(e.key.toLowerCase()); //get letters
//   // console.log(e.which);// get keyCode
//   // console.log(e.keyCode);// get keyCode
//   // e.currentTarget; // this is document, don't need it here
//   let code = e.keyCode;
//   let v = e.key.toLowerCase();
//   let keyPressed = `.letter#${v}`; // we press the letter with id == e.key
//
//   if (code >= 65 && code <=122){ // LIMIT THE VALID input to only letters!
//
//     if( !$(keyPressed).hasClass('coral') ){
//
//         $(keyPressed).addClass('coral');
//
//         for(let elem of resultSplit){
//           if(elem === v){
//             $(`.solution #${elem}`).html(`${elem.toUpperCase()}`);
//             $(`.solution #${elem}`).addClass('correct');
//             $(keyPressed).addClass('correct');
//           }
//         }
//
//         if( !$(keyPressed).hasClass('correct') ){
//             counter ++;
//             if(counter > 6){
//                 audio('failure');
//                 alert('game over!!!');
//                 reset(); // don't reload for new questions, stay on the same question
//                 // setTimeout(function(){
//                 //   alert('game over!!!');
//                 //   location.reload();
//                 // },100)
//
//             }else{
//                 $('.pic img').attr('src',`images/gallows-${counter}.jpg`);
//             }
//         }
//       }
//
//         if( $('.solution .correct').length == resultLength){
//           setTimeout(function(){
//             audio('victory');
//             // alert('YEAH!!!');
//             // reset();
//             setTimeout(function(){
//               alert('YEAH!!!');
//               location.reload(); //reload to get a new/random question
//             },100)
//           },100);
//         }
//
//   }else{
//     alert('please press a letter key.');
//   }
//
// })

//-------------------------------------------------------------------------
// CHOOSE WITH MOUSE CLICKS

  $('.letter').on('click', e => {
    let clicked = e.currentTarget; // the letter we clicked on

    if( !$(clicked).hasClass('coral') ){
        // if the letter does NOT have class 'coral'
        // 1- add '.coral' to change color, this represents `it has been clicked`

        $(clicked).addClass('coral');
        v = clicked.id; // the id of the letter clicked

        for(let elem of resultSplit){
          // compare the letter clicked with the solution
          // if the id of the letter clicked matches a letter
          // 1- place the correct letter and add class 'correct' to solution boxes
          // 2- add a class 'correct' to correct letters
          if(elem === v){
            $(`.solution #${elem}`).html(`${elem.toUpperCase()}`);
            $(`.solution #${elem}`).addClass('correct');
            $(clicked).addClass('correct');
          }
        }

      if( !$(clicked).hasClass('correct') ){
        // if the letter clicked does NOT have class 'coral' nor 'correct'
        // 1- add 1 to the counter
        // 2- change the image according to the value of the counter
        // 3- reset the picture after counter > 6 (failure)
          counter ++;
          console.log(counter);
          if(counter > 6){ // game over, `inform the user` and `reset the game `
              audio('failure');
              alert('game over!!!');
              reset();
          }else{
              $('.pic img').attr('src',`images/gallows-${counter}.jpg`);
          }
      }

        if( $('.solution .correct').length == resultLength){
          setTimeout(function(){
            audio('victory');
            // alert('YEAH!!!');
            // reset();
            setTimeout(function(){
              alert('YEAH!!!');
              location.reload();//reload to get a new/random question
            },100)
          },100);
        }
    }

  })
  //
  //
  // --------------------------------------------------------------------------

// can be improved:
// 1- winning situation: the word is added after the cheering





});
