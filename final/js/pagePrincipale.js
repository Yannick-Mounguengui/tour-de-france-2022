
window.addEventListener('load',initForm);
window.addEventListener('load',initEtapes);

function initEtapes(tab){
  let liste = document.getElementById("etapes");
  for (item of liste.querySelectorAll('li')){
    item.addEventListener('mouseenter',addDetailEtape);
    item.addEventListener('mouseleave',removeDetailEtape);
    item.addEventListener('click',loadClassement);
  }
}

function addDetailEtape(ev){
  const item = ev.currentTarget;
  d = new Date(item.dataset.date);
  infos  = `<div class="info"><p>${item.dataset.nom}</p><p>le ${d.toLocaleDateString()} : ${item.dataset.distance} km</p></div>`;
  item.insertAdjacentHTML('beforeend',infos);
}
function removeDetailEtape(ev){
  const item = ev.currentTarget;
  item.querySelector('div.info').remove();
}

function loadClassement(ev){
  let url = 'services/getClassement.php?etape='+ this.dataset.numero;
  fetchFromJson(url)
  .then(processAnswer)
  .then(displayClassement);
}

function displayClassement(classement){
  console.log(classement);
  var tmp = "";
  tmp +="";
  classement.forEach(( element) => {
    tmp +='<caption>'
    tmp +='<td>'+element.nom_etape+'</td>';
    tmp +='<td>etape:'+element.etape+'</td></caption>';
    tmp += '<tr>';
    tmp += '<td>rang:'+element.rang+'</td>';
    tmp += '<td>chrono:'+element.chrono+'</td>';
    tmp += '<td>coureur:'+element.nom+'</td>';
    tmp += '<td>dossard:'+element.dossard+'</td> </tr> ';

  })
  document.getElementById('classement').innerHTML = tmp;
}

function initForm(){
  fetchFromJson('services/getEquipes.php')
  .then(processAnswer)
  .then(makeOptions);

  document.forms.form_coureurs.addEventListener("submit", sendForm);
}

function processAnswer(answer){
  if (answer.status == "ok"){
    return answer.result;
  }
  else{
    throw new Error(answer.message);
  }
}


function makeOptions(tab){
  for(let equipe of tab){
    let option = document.createElement('option');
    option.textContent = equipe.nom;
    document.forms.form_coureurs.equipe.appendChild(option);
    for (let k of ['nom','couleur','directeur']){
      option.dataset[k] = equipe[k];

    }
  }
}


function sendForm(ev){ // form event listener
  ev.preventDefault();
  let args = new FormData(this);
  let queryString = new URLSearchParams(args).toString();
  let url = 'services/getCoureurs.php?'+queryString;
  fetchFromJson(url)  //typo
    .then(processAnswer)
    .then(makeCoureursItems);

}


function makeCoureursItems(tab){

  /* chaque item <li> comportera les attributs data-id data-nom data-equipe data-taille
    contenant les valeurs respectives de id,nom, equipe, taille du coureurs
    */
  let liste = document.getElementById("coureurs");
  liste.textContent = "";
  for(coureur of tab){
    let item = document.createElement("li");
    item.textContent = coureur.nom;
    for (let k of ['id','nom','dossard','equipe','taille']){
      item.dataset[k] = coureur[k];
    }
    item.addEventListener('mouseenter',addDetailCoureur);
    item.addEventListener('mouseleave',removeDetailCoureur);
    liste.appendChild(item);

  }


}
function addDetailCoureur(ev){
  const item = ev.currentTarget;
  infos  = `<div class="info"><p>${item.dataset.nom}</p><p>équipe${item.dataset.equipe} taille : ${item.dataset.taille} </p></div>`;
  item.insertAdjacentHTML('beforeend',infos);
}

function removeDetailCoureur(ev){
  const item = ev.currentTarget;
  item.querySelector('div.info').remove();
}
