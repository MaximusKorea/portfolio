$(document).ready(
		function() {
			var mv_no = $('#mv_no').val(); 
			var mvs_date = $('#mvs_date').val(); 
			var mvs_time = $('#mvs_time').val(); 
			var mvs_theater = $('#mvs_theater').val(); 
			var r_count = $('#r_count').val();
			var r_scount = $('#r_scount').val();
			var price = $('#price').val();
			$.ajax('reserv_seat_list/'+mv_no+'/'+mvs_date+'/'+mvs_time+'/'+mvs_theater, {
				success : function(reserv_seat) {
					for (var i = 65; i <= 'J'.charCodeAt(0); i++) {
						for (var j = 1; j < 10; j++) {
							var seat = String.fromCharCode(i) + j;
							var list = $('<li></li>').attr('class', 'seat');

							var input = $('<input>').attr('type', 'checkbox');
							input.attr('id', seat);
							input = input.attr('name', 'S');
							input = input.attr('value', seat);
							for (var k = 0; k <= reserv_seat.length; k++) {
									if (seat == reserv_seat[k]) {
										input.attr('disabled', 'disabled');
									}
							}
							list.append(input);

							var label = $('<label>' + seat + '</label>');
							label = label.attr('for', seat);
							list.append(label);

							$('.row--' + (i - 64) + ' .seats').append(list);
						}
					}
				}
			});
			$('.fuselage li .seats').on(
					'click',
					'.seat > label',
					function(obj) {
						var c = parseInt(r_count);
						var s = parseInt(r_scount);
						var limitCount = c + s;
						var checkboxes = $('input[type="checkbox"][name="S"][disabled!="disabled"]');
						checkboxes.change(function() {
							var current = checkboxes.filter(':checked').length;
							checkboxes.filter(':not(:checked)').prop(
									'disabled', current >= limitCount);
						});
			});
			
			$('.btn2').click(function () {
				if($('input[type="checkbox"][name="S"]').filter(':checked').length != 0){
				    page_move('reserv_select_seat_action', 'POST');
				}else{
					alert('좌석을 선택해주세요.');
				}
			});
		});

function contains(strTarget, strWord){
	if(strTarget == strWord){return true;}
	for(var i = 0; i<strTarget.length - strWord.length; i++){
		if(strTarget.substring(i, i+strWord.length) == strWord){
			return true;
		}
	}
	return false;
}

function page_move(url, method) {
    var form = $('#f');
    form.attr('action', url);
    form.attr('method', method);
    form.submit();
}


