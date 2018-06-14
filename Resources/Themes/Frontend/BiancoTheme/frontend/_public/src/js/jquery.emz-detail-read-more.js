;(function($) {
    'use strict';

    $.plugin('emzDetailReadMore', {
        defaults: {
            buttonSelector: '.emz-detail-product-details-info-more',
            readMoreContentSelector: '.emz-detail-product-details-info-box',
            defaultHeight: 140
        },

        init: function() {
            var me = this;

            me.applyDataAttributes();
            me.registerEvents();
        },

        registerEvents: function() {
            var me = this;
            
            me.$el.on('click', me.opts.buttonSelector, $.proxy(me.onClick, me));
        },

        onClick: function() {
            var me = this;

            if(me.$el.find(me.opts.readMoreContentSelector).height() == me.opts.defaultHeight) {
                
                me.$el.find(me.opts.readMoreContentSelector).css({
                    maxHeight: 9999
                });

                $(me.opts.buttonSelector).find('i.fa-angle-down').addClass('fa-rotate-180');
            } else {
                
                me.$el.find(me.opts.readMoreContentSelector).css({
                    maxHeight: me.opts.defaultHeight
                });
                
                $(me.opts.buttonSelector).find('i.fa-angle-down.fa-rotate-180').removeClass('fa-rotate-180');
            }
        },

        destroy: function() {
            var me = this;

            me.$el.off('click', me.opts.buttonSelector);

            me._destroy();
        }
    });
})(jQuery);