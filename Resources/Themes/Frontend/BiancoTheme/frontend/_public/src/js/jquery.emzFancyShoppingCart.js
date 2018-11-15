;(function ($) {
    'use strict';

    $.overridePlugin('swAddArticle', {
        init: function () {
            var me = this,
                opts = me.opts;

            // Applies HTML data attributes to the current options
            me.applyDataAttributes();

            opts.showModal = false;

            // Will be automatically removed when destroy() is called.
            me._on(me.$el, opts.eventName, $.proxy(me.sendSerializedForm, me));

            // Close modal on continue shopping button
            $('body').delegate('*[data-modal-close="true"]', 'click.modal', $.proxy(me.closeModal, me));

            me.registerEvents();

            StateManager.addPlugin(opts.productSliderSelector, 'swProductSlider');
        },

        registerEvents: function () {
            var me = this;
            var $el = me.$el.find('button');

            me._on($el, 'click', $.proxy(me.onClick, me, $el));
        },

        onClick: function($el){
            $el.addClass('success')
            window.setTimeout(function(){
                $el.removeClass('success');
            },1000);
        }
    });
})(jQuery);
