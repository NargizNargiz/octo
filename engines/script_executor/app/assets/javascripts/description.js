function addAddressField() {

    //create Date object
    var date = new Date();

    //get number of milliseconds since midnight Jan 1, 1970
    //and use it for address key
    var mSec = date.getTime();

    //Replace 0 with milliseconds

    //create <li> tag
    var li = document.createElement("li");


    //create input for Kind, set it's type, id and name attribute,
    //and append it to <li> element
    var inputKind = document.createElement("INPUT");
    inputKind.setAttribute("type", "text");
    inputKind.setAttribute("id", idAttributKind);
    inputKind.setAttribute("name", nameAttributKind);
    li.appendChild(inputKind);


    //add created <li> element with its child elements
    //(label and input) to myList (<ul>) element
    document.getElementById("myList").appendChild(li);

    //show address header
    $("#addressHeader").show();
}