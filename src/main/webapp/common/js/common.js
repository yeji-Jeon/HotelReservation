$(function () {

    // 검색박스
  

    // 전체카테고리
 
    // $(document).on('mouseleave','.all-cate-top-wrap',function (e) {
    //     $('.lnb-list-wrap li').removeClass('on');
    //     $('.lnb-sub-wrap>div').hide().eq(0).show();
    //     $('.all-cate-top-wrap').removeClass('on');
    //     e.stopPropagation();
    // });
  /*  $(document).on('mouseenter','.lnb-sub-wrap',function (e) {
        $('.lnb-list-wrap li').removeClass('on');
        $('.lnb-list-wrap li').eq(idx).addClass('on');
        $('.lnb-sub-wrap div').hide();
        $('.lnb-sub-wrap div').eq(idx).show();
        e.stopPropagation();
    });
    $('#header .nav .nav-menu-wrap>li:first-child>a').on('click',function (e) {
        $('.all-cate-top-wrap').toggleClass('on');
        $('.lnb-list-wrap li').removeClass('on').eq(0).addClass('on');
        $('.lnb-sub-wrap div').hide();
        idx = 0;
        $('.lnb-sub-wrap div').eq(idx).show();
        $('#header .lnb .lnb-search-key').hide();
        e.stopPropagation();
        return false;
    });*/

    // 셀렉트박스 플러그인
   /* $('select').selectric();*/

    // 상단고정 메뉴
   

    // 퀵메뉴 업
   

    // 퀵메뉴 최근본상품
    

    // 팝업 버튼으로 호출
    $('.pop-call').on('click',function (e) {
        e.preventDefault();
        var obj = $(this).data('popup');
        $(obj).bPopup();
    });
    // 팝업 닫기
    $("body").on('click', ".pop-wrap [class*=btn][class*=close]", function () {
        $(this).closest('.pop-wrap').bPopup().close();
        $(this).closest('.pop-wrap').remove();
    });

    // 인풋 파일
    


    // 아코디언
   

});