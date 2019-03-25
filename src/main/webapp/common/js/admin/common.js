$(function () {
    // 셀렉트박스 플러그인
    $('select').selectric();

    // LNB 메뉴
    $('#container .lnb dt a').on('click', function (e) {
        e.preventDefault();
        $(this).closest('dt').toggleClass('select');
    });
    $('#container .lnb .lnb-control .btn-lnb-hide').on('click', function (e) {
        e.preventDefault();
        $('body').toggleClass('on');
    });

    // lnb 즐겨찾기
    $('#container .lnb dd li .btn-bookmark').on('click', function () {
        $(this).toggleClass('on');
    });
    $('#bookmark-view').on('click', function (e) {
        e.preventDefault();
        $(this).toggleClass('on');
        $(this).closest('.top').toggleClass('on');
    });
    $('#header .top .btn-bookmark').on('click', function (e) {
        e.preventDefault();
        $(this).toggleClass('on');
    });

    // lnb height
    $(window).resize(function () {
        var container_height = $('#container').height();
        $('#container .lnb').height(container_height - 20);
    }).resize();

    // 팝업 닫기
    $('.pop-wrap [class*=btn][class*=close]').on('click',function () {
        $(this).closest('.pop-wrap').bPopup().close();
    });

    // 00일간 버튼 색상 변경, 대분류 색상 변경
    $(".btn-day li, .large-category-list li").click(function(){
        $(this).toggleClass("on").siblings().removeClass("on")
    });

    // 달력
    $('.cal-wrap').each(function () {
        var _btn = $(this).find('.btn-cal');
        $(this).find('.ui-ipt').datepicker({
            language: 'ko-KR',
            trigger: _btn,
            format: 'yyyy-mm-dd',
            autoHide: true
        });
    });

    //파일찾기
    var fileTarget = $('.filebox .upload-hidden');
        fileTarget.on('change', function(){
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $(this).siblings('.upload-name').val(filename);
        });


})