;(function ($, window) {
  'use strict';

  $.plugin('emzLoadOnHover', {

    defaults: {
      imageMediaClass: '.image--media',
      hoverImageClass: 'emz--hover-image',
      emzImageSrc: ''
    },

    init: function () {
      var me = this;

      me.applyDataAttributes();
      me.registerEvents();
    },

    registerEvents: function () {
      var me = this;
      var $el = me.$el;
      var parentElement = $el.parent().parent();

      me._on(parentElement, 'mouseenter', $.proxy(me.onHover, me, $el, parentElement));
    },

    onHover: function($el, parentElement){
      var me = this;
      var imageMediaElement = parentElement.find(me.opts.imageMediaClass);

      imageMediaElement.addClass(me.opts.hoverImageClass);
      $el.attr('srcset', me.opts.emzImageSrc);
    },
  });

})(jQuery, window);
