function validateForm(){
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