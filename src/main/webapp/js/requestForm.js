window.onload = function(){
    $("#submitRequest").on("click",sendRequest);
    $("#populateBtn").on("click", autoPopulate);
    $("#backBtn").on("click",function(){
        window.location.href = "employeeMenu.html";
    });
    $("#logoutBtn").on("click",function(){
        window.location.href = "login.html";
    });
    //this.document.getElementById("submitBu").addEventListener("click", addCar, false);
    //this.document.getElementById("addCar").addEventListener("click", addCar, false);

}

/*
jQuery(document).ready(function() {
    console.log("Logging Out");

    Parse.$ = jQuery;
    Parse.initialize("...", "...");

    $("#logoutBtn").on("click", function () {
        // Prevent Default Submit Event
        event.preventDefault();

        //logout current user
        if (Parse.User.current() ) {
            Parse.User.logOut();

            // check if really logged out
            if (Parse.User.current())
                console.log("Failed to log out!");
        }

        // do redirect
        //window.location.replace("Sign_In.html");
        // or
        window.location.href = "login.html";
    });
});
*/

class Employee{
    constructor(employeeId, employeeFirstName, employeeLastName, employeePassword){
        this.employeeId = employeeId;
        this.employeeFirstName = employeeFirstName;
        this.employeeLastName = employeeLastName;
        this.employeePassword = employeePassword;
    }
}

class Request{
    constructor(reimburseType, eventDate, pending, employeeId, eventTime,
                eventAddress, eventDescription, eventCost, gradeFormat, justification){
        this.reimburseType = reimburseType;
        this.eventDate = eventDate;
        this.pending = pending;
        this.employeeId = employeeId;
        this.eventTime = eventTime;
        this.eventAddress = eventAddress;
        this.eventDescription = eventDescription;
        this.eventCost = eventCost;
        this.gradeFormat = gradeFormat;
        this.justification = justification;
    }
}


function sendRequest(){
    event.preventDefault();
    console.log("sendRequest()");
   /* 
    let firstName = $("#firstName").val();
    let lastName = $("#lastName").val();
    let reimburseType = $("#reimburseType").val();
    let eventDate = $("#eventDate").val();
    let pending = $("#pending").val();
    let employeeId = $("#employeeId").val();
    let eventTime = $("#eventTime").val();
    let eventAddress = $("#eventAddress").val();
    let eventDescription = $("#eventDescription").val();
    let eventCost = $("#eventCost").val();
    let gradeFormat = $("#gradeFormat").val();
    let justification = $("#justification").val();

    let req = new Request(
            reimburseType,
            eventDate,
            pending,
            employeeId,
            eventTime,
            eventAddress,
            eventDescription,
            eventCost,
            gradeFormat,
            justification);
    */

    let req = new Request(
            $("#reimburseType").val(),
            $("#date").val(),
            $("#pending").val(),
            $("#employeeId").val(),
            $("#time").val(),
            $("#location").val(),
            $("#description").val(),
            $("#eventCost").val(),
            $("#gradeFormat").val(),
            $("#justification").val()
    );

    let xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            console.log("Success");
        }
    }
    xhr.open("POST", "/project1/SubmitFormData", true);
    xhr.send(JSON.stringify(req));
}

function autoPopulate(){
    console.log("autoPopulate()");
    event.preventDefault();

    // Get elements in the form
    document.getElementById("firstName").value = "John";
    document.getElementById("lastName").value = "Smith";
    document.getElementById("reimburseType").value = "College Course";
    document.getElementById("date").value = "9009-04-01";
    //document.getElementById("pending").value = true;
    document.getElementById("employeeId").value = "JS1324";
    document.getElementById("time").value = "12:00:00";
    document.getElementById("location").value = "456 Ave.";
    document.getElementById("description").value = "Business Course";
    document.getElementById("eventCost").value =  200.00;
    document.getElementById("gradeFormat").value = "PreciseGrading";
    document.getElementById("justification").value = "Want training for management";
    document.getElementById("firstName").value = "John";

    /*
    let firstNameElem = $("#firstName");
    let lastNameElem = $("#lastName");
    let reimburseTypeElem = $("#reimburseType");
    let eventDateElem = $("#eventDate");
    let pendingElem = $("#pending");
    let employeeIdElem = $("#employeeId");
    let eventTimeElem = $("#eventTime");
    let eventAddressElem = $("#eventAddress");
    let eventDescriptionElem = $("#eventDescription");
    let eventCostElem = $("#eventCost");
    let gradeFormatElem = $("#gradeFormat");
    let justificationElem = $("#justification");

    // Assign values to the fields
    firstNameElem.value = "John";
    lastNameElem.value = "Smith";
    reimburseTypeElem.value = "College Course";
    eventDateElem.value = "9009-04-01";
    pendingElem.value = true;
    employeeIdElem.value = "JS1324";
    eventTimeElem.value = "12:00:00";
    eventAddressElem.value = "456 Ave.";
    eventDescriptionElem.value = "Business Course";
    eventCostElem.value = 200.00;
    gradeFormatElem.value = "PreciseGrading";
    justificationElem.value = "Want training for management";
    */
}