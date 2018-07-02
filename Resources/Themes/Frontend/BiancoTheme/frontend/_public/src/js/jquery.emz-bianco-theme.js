(function($, window) {
    
    window.StateManager
        .addPlugin('*[data-offcanvas="true"]', 'swOffcanvasMenu', ['m'])
        .addPlugin('*[data-emz-offcanvas="true"]', 'swOffcanvasMenu', ['m','l','xl'])
        .addPlugin('*[data-subcategory-nav="true"]', 'swSubCategoryNav', ['m'])
        .removePlugin('*[data-collapse-cart="true"]', 'swCollapseCart', ['xs', 's'])
        .addPlugin('*[data-collapse-cart="true"]', 'swCollapseCart', ['m','l','xl'])
        .addPlugin('*[data-emz-detail-read-more="true"]', 'emzDetailReadMore')
    ;

    if(window.StateManager.isCurrentState('l')){
        $('.sidebar-main.off-canvas').removeClass('off-canvas');
    }

})(jQuery, window);