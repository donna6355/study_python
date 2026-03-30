let cats = ['Mir','Moomin','Kkomi'];
cats.push('Dooboo' ) // ['Mir','Moomin','Kkomi','Dooboo']
cats.pop('Dooboo')// ['Mir','Moomin','Kkomi']

cats.unshift('Dooboo') // ['Dooboo','Mir','Moomin','Kkomi']
cats.shift('Dooboo') // ['Mir','Moomin','Kkomi']

cats.splice(1, 0, 'Dooboo') // ['Mir','Dooboo','Moomin','Kkomi']
cats.splice(1, 1) // ['Mir','Moomin','Kkomi']


for (let i = 0; i < cats.length; i++) {
  const element = cats[i];
  console.log(element);
}

cats.forEach(el => {
  console.log(el);
});

cats.filter(el => el[0] === 'M').forEach(el => console.log(el)); // ['Mir','Moomin']


let stray = {
  name : 'Garfield',
  age : 5,
  color : 'orange',
  isFat : true,
  cry : ()=> {console.log('MEOW~~~~')}
}
stray.cry() // MEOW~~~~