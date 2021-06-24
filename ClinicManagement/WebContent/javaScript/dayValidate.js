function validateForm(){
	
	var day =/^[A-Za-z]+$/;

	if(!((document.timeForm.dayName.value).match(day))){
		alert("Day Name must contain only letters..");
		return false;
	}
	
	if((document.timeForm.s_time.value) > (document.timeForm.e_time.value)){
		alert("Enter the visiting time properly..\nUse 24hour format..");
		return false;
	}
	return true;
}