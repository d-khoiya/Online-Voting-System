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
    var username = document.forms['myForm']["fusername"].value;
    if (username.length<3){
        seterror("username", "*Length of name is too short");
        returnval = false;
    }
    
    if (username.length>100){
        seterror("username", "*Length of name is too big");
        returnval = false;
    }

    if (username.length == 0){
        seterror("username", "*Length of name cannot be zero!");
        returnval = false;
    }
    
    var name = document.forms["myForm"]["fname"].value;
    if (name.length<3){
        seterror("name", "*Length of name is too short");
        returnval = false;
    }

    if (name.length == 0){
        seterror("name", "*Length of name cannot be zero!");
        returnval = false;
    }

    var email = document.forms['myForm']["femail"].value;
    if (email.length>100){
        seterror("email", "*Email length is too long");
        returnval = false;
    }
    
    if(email.length == 0){
		seterror("email", "Enter Valid EmailID")
		returnval = false;
	}

    var phone = document.forms['myForm']["fphone"].value;
    if (phone.length != 10){
        seterror("phone", "*Phone number should be of 10 digits!");
        returnval = false;
    }
    

    var password = document.forms['myForm']["fpass"].value;
    if (password.length < 6){
        seterror("pass", "*Password should be atleast 6 characters long!");
        returnval = false;
    }
    if(password.search(/[A-Z]/)==-1){
		seterror("pass", "*Must contain uppercase character");
		returnval=false;
	} 
	if(password.search(/[!\@\#\$\%\^\&\*\(\)\=\-\+\<\>\?\.\,]/)==-1){
		seterror("pass", "*Must contain a special character");
		returnval=false;
	}
	if(password.search(/[0-9]/)==-1){
		seterror("pass", "*Must contain a number");
		returnval=false;
	}
	if(password.search(/[a-z]/)==-1){
		seterror("pass", "*Must contain lowercase character");
		returnval=false;
	}
/*	
	password.addEventListener("focus", function(){
		console.log("focus fired");
		document.getElementById("pswdcont").classList.remove("hide");
	});
	password.addEventListener("blur", function(){
		console.log("blur fired");
		document.getElementById("pswdcont").classList.add("hide");
	});*/
	
	
    var cpassword = document.forms['myForm']["fcpass"].value;
    if (cpassword != password){
        seterror("cpass", "*Password and Confirm password should match!");
        returnval = false;
    }

    return returnval;
}

function visibility(){
	var userInput=document.getElementById("fpass");
	var hideEyeOne = document.getElementById("hideeyeone");
	var hideEyeTwo = document.getElementById("hideeyetwo");
	
	if(userInput.type === 'password'){
		userInput.type = "text";
		hideEyeOne.style.display = "block";
		hideEyeTwo.style.display = "none"; 
	}else{
		userInput.type = "password";
		hideEyeOne.style.display = "none";
		hideEyeTwo.style.display = "block"; 
	}
}

function visibilitycp(){
	var userInput=document.getElementById("fcpass");
	var hideEyeOne = document.getElementById("hideeyeonecp");
	var hideEyeTwo = document.getElementById("hideeyetwocp");
	
	if(userInput.type === 'password'){
		userInput.type = "text";
		hideEyeOne.style.display = "block";
		hideEyeTwo.style.display = "none"; 
	}else{
		userInput.type = "password";
		hideEyeOne.style.display = "none";
		hideEyeTwo.style.display = "block"; 
	}
}
