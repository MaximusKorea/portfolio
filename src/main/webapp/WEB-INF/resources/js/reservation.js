$(function () {
    date_str = getParameterByName('date');
    multiplex_no = getParameterByName('multiplex');
    time_str = getParameterByName('time');
});
//시작
$(document).ready(function () {
    $('.cont').hide();
    $('#overlay').hide();

    //date_disable();
    //chk_disable();

//    $("a:contains('LOGIN')").click(function (e) {
//            var query = getQueryData();
//            query = $.param(query) ? '?' + $.param(query) : '';
//            query = encodeURIComponent(query);
//            location.href = 'member_login?returnurl=movie_orders' + query;
//            e.preventDefault();
//        }
//    );
//
//    if($("a:contains('LOGIN')").length) {
//        $('#payment span').text('로그인');
//    }

    $('#movie').on('click', 'li', function () {

        if($(this).hasClass('disabled')) {
            $('.select').text('영화');
            $('.disable1').text('날짜');
            $('.disable2').text('극장');
            $('.movie-alert').slideDown();
            //$(this).removeClass('disabled');
            remove_multiplex_selected();
            remove_date_selected();
            setTimeout(function () {
                $('.movie-alert').slideUp();
            }, 3000);
        }

        if ($(this).hasClass('selected')) {
            //remove_movie_selected(); 더블클릭
            //chk_disable($(this), 'movie');
            return;
        }

//        $('#overlay').show();

        if ($(this).hasClass('disabled'))
            remove_multiplex_selected();

        $(this).removeClass('disabled');

        
        if ($(this).hasClass('selected')) return;

        $('#movie ul li').removeClass('selected');
        $(this).addClass('selected');

        var movie = $('.selected #movie_no').text();
        $.ajax('movie_info/' + movie,
            {
                success: function (movie) {
                    $('#movie_selected').css('margin-top', '0');

                    $('#movie_selected .def').hide();
                    $('#movie_selected .cont').show();
                    $('#poster #poster').show();

                    $('#poster img').attr('src', movie.mv_image);
                    $('#m_detail #m_name').text(movie.mv_name);
                    $('#m_detail #m_time').text(movie.mv_runTime + '분');
                    $('#m_detail #m_age').text(movie.mv_age);

                    $('#movie_selected .cont a').attr('href', 'movie_view?mv_no=' + movie.mv_no);

                    $('#overlay').hide();
                }
            });
//        chk_disable($(this));
//        getMovieSchedule();
    });

    $('#date').on('click', '.day > span', function () {
        if($(this).hasClass('disabled')) {
            $('.select').text('날짜');
            $('.disable1').text('영화');
            $('.disable2').text('극장');
            $('.alert').slideDown();
            remove_movie_selected();
            $(this).removeClass('disabled');
            setTimeout(function () {
                $('.alert').slideUp();
            }, 3000);
        }

        if ($(this).hasClass('selected')) {
            remove_date_selected();
            //chk_disable($(this), 'time');
            return;
        }
        
        if(!getMovieNo()){
        	alert('영화를 선택해주세요.');
        	return;
        }
        
        $('#overlay').show();
        $('.ms_time').show();
        $('#time').children().remove();
        $('#time').show();
        var date = $(this).find('#selected_date').text();
        $('.day > span').removeClass('selected');
        $(this).addClass('selected');

        //clear_theater_selected();
        $('#day_selected .def').hide();
        $('#day_selected .cont').show();
        $('#ms_date .m_date').text(date);
        
        var mv_no = $('.selected #movie_no').text();
        var mvs_date = getDate();
        //if(mv_no != "" && mvs_date != ""){//mvs_date를 못받아와서 우선 hide하기 위해 if문 삽입
        	$.ajax('movie_time_info/' +mv_no+ '/'+mvs_date,
                {
                	success: function (schedule) {
                		$('#time').append('<ul>');
                    	if(schedule.length != 0){
                    		for(var i = 0; i < schedule.length; i++){                    		   
                    			var theater;
                    			if((schedule[i].mvs_theater != theater) && i!=0){
                    				$('#time').append('</ul><ul>');
                    		    }
                    			
                    			var li_time = $('<li></li>');
                    			var ms_time = li_time.attr('class', 'mss_time col-md-2');
                    			$('#time ul').append(ms_time);
                    		    var m_time = $('<span></span>').attr('class', 'ms_time');

                    		    m_time.text(schedule[i].mvs_theater + schedule[i].mvs_time);
                    		    ms_time.append(m_time);
                    		    theater = schedule[i].mvs_theater;
                    		    
                    		}
                    		$('#overlay').hide();
                    	}else{
                            var str = "상영 일정 없음"
                            var li_time = $('<li></li>');
                            var ms_time = li_time.attr('class', 'ms_time ');
                            $('#time ul').append(ms_time);

                            var m_time = $('<span></span>').attr('id', 'm_time');
                            m_time.text(str);
                            ms_time.append(m_time);
                            $('#overlay').hide();
                    	}
                    	$('#time').append('</ul>');
                    }
                });
    });

    $('#time').on('click', 'li', function () {
        if ($(this).find('.ms_time').hasClass('selected')) {
            remove_time_selected();
            return;
        }
        remove_time_selected();
        $('#overlay').show();
        
        var theater = $(this).find('.ms_time').text().substring(0,2);
        var timeS = $(this).find('.ms_time').text().substring(2);
        
        $('#ms_time .m_time').text(timeS);
        $('#ms_theater .m_contents').text(theater);
        $('#time').removeClass('selected');

        $(this).find('.ms_time').addClass('selected');

        $('#overlay').hide();     
        
    });
   
    $('#payment').click(function () {
//        if (!$('#memberId').text()) {
//            var query = getQueryData();
//            query = $.param(query) ? '?' + $.param(query) : '';
//            query = encodeURIComponent(query);
//
//            location.href = 'member_login?returnurl=movie_orders' + query;
//            return;
//        }

        var validation = order_validation();
        if (validation) {
            $('#count').modal();
        }
    });

    $('#order').click(function () {
        if (getTCount() == 0 && getStCount() == 0) {
            $('.count-alert').slideDown();
            setTimeout(function () {
                $('.count-alert').slideUp();
            }, 3000);
            return;
        }

        var key = {
            t_count: 'd_count',
            st_count: 'd_scount',
            price: 'd_price'
        };
        page_move('reserv_select_seat', getQueryData(), 'post', key, 'order');
    });

    $('select').change(function () {
        //alert(this.name);
        var price = this.name == 'st_count' ? 8000 : 9000;
        //alert(price);
        $(this).parent().next().text($(this).val() + ' * ' + price + ' =');
        $(this).parent().next().next().text(($(this).val() * price));

        var total_price = 0;
        $.each($('.price2'), function () {
            total_price += ($(this).text() * 1);
        });
        //alert(total_price);
        $('.total_price').text('총금액 : ' + total_price + '원');
    })
});


$(function () {
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    var date = new Date();
    var month = date.getMonth();

    var div = $('<div></div>').addClass('day');
    $('#date').append(getMonthHtml(date));

    for (var i = 0; i < 12; i++) {
        if (date.getMonth() != month) {
            $('#date').append(div);
            $('#date').append(getMonthHtml(date));

            div = $('<div></div>').addClass('day');
            month = date.getMonth();
        }

        var day = $('<span></span>');
        var selected_date = $('<span></span>').attr('id', 'selected_date').hide();

        if (date.getDay() == 0) {
            day.addClass('sunday');
        } else if (date.getDay() == 6) {
            day.addClass('saturday');
        }

        day.text(week[date.getDay()] + ' ' + date.getDate());
        selected_date.text(date.yyyymmdd());


        day.append(selected_date);

        div.append(day);
        date.setDate(date.getDate() + 1);

    }

    $('#date').append(div);

    var dateSpan = $('#date .day > span');
    $.each(dateSpan, function () {
        var s_date = $(this).find('#selected_date').text();
        if (s_date == date_str) {
            $(this).click();
        }
    });
    date_str = '';
});

function getQueryData() {
    var query = {};

    if (getMovieNo()) query.movie = getMovieNo();
    if (getDate()) query.date = getDate();
    if (getTime()) query.time = getTime();
    if (getTheater()) query.theater = getTheater();
    if (getTCount()) query.t_count = getTCount();
    if (getStCount()) query.st_count = getStCount();
    if (getTotalPrice()) query.price = getTotalPrice();

    return query;
}

function page_move(url, data, method, key, name) {
    var form = $('<form></form>').attr('name', name);
    form.attr('action', url);
    form.attr('method', method);

    $.each(data, function (k, v) {
        var input = $('<input>');
        var key1 = key.hasOwnProperty(k) ? key[k] : k;
        input.attr('name', key1);
        input.val(v);
        form.append(input);
    });
    $(document.body).append(form);
    form.submit();
}

function getMovieNo() {
    return $('#movie .selected #movie_no').text();
}

function getDate() {
    return $('#date .selected #selected_date').text()
}

function getTime() {
    return $('#ms_time .m_time').text();
}

function getTheater() {
	return $('#ms_theater .m_contents').text();
}

function getTCount() {
    return $("#t_count option:selected").text();
}

function getStCount() {
    return $("#st_count option:selected").text();
}

function getTotalPrice() {
    var total_price = 0;
    $.each($('.price2'), function () {
        total_price += ($(this).text() * 1);
    });
    return total_price;
}

function getMonthHtml(date) {

    var div = $('<div></div>').addClass('months');
    var year = $('<span></span>').addClass('year');
    var month = $('<span></span>').addClass('month');

    year.text(date.getFullYear());
    month.text((date.getMonth() + 1));

    div.append(year);
    div.append($('<br />'));
    div.append(month);

    return div;

}

function getData() {

    var data1 = {
        movie: true,
        multiplex: true,
        time: true
    };

    $.each(arguments, function (i, v) {
        if (data1.hasOwnProperty(v)) {
            data1[v] = false;
        }
    });

    var data = {};
    if ($('#movie .selected').length && data1.movie) {
        data.movie_no = $('#movie .selected #movie_no').text();
    }
    if ($('#multiplex .selected').length && data1.multiplex) {
        data.mp_no = $('#multiplex .selected .mp_no').text();
    }
    if ($('#date .selected').length && data1.time) {
        data.time = $('#date .selected #selected_date').text();
    }

    return data;
}

function order_validation() {
    if (!getMovieNo() ||!getDate() || !getTime()) {
        alert('시간을 선택해주세요.')
    	return false;
    } else {
        return true;
    }
}

//function movie_disable() {
//    $('#movie li').removeClass('disabled');
//
//    $.ajax('movie_schedule',
//        {
//            data: getData('movie'),
//            success: function (schedule) {
//                var movie_list = [];
//
//                $.each(schedule, function (i, v) {
//                    if ($.inArray(v.movie_no, movie_list) == -1)
//                        movie_list.push(v.movie_no);
//                });
//
//                $('#movie li').addClass(function () {
//                    var movie_no = $(this).find('#movie_no').text() * 1;
//                    if ($.inArray(movie_no, movie_list) == -1)
//                        return "disabled";
//                });
//
//                if ($('#movie li.selected.disabled').length)
//                    remove_movie_selected();
//            }
//        });
//}

//function date_disable() {
//    $('#date .day > span').removeClass('disabled');
//
//    $.ajax('movie_schedule',
//        {
//            data: getData('time'),
//            success: function (schedule) {
//                var dates = [];
//
//                $.each(schedule, function (i, v) {
//                    var date = new Date(v.ms_time).yyyymmdd();
//                    if ($.inArray(date, dates) == -1)
//                        dates.push(date);
//                });
//
//                $('#date .day > span').addClass(function () {
//                    var date = $(this).find('#selected_date').text();
//                    if ($.inArray(date, dates) == -1)
//                        return "disabled";
//                });
//
//                $('#date .day > span.selected.disabled').removeClass('selected');
//
//            }
//        });
//}

function remove_movie_selected() {
    $('#movie_selected .cont').hide();
    $('#movie_selected .def').show();
    $('#movie li').removeClass('selected');
    $('#movie_selected').css('margin-top', '10px');
    remove_time();
}

function remove_time() {
    $('#time ul').removeClass('selected');
	//$('#time ul').children().remove();
    $('#time ul').hide();
}
function remove_date_selected() {
    $('#date .day > span').removeClass('selected');
    remove_time();
}

function remove_time_selected() {
    $('#time *').removeClass('selected');
}

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

Date.prototype.yyyymmdd = function () {
    var yyyy = this.getFullYear().toString();
    var mm = (this.getMonth() + 1).toString();
    var dd = this.getDate().toString();

    return yyyy + '-' + (mm[1] ? mm : '0' + mm[0]) + '-' + (dd[1] ? dd : '0' + dd[0]);
};

Date.prototype.hhmm = function () {
    var hh = this.getHours().toString();
    var mm = this.getMinutes().toString();

    return (hh[1] ? hh : '0' + hh[0]) + ':' + (mm[1] ? mm : '0' + mm[0]);
};