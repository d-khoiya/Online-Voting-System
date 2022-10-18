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

    //perform validation and if validation fails, set the value of returnval to false
    var adharno = document.forms['myForm']["adharno"].value;
    
    var regexp = /^[2-9]{1}[0-9]{3}\s[0-9]{4}\s[0-9]{4}$/;
    //4 numbers 3 3 ke batch mai
    //1. 2-9
    //2. next 3 digit any no. betweeen 0 to 9
    //3. \s-> white space
    //4. 0-9
    
    
    if(regexp.test(adharno) == false){
		seterror("adno", "*Invalid Adhar Number");
		returnval = false;
	}
    

    if (adharno.length == 0){
        seterror("adno", "*Please Enter your Adhar Number!");
        returnval = false;
    }
    
    var name = document.forms["myForm"]["name"].value;
    if (name.length<3){
        seterror("fName", "*Length of name is too short");
        returnval = false;
    }

    if (name.length == 0){
        seterror("fName", "*Length of name cannot be zero!");
        returnval = false;
    }
    
    var gender = document.forms["myForm"] ["gender"].value;
    if(gender.length==0){
		seterror("gen", "* Please select Gender");
		returnval = false;
	}
	
	//var dob = document.forms["myForm"] ["date"].value;

    var email = document.forms['myForm']["email"].value;
    if (email.length>50){
        seterror("mail", "*Email length is too long");
        returnval = false;
    }
    if(email.length==0)
    {
		seterror("mail", "*Please Enter your email");
		returnval = false;	
	}

    var phone = document.forms['myForm']["phoneno"].value;
    if (phone.length != 10){
        seterror("mobno", "*Phone number should be of 10 digits!");
        returnval = false;
    }
    
    var dob = new Date(document.forms['myForm'] ["birthdate"].value);
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
	
	/*var res = curDate.getFullYear()-dob.getFullYear();
	console.log("res= "+curDate.getFullYear());
	console.log("res 2 = "+dob.getFullYear());
	console.log("resu = "+res);
	
	console.log("initdate = "+dob);
	
	var dt = curDate.getMonth()-dob.getMonth();
	console.log("mont = "+dt);
	console.log("cur mont = "+curDate.getMonth());
	console.log("dob mont = "+dob.getMonth());*/
	
	
	if(curDate.getFullYear()-dob.getFullYear() == 18)
	{
		if(curDate.getMonth() < dob.getMonth()){
			seterror("dob", "* Few Months Remaining to become 18+");
			returnval = false;
		}
		
		if(curDate.getMonth() == dob.getMonth()){
			if(curDate.getDate() < dob.getDate()){
				seterror("dob", "* Few Days Remaining to become 18+");
				returnval = false;
			}
		}
	}
	
    

    return returnval;
    }