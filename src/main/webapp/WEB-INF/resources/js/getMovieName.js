$(document).ready(function() {
	var mv_no = $('#mv_no').val();
	var price = $('#price').val();
	var way;
	$.ajax('movie_info/' + mv_no, {
		success : function(movie_info) {
			$('#mv_name').text(movie_info.mv_name);
		}
	});
	$('#orderP').click(function () {
		$.ajax('get_totalPoint', {
			success : function(point) {
				if (point < price){
					alert('포인트가 부족합니다. 일반 결제로 진행해주세요.');
					$('#orderP').attr('disabled', 'disabled');
				}else{
					way = 'p';
					$.ajax('update_point/'+price+'/'+way,{
						success : function(result){							
							alert('남은 포인트는 '+result+'포인트입니다.');
						}
					});
					page_move('reserv_create', 'post');
				}
			}
		});
	});
	
	$('#order').click(function(){
		var con = window.confirm("결제 하시겠습니까?");
		if (con == true) {
			way = 'o';
			$.ajax('update_point/'+price+'/'+way,{
				success : function(result){
					alert(result+'포인트 적립되었습니다.');
				}
			});
			page_move('reserv_create', 'post');
		} else {
            alert('취소하였습니다');
        }
	});
});

function page_move(url, method) {
    var form = $('#f');
    form.attr('action', url);
    form.attr('method', method);
    form.submit();
}