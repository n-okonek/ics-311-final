$(document).ready(function(){
	
	$('.bed-wrapper').click(function(){
		var patientName = ($.trim( $(this).find('.p-name').text()));
		var splitName = patientName.split(" ");
		var firstName = splitName[0];
		var lastName = splitName[1]; 
		
		$.post('./Patient', {fName: firstName, lName: lastName},
			function(returnedData){
				console.log(returnedData);
				})
				.fail(function(){
					alert("POST failed to call data");
				});
	});

});