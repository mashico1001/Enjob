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
//= require jquery_ujs

//= require rails-ujs
//= require moment
//= require fullcalendar
//= require activestorage
//= require turbolinks
//= require_tree .

$(function () {
    // 画面遷移を検知
    $(document).on('turbolinks:load', function () {
        if (!$('#calendar').hasClass('fc')) {


            //events: '/events.json', 以下に追加
            $('#calendar').fullCalendar({
                events: '/events.json',
                //カレンダー上部を年月で表示させる
                titleFormat: 'YYYY年 M月',
                //曜日を日本語表示

                //終了時刻がないイベントの表示間隔
                defaultTimedEventDuration: '03:00:00',

                // Drag & Drop & Resize
                editable: true,
                //イベントの時間表示を２４時間に
                timeFormat: "HH:mm",
                //イベントの色を変える
                eventColor: '#87cefa',
                //イベントの文字色を変える
                eventTextColor: '#000000',
                eventRender: function(event, element) {
                    element.css("font-size", "0.8em");
                    element.css("padding", "5px");
                },

                lang: 'ja',

                dayClick: function (date, _, __) {
                  $('#event_date').val(date.format());
                  window.location.hash = 'modal-01';
                },

                // eventClick: function () {
                //   window.location.hash = 'modal-02';
                // },
            });
        }
    });
});

$(function () {
  $(function () {
    $('#nav-toggle,#overlay').on('click', function () {
      $('body').toggleClass('open');
    });
  });
});