class Task{
  constructor(taskName, assignee){
    this.taskName = taskName;
    this.assignee = assignee;
  }
  renderTask (){
    if(this.assignee === undefined){
      return `${this.taskName}`;
    }else{
      return `${this.taskName} • ${this.assignee}`;
    }
  }
}
// ------------------------------------------------------------
class List {
  constructor(listName){
    this.listName = listName;
    this.taskArr = [];
  }
  addTask(task){
    this.taskArr.push(task);
  }
  removeTask(taskRemove){
    let targetTask;
    for(let i = 0; i < this.taskArr.length; i++){
      if(taskRemove === this.taskArr[i].taskName){
        targetTask = this.taskArr[i];
        this.taskArr.splice(i,1);
        return targetTask;
        }
      }
    return null;
  }
  renderList(){
    let result = "";
    result += `|---------\n`;
    result += `| ${this.listName}\n|---------\n`;
    for(let i = 0; i < this.taskArr.length; i++){
      result += `|${i}> ${this.taskArr[i].renderTask()} \n`;
    }
    result += `|`;
    return result;
  }
}
// ------------------------------------------------------------
class Board{
  constructor(boardName){
    this.boardName = boardName;
    this.listArr = [];
  }
  addList(list){
    this.listArr.push(list);
  }
  removeList(listRemove){
    let targetList;
    for(let i = 0; i < this.listArr.length; i++){
      if(listRemove === this.listArr[i].listName){
        targetList = this.listArr[i];
        this.listArr.splice(i,1);
        return targetList;
      }
    }
     return null;
  }

  renderBoard(){
    let result = "";
    result += `************\n`;
    result += `* ${this.boardName} *\n`;
    result += `************\n`;
    for(let i=0; i<this.listArr.length; i++){
      result += `${this.listArr[i].renderList()}\n`;
    }
    return result;
  }
  moveTaskTo(taskMove, listFrom, listTo){
    let tempTask;
    for(let i = 0; i < this.listArr.length; i++){
      if(listFrom === this.listArr[i].listName){
          tempTask = this.listArr[i].removeTask(taskMove);
      }
    }
    for(let i = 0; i < this.listArr.length; i++){
      if(listTo === this.listArr[i].listName){
        this.listArr[i].addTask(tempTask);
      }
    }
  }
}

//----------------------------------------------------------------------
// Testing Below:

// *** Example Usage: render tasks ***
// const myTask = new Task('Clean dishes');
// const myTaskWithAssignee = new Task('Wash clothes', 'You');
// myTask.renderTask();
// myTaskWithAssignee.renderTask();

// *** Example Usage: add/remove tasks + shown by renderList ***
// const toDoList = new List('To Do');
// toDoList.addTask(new Task('Laundry', 'You'));
// toDoList.addTask(new Task('Buy Apples'));
// toDoList.addTask(new Task('Pay Phone Bill', 'Me'));

// toDoList.addTask(new Task('Remove Me!'));
// toDoList.removeTask('Remove Me!');

// console.log(toDoList.renderList());

// *** Example Usage: add/remove lists, move task shown by renderBoard ***

// const toDoList = new List('To Do');
//   toDoList.addTask(new Task('Laundry', 'You'));
//   toDoList.addTask(new Task('Buy Apples'));
//   toDoList.addTask(new Task('Pay Phone Bill', 'Me'));

// const doingList = new List('Doing');
//   doingList.addTask(new Task('Laundry'));
//   doingList.addTask(new Task('Study JavaScript', 'Jill'));
//   doingList.addTask(new Task('Study HTML', 'Jill'));
//   doingList.addTask(new Task('Study Ruby', 'Me'));

// const doneList = new List('Done');
//   doneList.addTask(new Task('Laundry'));
//   doneList.addTask(new Task('Ruby Exercises Homework'));

// const myBoard = new Board('My Board');
//   myBoard.addList(toDoList);
//   myBoard.addList(doingList);
//   myBoard.addList(doneList);

// myBoard.addList(new List('Remove Me!'));
// myBoard.removeList('Remove Me!');

// myBoard.moveTaskTo('Laundry', 'To Do', 'Doing');
// myBoard.moveTaskTo('Buy Apples', 'To Do', 'Doing');

// console.log(myBoard.renderBoard());




//
