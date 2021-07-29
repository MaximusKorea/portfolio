$(function () {
    date_str = getParameterByName('date');
    multiplex_no = getParameterByName('multiplex');
    time_str = getParameterByName('time');
});

$(document).ready(function () {
    $('#city #icon').hide();
    $('.cont').hide();
    $('#overlay').hide();

    //date_disable();
    chk_disable();

    $("a:contains('LOGIN')").click(function (e) {
            var query = getQueryData();
            query = $.param(query) ? '?' + $.param(query) : '';
            query = encodeURIComponent(query);
            location.href = 'member_login?returnurl=movie_orders' + query;
            e.preventDefault();
        }
    );

    if($("a:contains('LOGIN')").length) {
        $('#payment span').text('로그인');
    }

    $('#city').on('click', 'li', function () {

        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            $('#city #icon').hide();
            $('#multiplex ul').empty();
            remove_time();
            clear_theater_selected();
            return;
        }

        $('#overlay').show();

        $('#multiplex ul').empty();

        $('#city ul li').removeClass('selected');
        $('#city #icon').hide();
        $(this).addClass('selected');
        $('.selected #icon').show();

        var c_no = $('.selected #c_no').text();

        $('.selected #icon').removeClass('fa-arrow-right');
        $('.selected #icon').addClass('fa-refresh fa-spin');
        $('#multiplex ul').hide();

        $.ajax('multiplex/' + c_no,
            {
                success: function (multiplex) {

                    for (var i = 0; i < multiplex.length; i++) {
                        var li = $('<li></li>');
                        var mp_name = $('<span></span>');
                        var mp_no = $('<span></span>');

                        mp_name.addClass('mp_name');
                        mp_name.text(multiplex[i].mp_name);

                        mp_no.attr('hidden');
                        mp_no.addClass('mp_no');
                        mp_no.text(multiplex[i].mp_no);
                        mp_no.hide();
                        li.append(mp_name).append(mp_no);

                        $('#multiplex ul').append(li);
                    }

                    chk_disable();

                    $('#multiplex ul').show();
                    //$('.selected #icon').removeClass('fa-refresh fa-spin');
                    //$('.selected #icon').addClass('fa-arrow-right');

                    var multiplex_li = $('#multiplex li');
                    $.each(multiplex_li, function () {
                        var mp_no = $(this).find('.mp_no').text();
                        if (mp_no == multiplex_no) {
                            $(this).click();
                        }
                    });
                    multiplex_no = '';

                    $('#overlay').hide();
                }
            });

        remove_time();

    });

    $('#multiplex').on('click', 'li', function () {

        if($(this).hasClass('disabled')) {
            $('.select').text('극장');
            $('.disable1').text('영화');
            $('.disable2').text('날짜');
            $('.alert').slideDown();
            remove_movie_selected();
            remove_date_selected();
            $(this).removeClass('disabled');
            setTimeout(function () {
                $('.alert').slideUp();
            }, 3000);
        }

        if ($(this).hasClass('selected')) {
            //$(this).removeClass('selected');
            remove_multiplex_selected();
            chk_disable($(this), 'multiplex');
            return;
        }

        $('#overlay').show();

        $('#multiplex ul li').removeClass('selected');
        $(this).addClass('selected');

        clear_theater_selected();
        chk_disable($(this));
        getMovieSchedule();

        $('#overlay').hide();
    });

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
            remove_movie_selected();
            chk_disable($(this), 'movie');
            return;
        }

//        $('#overlay').show();

        if ($(this).hasClass('disabled'))
            remove_multiplex_selected();

        $(this).removeClass('disabled');

        if ($(this).hasClass('selected')) return;

        $('#movie ul li').removeClass('selected');
        $(this).addClass('selected');
//
//        var movie = $('.selected #movie_no').text();
//        $.ajax('movie_basic_info/' + movie,
//           
//                success: function (movie) {
//                    $('#movie_selected').css('margin-top', '0');
//
//                    $('#movie_selected .def').hide();
//                    $('#movie_selected .cont').show();
//
//                    $('#poster img').attr('src', movie.movie_image);
//                    $('#m_detail #m_title').text(movie.movie_title);
//                    $('#m_detail #m_time').text(movie.movie_time + '분');
//                    $('#m_detail #m_age').text(movie.movie_age);
//
//                    $('#movie_selected .cont a').attr('href', 'movie_view?movie_no=' + movie.movie_no);
//
//                    $('#overlay').hide();
//                }
//            });
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
            remove_multiplex_selected();
            $(this).removeClass('disabled');
            setTimeout(function () {
                $('.alert').slideUp();
            }, 3000);
        }

        if ($(this).hasClass('selected')) {
            remove_date_selected();
            chk_disable($(this), 'time');
            return;
        }
        $('#overlay').show();

        var date = $(this).find('#selected_date').text();
        $('.day > span').removeClass('selected');
        $(this).addClass('selected');

        clear_theater_selected();
        //$('#theater_selected .def').hide();
        //$('#theater_selected .cont').show();

        $('#ms_date .m_date').text(date);

        chk_disable($(this));
        getMovieSchedule();

        $('#overlay').hide();
    });

    $('#time').on('click', '.schedule', function () {
        if ($(this).find('.ms_time').hasClass('selected')) {
            remove_time_selected();
            return;
        }

        $('#time .ms_time').removeClass('selected');

        $('#overlay').show();

        $(this).find('.ms_time').addClass('selected');

        var time = $(this).find('.ms_time').text();
        var theater = $(this).parent().find('.th_name').text();

        $('#ms_date .m_time').text(time);
        $('#ms_theater .m_contents').text(theater);

        clear_theater_selected();

        $('#overlay').hide();
    });

    $('#payment').click(function () {
        if (!$('#memberId').text()) {
            var query = getQueryData();
            query = $.param(query) ? '?' + $.param(query) : '';
            query = encodeURIComponent(query);

            location.href = 'member_login?returnurl=movie_orders' + query;
            return;
        }

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
        page_move('movie_orders/payment', getQueryData(), 'post', key, 'order');
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
    $('#city li').hover(
        function () {

            $(this).addClass('hover');
        },
        function () {
            $(this).removeClass('hover');
        }
    );

    $('#movie li').hover(
        function () {
            if($(this).hasClass('disabled')) return;
            $(this).addClass('hover');
        },
        function () {
            $(this).removeClass('hover');
        }
    );

    $('#multiplex').on('mouseenter', 'li', function () {
            if($(this).hasClass('disabled')) return;
            $(this).addClass('hover');
        }
    );
    $('#multiplex').on('mouseleave', 'li', function () {
            $(this).removeClass('hover');
        }
    );

    $('#date').on('mouseenter', '.day > span', function () {
            if($(this).hasClass('disabled')) return;
            $(this).addClass('hover');
        }
    );

    $('#date').on('mouseleave', '.day > span', function () {
            $(this).removeClass('hover');
        }
    );

    $('#time').on('mouseenter', '.ms_time', function () {
            if($(this).hasClass('disabled')) return;
            $(this).addClass('hover');
        }
    );

    $('#time').on('mouseleave', '.ms_time', function () {
            $(this).removeClass('hover');
        }
    );
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

$(function () {
    var movie_no = getParameterByName('movie');
    var movie = $('#movie li');
    $.each(movie, function () {
        if ($(this).find('#mv_no').text() == movie_no)
            this.click();
    });

    var city_no = getParameterByName('city');
    var city = $('#city li');
    $.each(city, function () {
        if ($(this).find('#c_no').text() == city_no)
            this.click();
    });

});

function getQueryData() {
    var query = {};

    if (getMovieNo()) query.movie = getMovieNo();
    if (getCityNo()) query.city = getCityNo();
    if (getMultiplexNo()) query.multiplex = getMultiplexNo();
    if (getDate()) query.date = getDate();
    if (getTime()) query.time = getTime();
    if (getMsNo()) query.ms_no = getMsNo();
    if (getTCount() != 0) query.t_count = getTCount();
    if (getStCount() != 0) query.st_count = getStCount();
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

    form.submit();
}

function getMovieNo() {
    return $('#movie .selected #mv_no').text();
}

function getCityNo() {
    return $('#city .selected #c_no').text();
}

function getMultiplexNo() {
    return $('#multiplex .selected .mp_no').text();
}

function getMultiplexName() {
    return $('#multiplex .selected .mp_name').text();
}

function getDate() {
    return $('#date .selected #selected_date').text()
}

function getTime() {
    return $('#time .selected').text();
}

function getMsNo() {
    return $('#time .selected').parent().find('.ms_no').text();
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

function getTheater() {
    return $('#time .selected').parent().parent().parent().find('.th_name').text();
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
    if (!getMovieNo() || !getMultiplexNo() || !getDate() || !getTime() || !getTheater()) {
        return false;
    } else {
        return true;
    }
}


function getMovieSchedule() {
    if (!$('#movie .selected').length || !$('#multiplex .selected').length || !$('#date .selected').length) {
        return;
    }

    var data = getData();

    var func = function (data) {
        $('#time').empty();

        var theaters = {};
        $.each(data, function (i, v) {
            if (!theaters.hasOwnProperty(v.th_name)) {
                theaters[v.th_name] = new Array();
            }
            theaters[v.th_name].push(v);
        });

        $.each(theaters, function (i, v) {
            var theater = $('<div></div>').addClass('th_schedule');
            var row = $('<div></div>').addClass('row');

            var th_name = $('<span></span>').addClass('th_name col-md-2').text(v[0].th_name);
            var seat_count = $('<span></span>').addClass('seat_count col-md-6').text('총 ');
            seat_count.append($('<span></span>').addClass('count').text(v[0].th_seatcount)).append('석');
            theater.append(th_name);
            theater.append(seat_count);

            $.each(v, function (i, v) {

                var div = $('<div></div>').addClass('schedule col-md-4');
                var time = $('<span></span>').addClass('ms_time col-md-6')
                    .text(new Date(v.ms_time).hhmm());
                var seat = $('<span></span>').addClass('seat col-md-6');
                var ms_no = $('<span></span>').addClass('ms_no col-md-6')
                    .text(v.ms_no).hide();
                div.append(time).append(seat).append(ms_no);
                row.append(div);

                $.ajax('remainTicket/' + v.ms_no,
                    {
                        success: function (data) {
                            //alert(data);
                            seat.append(
                                $('<span></span>').addClass('count').text(data))
                                .append('석');
                        }
                    });
            });
            theater.append(row);
            $('#time').append(theater);

            var time_div = $('#time .schedule');
            $.each(time_div, function () {
                var time = $(this).find('.ms_time').text();
                if (time == time_str) {
                    $(this).click();
                }
            });
            time_str = '';
        });


    };

    $.ajax('movie_schedule',
        {
            data: data,
            success: func
        });

}

function movie_disable() {
    $('#movie li').removeClass('disabled');

    $.ajax('movie_schedule',
        {
            data: getData('movie'),
            success: function (schedule) {
                var movie_list = [];

                $.each(schedule, function (i, v) {
                    if ($.inArray(v.movie_no, movie_list) == -1)
                        movie_list.push(v.movie_no);
                });

                $('#movie li').addClass(function () {
                    var movie_no = $(this).find('#movie_no').text() * 1;
                    if ($.inArray(movie_no, movie_list) == -1)
                        return "disabled";
                });

                if ($('#movie li.selected.disabled').length)
                    remove_movie_selected();
            }
        });
}

function date_disable() {
    $('#date .day > span').removeClass('disabled');

    $.ajax('movie_schedule',
        {
            data: getData('time'),
            success: function (schedule) {
                var dates = [];

                $.each(schedule, function (i, v) {
                    var date = new Date(v.ms_time).yyyymmdd();
                    if ($.inArray(date, dates) == -1)
                        dates.push(date);
                });

                $('#date .day > span').addClass(function () {
                    var date = $(this).find('#selected_date').text();
                    if ($.inArray(date, dates) == -1)
                        return "disabled";
                });

                $('#date .day > span.selected.disabled').removeClass('selected');

            }
        });
}

function multiplex_disable() {
    $('#multiplex li').removeClass('disabled');

    $.ajax('movie_schedule',
        {
            data: getData('multiplex'),
            success: function (schedule) {
                var mp_names = [];

                $.each(schedule, function (i, v) {
                    if ($.inArray(v.mp_name, mp_names) == -1)
                        mp_names.push(v.mp_name);
                });


                $('#multiplex li').addClass(function () {
                    var mp_name = $(this).find('.mp_name').text();
                    if ($.inArray(mp_name, mp_names) == -1)
                        return "disabled";
                });

                if ($('#multiplex li.selected.disabled').length)
                    remove_multiplex_selected();

            }
        });


}

function chk_disable(select) {

    $.ajax('movie_schedule',
        {
            data: getData(),
            success: function (schedule) {

                if(select != undefined && schedule.length == 0) {
                    select.click();
                    chk_disable();
                    return;
                }

                movie_disable();
                multiplex_disable();
                date_disable();

            }
        });

}

function remove_time() {
    $('#time .ms_time').removeClass('selected');
    $('#time').empty();
}

function remove_time_selected() {
    $('#time .ms_time').removeClass('selected');
    clear_theater_selected();
}

function remove_date_selected() {
    $('#date .day > span').removeClass('selected');
    remove_time();
    clear_theater_selected();
}

function remove_multiplex_selected() {

    $('#multiplex li').removeClass('selected');
    clear_theater_selected();
    remove_time();
}

function remove_movie_selected() {
    $('#movie_selected .cont').hide();
    $('#movie_selected .def').show();
    $('#movie li').removeClass('selected');
    $('#movie_selected').css('margin-top', '10px');
    remove_time();

}

function clear_theater_selected() {
    var mp_name = getMultiplexName();
    var date = getDate();
    var time = getTime();
    var theater = getTheater();

    $('#ms_multiplex .m_contents').text(mp_name);
    $('#ms_theater .m_contents').text(theater);
    $('#theater_selected .m_date').text(date);
    $('#theater_selected .m_time').text(time);

    if (!mp_name && !date && !time && !theater) {
        $('#theater_selected .cont').hide();
        $('#theater_selected .def').show();
    } else {
        $('#theater_selected .def').hide();
        $('#theater_selected .cont').show();
    }


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