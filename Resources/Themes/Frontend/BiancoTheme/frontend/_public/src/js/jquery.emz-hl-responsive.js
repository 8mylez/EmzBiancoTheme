;(function ($, window) {
    'use strict';
  
    function loadEmzLoadOnHover(){
        $('*[data-emz-hl-active="true"]').emzLoadOnHover();
    }

    loadEmzLoadOnHover();
    $.subscribe('plugin/swEmotionLoader/onLoadEmotionFinished', loadEmzLoadOnHover);
    $.subscribe('plugin/swProductSlider/onLoadItemsSuccess', loadEmzLoadOnHover);
    $.subscribe('plugin/swInfiniteScrolling/onLoadPreviousFinished', loadEmzLoadOnHover);
    $.subscribe('plugin/swInfiniteScrolling/onFetchNewPageFinished', loadEmzLoadOnHover);

})(jQuery, window);