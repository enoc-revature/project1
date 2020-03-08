window.onload = function(){
    $("#submitLogin").on("click",login);
}

class Employee{
    constructor(employeeId, employeeName){
        this.employeeId = employeeId;
        this.employeeName = employeeName;
    }
}

function login(){
    console.log("login()");
    event.preventDefault();
    event.stopPropagation();
    let emp = new Employee($("#username").value, $("#password").value);
    //console.log($("#username").val());
    //console.log($("#password").val());
    let xhr = new XMLHttpRequest();

     xhr.onreadystatechange = function() {
        if(xhr.readyState === 4 && xhr.status === 200){
            //console.log(xhr.responseText);
            console.log("Success");
        }
    }
    xhr.open("POST", "/TRMS/login", true);
    console.log("debug");
    xhr.send(JSON.stringify(emp)); 
/*
*/
}

/*
function temp() {
    let id = document.getElementById("pokeId").value;
    
    let xhr = new XMLHttpRequest();

    xhr.onreadystatechange = function() {
        if(xhr.readyState === 4 && xhr.status === 200) {
            console.log(xhr.responseText);
            let pokeman = JSON.parse(xhr.responseText);
            document.getElementById("pokeName").innerHTML = pokeman.name;
        }
    }

    xhr.open("GET", "https://pokeapi.co/api/v2/pokemon/"+id, true);
    xhr.send();
}
function addCar() {
    event.preventDefault();
    
    let make = document.getElementById("make").value;
    let model = document.getElementById("model").value;
    let year = document.getElementById("year").value;
    let vin = document.getElementById("vin").value;
    let car = new Car(make, model, year, vin);

    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log("Success");
        }
    }
    xhr.open("POST", "/CarDealership/car", true);
    xhr.send(JSON.stringify(car));
}

window.onload = function() {
    this.document.getElementById("addCar").addEventListener("click", addCar, false);
}
*/