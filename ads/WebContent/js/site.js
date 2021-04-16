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

				var medTemplate = $(dummy).clone();

				$(medTemplate).closest('.med-info-header').text("Patient: " + data.patient.name);

				$('.med-info').append(medTemplate);
				
				$.each(data.orders, function(i, orders){
					var orderTemplate = $('#order-info-template').html();
					var order = $(orderTemplate).clone();

					$(order).find('.order-num').html('<b>Order Number:</b> ' + orders.orderId);
					$(order).find('.drug-name').html('<b>Medication:</b> ' + orders.drug);
					$(order).find('.drug-strength').html('<b>Strength:</b> ' + orders.strength);
					$(order).find('.drug-dose').html('<b>Dose:</b> ' + orders.dose)
					$(order).find('.doctor').html('<b>Doctor:</b> ' + orders.doctor);
					$(order).find('.drawer').html('<b>Drawer:</b> ' + orders.inventory.drawer);
					$(order).find('.qty').html('<b>Qty:</b> ' + orders.inventory.qty);
					$(order).find('.audit-by').html('<b>Last audited by:</b> ' + orders.inventory.lastAuditBy);
					$(order).find('.last-audited').html('<b>Last audited:</b> ' + orders.inventory.lastAuditDate);

					$('.med-info').append(order);
				});

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

$('#sTerm').bind('keyup', function() {
	if(allFilled()) $('#searchButton').removeAttr('disabled');
});

function allFilled() {
	var filled = true;
	$('body input').each(function() {
			if($(this).val() == '') filled = false;
	});
	return filled;
}