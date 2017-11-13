//global variable
const hello = {
    'Tester Board': {
      'To Do': ['Laundry', 'Buy Apples', 'Pay Phone Bill'],
      'Doing': ['Laundry', 'Studying Javascript', 'Studying HTML', 'Studying Ruby'],
      'Done': ['Laundry']
    },
    'Dreams': {
      'Wish List': ['Conquer the Seven Kingdoms', 'Get my baby back', 'My hand needs to chill'],
    }
};
//============================================================================
// [listBoards]
// Write a function called listBoards that will return a string that lists
// all boards as follows:
// Make sure that the board number is displayed beside it starting with 1,

function listBoards(obj){
  let result ="";
  let counter = 1;
  for(let key in obj){
      result += ` ------------- \n ${counter}- ${key} \n`;
      counter++;
  }
  result += ` -------------`;
  return result;
}
// console.log(listBoards(hello));

//============================================================================
// [createBoard]
// Write a function named createBoard that takes one argument, boardName,
// then creates a board if there is no board with the same name
// (meaning that it adds a board to the object assigned to the variable, hello.)
// The function should return, Board '<board-name>' was created.
// If there is already a board with the same name, it should return
// Board already exists. Use your listBoards function to display before and after
// creating a board to test that it worked successfully.
//
// Example Usage:
// createBoard('Cuisine') // returns "Board 'Cuisine' was created"
//                        // Adds the board `Cuisine` to `hello`
// createBoard('Tester Board') // returns "Board already exists"

function createBoard(boardName){
  let result = true;
  for(let key in hello){
    if(key === boardName){
      result = `Board '${boardName}' already exists.`;
    }
  }
  if (result === true){
    // if result is still true, meaning it has not been re-assigned.
    hello[boardName] = {};
    result = `A new board '${boardName}' was created.`;
  }
  return result;
}
// listBoards(hello);
// console.log(createBoard('Workouts'));
// listBoards(hello);
//============================================================================
// [removeBoard]
// Write a function named 'removeBoard' that takes one argument, boardName,
// then, if a board with the name exists, remove it and return,
// Board 'Hello' was removed. If no board with the passed name exists,
// it should return Board doesn't exist
//
// removeBoard('Tester Board')
// returns "Board 'Tester Board' was removed"
// removes the board `Test Board` from `hello`
//

function removeBoard(boardName){
  let result = true;
  for(let key in hello){
    if(key === boardName){
      delete hello[key];
      result =`Board '${boardName}' was removed`;
    }
  }
  if(result===true){
      result =`Board '${boardName}' doesn't exist`;
    }
  return result;
}
// console.log(listBoards(hello));
// console.log(removeBoard('Tester Board'));
// console.log(listBoards(hello));
//============================================================================
// [displayBoard]
// Build a function named displayBoard that takes a boardName as argument
// that behaves as follows:
// If it is called with a board that doesn't exist, it should return
// Board doesn't exist.
// If it exists, it should return a string that looks like:
//   |--------------
//   | To Do
//   |--------------
//   |> Laundry
//   |> Buy Apples
//   |> Pay Phone Bill
//   |--------------
//
function displayBoard(boardName){
  let result="";
  for(let key in hello){
    if(key === boardName){
      for(let innerKey in hello[key]){
          result += `|------------- \n|${innerKey} \n|------------- \n`;
          let innerArr = hello[key][innerKey];
          for(let element of innerArr){
            result += `|> ${element} \n`;
          }
        }
      }
    }

  if(result){
      result += `|-------------`;
      // "if(result)" means if result is true (it's been reassigned)
      // add the last line
    }else{
      result = `Board '${boardName}' doesn't exist`;
    }
  return result;
}
// console.log(displayBoard("Tester Board"));
//============================================================================
// [createList]
// Write a function named createList that takes two arguments, boardName and listName.
// The function should create a list with name listName within board boardName
// with no cards to start. If the boardName doesn't exist,
// it should return Board doesn't exist and, if a list with the same name exists already,
// it should return List name already exists.

function createList(boardName, listName){
  let result = true;
  for(let key in hello){
    if(key === boardName){
        for(let innerKey in hello[key]){
          if(innerKey === listName){
            result = `List '${listName}' already exists! `;
          }
        }
        if(result === true){
            hello[key][listName] = [];
            result = `New List: '${listName}' was created to board '${boardName}'.`;
        }
    }
  }
  if (result ===true){
      result = `Board '${boardName}' doesn't exist! `;
  }
  return result;
}
// console.log(createList('Tester Board', 'Doing'));
//============================================================================
// [createCard]
// Build a function called createCard that takes three arguments:
// boardName, listName and cardName. The function should add a card to the array
// of cards for the listName list within boardName board.
// It should return Board doesn't exist if no board with boardName exists and
// it should return List doesn't exist if no list with name listName within board
// boardName exists. It's ok to have two cards with the same name within a given list.

function createCard(boardName, listName, cardName){
  let result = true;
  for(let key in hello){
    if(key === boardName){
      for(let innerKey in hello[key]){
        if(innerKey === listName){
          hello[key][innerKey].push(cardName);
          result = `Card '${cardName}' was add to '${innerKey}' list.`;
        }
      }
      if(result === true){
          result = `List '${listName}' doesn't exist!`;
      }
    }
  }
  if(result === true){
      result = `Board '${boardName}' doesn't exist!`;
  }
  return result;
}
// console.log(createCard('Tester Board', 'Doing', 'assignments'));

//============================================================================
// [stretch] removeList: This should take a board name and a list name and
// removes the list from the board.

function removeList(boardName, listName){
  let result = true;
  for(let key in hello){
    if(key === boardName){
        for(let innerKey in hello[key]){
          if(innerKey === listName){
            delete hello[key][innerKey];
            result = `List '${listName}' was removed! `;
          }
        }
        if(result === true){
            result = `List '${listName}' doesn't exist on board '${boardName}'`;
        }
    }
  }
  if (result === true){
      result = `Board '${boardName}' doesn't exist! `;
  }
  return result;
}
// console.log(displayBoard('Tester Board'));
// console.log(removeList('Tester Board', 'Doing'));
// console.log(displayBoard('Tester Board'));
//============================================================================
// [Stretch]removeCard: This should take a board name, a list name and a card
// index and removes the card from the list of the provided board name.


function removeCard(boardName, listName, cardIndex){
  let result = true;
  for(let key in hello){
    if(key === boardName){
        for(let innerKey in hello[key]){
          if(innerKey === listName){
            let innerArr = hello[key][innerKey];
            result = `Card '${innerArr[cardIndex]}' was removed! `;
            innerArr.splice(cardIndex,1);
          }
        }
        if(result === true){
            result = `List '${listName}' doesn't exist on board '${boardName}'`;
        }
    }
  }
  if (result === true){
      result = `Board '${boardName}' doesn't exist! `;
    }
  return result;
}
// console.log(displayBoard('Dreams'));
// console.log(removeCard('Dreams', 'Wish List', 0));
// console.log(displayBoard('Dreams'));
//============================================================================
// [Stretch]
// moveCard: This should take five argument, boardName, fromList, toList,
// fromCardIndex, toCardIndex. This should move a card with index fromCardIndex
// from the fromList to the toList. It should put it in the new list using the toCardIndex.






//for later-----------------------------------------------
// user input - node
// const readline = require ('readline');
// const interface = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });
// interface.question("a sentence please  ", function(x){
//   console.log(countChar(x));
//     process.exit();
// });
