/**
 * 
 */
 
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
	
	var returnval=true;
	clearErrors();
	 var name = document.forms["myForm"]["fname"].value;
    if (name.length<3){
        seterror("name", "*Length of name is too short");
        returnval = false;
    }

    if (name.length == 0){
        seterror("name", "*Length of name cannot be zero!");
        returnval = false;
    }
    
    var party= document.forms["myForm"]["fparty"].value;
    if(party.length == 0)
    {
		seterror("party", "*Length of party is too short");
        returnval = false;
	}
    var dob = new Date(document.forms['myForm']["fdate"].value);
    var curDate = new Date();
    
    if(dob == "Invalid Date"){
		seterror("dob", "*Please Enter Date OR Invalid Date");
		returnval = false;
	}
    
    if(dob>curDate){
		seterror("dob", "*Future date not allowed");
		returnval = false;
	}
	
	if(curDate.getFullYear()-dob.getFullYear() == 0)
	{
		if(curDate.getMonth() < dob.getMonth()){
			seterror("dob", "* Future Month Not Allowed ");
			returnval = false;
		}
		
		if(curDate.getMonth() > dob.getMonth() || curDate.getDate() > dob.getDate() ){
			seterror("dob", "* Voter Should be 18+ ! ");
			returnval = false;
		}
		
		if(curDate.getMonth() == dob.getMonth()){
			if(curDate.getDate() <= dob.getDate()){
				seterror("dob", "* Future Date Not Allowed");
				returnval = false;
			}
		}
	}	
	
	if((curDate.getFullYear()-dob.getFullYear() < 18) && (curDate.getFullYear()-dob.getFullYear() > 0)){
		seterror("dob", "*Voter should be 18+");
		returnval = false;
	}
    
    return returnval;
}