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
				var dummy = $('#med-info-template').html();
				
				if ($('.med-info').hasClass('active')){
					$('.med-info').removeClass('active');
					$('.med-info').html("");
				}

				var template = $(dummy).clone();

				$(template).closest('.med-info-header').text("Patient: " + data.patient.name);
				
				$.each(data.order, function(){
					$(template).find('.order-num').text('Order Number: ' + data.order.orderId);
					$(template).find('.drug-name').text('Medication: ' + data.order.drug);
					$(template).find('.drug-strength').text('Strength: ' + data.order.dose);
					$(template).find('.doctor').text('Doctor: ' + data.order.doctor);
					$(template).find('.drawer').text('Drawer: ' + data.order.inventory.drawer);
					$(template).find('.qty').text('Qty: ' + data.order.inventory.qty);
					$(template).find('.audit-by').text('Last audited by: ' + data.order.inventory.lastAuditBy);
					$(template).find('.last-audited').text('Last audited:' + data.order.inventory.lastAuditDate);
				});
					
			$('.med-info').append(template);

			$('.med-info').addClass('active');

			$('.close').click(function(){
				$('.med-info').removeClass('active');
				$('.med-info').html("");
			});
		})
		.fail(function(){
			alert("POST failed to call data");
		});
	});
});


