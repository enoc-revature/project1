window.onload = function(){
    $("#submitButton").on("click",sendRequest);
}


function sendRequest(){
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
    xhr.open("POST", "/project1/CreateRequest", true);
    xhr.send();

}