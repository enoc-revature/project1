window.onload = function(){
    $("#bencoLoginForm").on("click",login);
    $(".clickable-row").on("click",showRequest);
   //this.document.getElementById("submitLogin").addEventListener("click",login);
}

class UserLogin{
    constructor(username, password){
        this.username = username;
        this.password = employeePassword;
    }

}
class Employee{
    constructor(employeeId, employeeName, employeePassword){
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeePassword = employeePassword;
    }
}

class Request{
    constructor(requestId, eventName){
        this.requestId = requestId;
        this.eventName = eventName;
    }
}

function showRequest(){
    //let requestId = $(this).eq(0).value;
    window.location = $(this).data("href");
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
    xhr.open("POST", "/project1/html/login", true);
    console.log("debug");
    xhr.send(JSON.stringify(emp)); 
    console.log(JSON.stringify(emp));
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