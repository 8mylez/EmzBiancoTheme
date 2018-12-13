(function($, window) {

    window.StateManager
        .addPlugin('*[data-offcanvas="true"]', 'swOffcanvasMenu', ['m'])
        .addPlugin('*[data-emz-offcanvas="true"]', 'swOffcanvasMenu', ['m','l','xl'])
        .addPlugin('*[data-subcategory-nav="true"]', 'swSubCategoryNav', ['m'])
        .removePlugin('*[data-collapse-cart="true"]', 'swCollapseCart', ['xs', 's'])
        .addPlugin('*[data-collapse-cart="true"]', 'swCollapseCart', ['m','l','xl'])
        .addPlugin('*[data-emz-detail-read-more="true"]', 'emzDetailReadMore')
        .addPlugin('.emz-product--details-description-title', 'swCollapsePanel', {
            'contentSiblingSelector': '.emz-product--details-description-slide'
        }, ['xs', 's'])
    ;

    if(window.StateManager.isCurrentState('l')){
        $('.sidebar-main.off-canvas').removeClass('off-canvas');
    }

    function onOpenMenu() {
        if($('input[name=sSearch]').length) {
            $('input[name=sSearch]').focus();
        }
    }

    function onCloseMenu() {
        if($('input[name=sSearch]').length) {
            $('input[name=sSearch]').blur();
        }
    }

    $.subscribe('plugin/swOffcanvasMenu/onClickElement', onOpenMenu);
    $.subscribe('plugin/swOffcanvasMenu/onClickCloseButton', onCloseMenu);
    
})(jQuery, window);
