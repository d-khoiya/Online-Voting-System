function clearErrors(){
    errors = document.getElementsByClassName('formerror');
    for(let item of errors)
    {
        item.innerHTML = "";
    }
}
function seterror(id, error){
    //sets error inside tag of id 
    element = document.getElementById(id);
    element.getElementsByClassName('formerror')[0].innerHTML = error;
}

function validateForm(){
    var returnval = true;
    clearErrors();
    
    
    var name = document.forms["myForm"]["name"].value;
    if (name.length<3){
        seterror("fName", "*Length of name is too short");
        returnval = false;
    }

    if (name.length == 0){
        seterror("fName", "*Please Enter Name!");
        returnval = false;
    }
   
    
    var electionDate = new Date(document.forms['myForm']["date"].value);
    var curDate = new Date();
    
    console.log("elecdate = "+electionDate)
    
    if(electionDate == "Invalid Date"){
		seterror("electdate", "*Please Enter Date OR Invalid Date");
		returnval = false;
	}
	if(electionDate == null){
		seterror("electdate", "*Please Enter Date OR Invalid Date");
		returnval = false;
	}
	
    
    if(electionDate<curDate){
		seterror("electdate", "*Past date not allowed");
		returnval = false;
	}

    return returnval;
}