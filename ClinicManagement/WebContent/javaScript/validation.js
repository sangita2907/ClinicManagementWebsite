function validateForm(){
	var letter =/^[a-zA-Z\s]*$/;
	
	if(!((document.myForm.name.value).match(letter))){
		alert("Name must contain only letters..");
		return false;
	}
	
	if((document.myForm.pnumber.value).length > 10 || (document.myForm.pnumber.value).length < 10){
		alert("Phone Number must have 10 digit..\nCheck the number and re-enter it..");
		return false;
	}
	
	  var appointmentDate = new Date(document.getElementById('adate').value);
      var today = new Date();
      var yesterday = new Date(today.getTime() - (24*60*60*1000));
      var endDate = new Date(yesterday.getTime() + (7*24*60*60*1000) );

      if(appointmentDate < yesterday || appointmentDate > endDate  ){
          alert("please enter a proper date from today to within 7 days..");
          return false;
      }
      return true;
	
}