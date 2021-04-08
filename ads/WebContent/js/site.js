$(document).ready(function(){
	
	$('.bed-wrapper').click(function(){
		var patientName = ($.trim( $(this).find('.p-name').text()));
		var splitName = patientName.split(" ");
		var firstName = splitName[0];
		var lastName = splitName[1]; 
		var bedNum = ($.trim( $(this).find('.bed-number').text()));

		$.post('./Patient', {fName: firstName, lName: lastName, bed: bedNum},
			function(data){

				})
				.fail(function(){
					alert("POST failed to call data");
				});
	});

});


