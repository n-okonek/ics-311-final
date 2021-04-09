$(document).ready(function(){
	$('.bed-wrapper').click(function(){
		var patientName = $.trim( $(this).find('.p-name').text());
		var splitName = patientName.split(" ");
		var firstName = splitName[0];
		var lastName = splitName[1]; 
		var bedNum = $.trim( $(this).find('.bed-number').text());
		var floorNum = 2;

		$.post('./Patient', {fName: firstName, lName: lastName, bed: bedNum, floor: floorNum},
			function(data){
				console.log(data);
				var dummyData = $('#med-info-template').html();
				
				if ($('.med-info').hasClass('active')){
					$('.med-info').removeClass('active');
					$('.med-info').html("");
				}

				$('.med-info').append(dummyData);
				$('.med-info').addClass('active');
			})
			.fail(function(){
				alert("POST failed to call data");
			});
	});

	$('.close').click(function(){
		$('.med-info').removeClass('active');
		$('.med-info').html("");
	})
});


