alert('Hello, World!')

let student = 'Moomin';
let score = 90;

let grade;
if(score >=90){
  grade = 'A';
}else if (score >=80){
  grade = 'B';
}else if (score >=70){
  grade = 'C';
}else if (score >=60){
  grade = 'D';
}else{
  grade = 'F';
}

console.log(`${student} scored ${score} and got grade ${grade}.`);

if(grade ==='F'){
  console.log('You need to try scond exam.');
}else{
  console.log('Congratulations! You passed the exam.'); 
}

let isVip = true;
let hasTicket = false;
if(isVip || hasTicket){
  console.log('Welcome to the event!');
} else{
  console.log('Sorry, you cannot enter the event.');
}
