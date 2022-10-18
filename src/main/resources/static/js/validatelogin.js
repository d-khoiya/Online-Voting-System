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

    

    var password = document.forms['myForm']["fpass"].value;
    if (password.length < 6){

        // Quiz: create a logic to allow only those passwords which contain atleast one letter, one number and one special character and one uppercase letter
        seterror("pass", "*Password should be atleast 6 characters long!");
        returnval = false;
    }

    var cpassword = document.forms['myForm']["fcpass"].value;
    if (cpassword != password){
        seterror("cpass", "*Password and Confirm password should match!");
        returnval = false;
    }

    return returnval;
}

function pwdvisible(){
	var userInput=document.getElementById("fpass");
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