// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require activestorage
//= require turbolinks
//= require_tree .


$(function () {
    // 画面遷移を検知
    $(document).on('turbolinks:load', function () {
        if ($('#calendar').length) {

            function Calendar() {
                return $('#calendar').fullCalendar({
                });
            }
            function clearCalendar() {
                $('#calendar').html('');
            }

            $(document).on('turbolinks:load', function () {
                Calendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);

            //events: '/events.json', 以下に追加
            $('#calendar').fullCalendar({
                events: '/events.json',
                //カレンダー上部を年月で表示させる
                timeFormat: 'H:mm',
                eventColor: '#63ceef',
                lang: 'ja',
                dayClick: function (start, end, jsEvent, view) {
                  //クリックした日付情報を取得
                  const year = moment(start).year();
                  const month = moment(start).month()+1; //1月が0のため+1する
                  const day = moment(start).date();
                  //イベント登録のためnewアクションを発火
                  $.ajax({
                    type: 'GET',
                    url: '/events/new',
                  }).done(function (res) {
                    //イベント登録用のhtmlを作成
                    $('.modal-body').html(res);
                    //イベント登録フォームの日付をクリックした日付とする
                    $('#event_start_time_1i').val(year);
                    $('#event_start_time_2i').val(month);
                    $('#event_start_time_3i').val(day);
                    //イベント登録フォームのモーダル表示
                    $('#modal').modal();
                  }).fail(function (result) {
                    alert('エラーが発生しました。');
                  });
                },
              
              
            }); 
        };
  });

});