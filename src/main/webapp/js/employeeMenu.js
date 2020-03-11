window.onload = function(){
    this.getEmployeeRequests();
}

    var reqList;
function getEmployeeRequests(){
    console.log("getEmployeeRequest()");
    let xhr = new XMLHttpRequest();
    //let reqList;

    xhr.onreadystatechange = function() {
        if(xhr.readyState === 4 && xhr.status === 200) {
            console.log("xhr.readyState: "+ xhr.readyState);
            console.log("xhr.responseText: "+ xhr.responseText);
            console.log("xhr.responseType: "+ xhr.responseType);
            if(!!xhr.responseText)
                console.log("responseText is empty");
            reqList = JSON.parse(xhr.responseText);
            console.log(reqList);
            displayRequestList(reqList);
        }
    }
    xhr.open("GET", "/project1/PopulateEmployeeMenu", true);
    xhr.send();
}

class Employee{
    constructor(employeeId, employeeFirstName, employeeLastName, employeePassword){
        this.employeeId = employeeId;
        this.employeeFirstName = employeeFirstName;
        this.employeeLastName = employeeLastName;
        this.employeePassword = employeePassword;
    }
}

class Request{
    constructor(requestId, reimburseType,eventDate,pending){
        this.requestId = requestId;
        this.reimburseType = reimburseType;
        this.eventDate = eventDate;
        this.pending = pending;
    }
}

function displayRequestList(reqList){
    for(let req of reqList) {
        console.log("displayRequestList(reqList)");
        let rowElem = document.createElement("tr");
        //rowElem.id = "requestTable";
        let requestIdElem = document.createElement("td");
        let reimburseTypeElem = document.createElement("td");
        let eventDateElem = document.createElement("td");
        let pendingElem = document.createElement("td");
        let addElem = document.createElement("td");
        requestIdElem.innerHTML = req.requestId;
        requestIdElem.hidden = true;
        reimburseTypeElem.innerHTML = req.reimburseType;
        reimburseTypeElem.setAttribute("class", "clickable-row")
        eventDateElem.innerHTML = req.eventDate;
        eventDateElem.setAttribute("class", "clickable-row")
        pendingElem.innerHTML = req.pending;
        pendingElem.setAttribute("class", "clickable-row")
        addElem.innerHTML = "+"
        addElem.setAttribute("class", "clickable-row")
        rowElem.appendChild(requestIdElem);
        rowElem.appendChild(reimburseTypeElem);
        rowElem.appendChild(eventDateElem);
        rowElem.appendChild(pendingElem);
        document.getElementById("requestTableBody").appendChild(rowElem);
    }
}