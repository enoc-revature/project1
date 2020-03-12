window.onload = function(){
    this.getRequestDetails();
    $("#logoutBtn").on("click",function(){
        window.location.href = "login.html";
    });
}

//localstorage.setAttribute(req.requestId);

function getRequestDetails(){
    console.log("getRequestDetails()");
    let xhr = new XMLHttpRequest();
    let reqList;

    xhr.onreadystatechange = function() {
        if(xhr.readyState === 4 && xhr.status === 200) {
            console.log("xhr.readyState: "+ xhr.readyState);
            console.log("xhr.responseText: "+ xhr.responseText);
            console.log("xhr.responseType: "+ xhr.responseType);
            if(!!xhr.responseText)
                console.log("responseText is empty");
            reqList = JSON.parse(xhr.responseText);
            console.log(reqList);
            displayRequestDetails(reqList);
        }
    }
    xhr.open("GET", "/project1/PopulateEmployeeRequestDetails", true);
    xhr.send();

}

function displayRequestDetails(reqList){
    for(let req of reqList) {
        console.log("displayRequestList(reqList)");

        let rowElem = document.createElement("tr");
        let requestIdElem = document.createElement("td");
        let reimburseTypeElem = document.createElement("td");
        let eventDateElem = document.createElement("td");
        let pendingElem = document.createElement("td");

        requestIdElem.innerHTML = req.requestId;
        requestIdElem.hidden = true;
        reimburseTypeElem.innerHTML = req.reimburseType;
        eventDateElem.innerHTML = req.eventDate;
        pendingElem.innerHTML = req.pending;

        rowElem.setAttribute("class", "clickable-row");
        rowElem.setAttribute("onclick", "window.location.href = 'employeeRequestDetails.html';");
        rowElem.appendChild(requestIdElem);
        rowElem.appendChild(reimburseTypeElem);
        rowElem.appendChild(eventDateElem);
        rowElem.appendChild(pendingElem);
        rowElem.appendChild(pendingElem);

        document.getElementById("requestTableBody").appendChild(rowElem);
    }
}
