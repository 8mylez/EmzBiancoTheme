$.overridePlugin('swSubCategoryNav', {
    slideOut: function (template) {
        var me = this,
            opts = me.opts,
            $overlays,
            $slide;

        $.publish('plugin/swSubCategoryNav/onSlideOutBefore', [ me ]);

        me.$sidebar.append(template);

        // get all overlays
        $overlays = $(opts.overlaySelector);

        console.log($overlays);

        // flip background classes
        $overlays.toggleClass(opts.backSlideClass);

        $slide = $overlays.not('.' + opts.backSlideClass);

        console.log($slide);

        $slide[me.slideFunction]({ 'left': '100%' }, opts.animationSpeedOut, me.easingEffectOut, function () {
            $slide.remove();

            me.inProgress = false;

            $.publish('plugin/swSubCategoryNav/onSlideOut', [ me ]);
        });
    },
    slideIn: function (template) {
        var me = this,
            opts = me.opts,
            $overlays,
            $slide,
            $el;

        $.publish('plugin/swSubCategoryNav/onSlideInBefore', [ me ]);

        // hide main menu
        me.$sidebar.scrollTop(0);

        me.$sidebar.append(template);

        $overlays = $(opts.overlaySelector);

        $slide = $overlays.not('.' + opts.backSlideClass).css({
            'left': '100%',
            'display': 'block'
        });

        $slide[me.slideFunction]({ 'left': 0 }, opts.animationSpeedIn, me.easingEffectIn, function () {
            // remove background layer
            $overlays.each(function (i, el) {
                $el = $(el);

                if ($el.hasClass(opts.backSlideClass)) {
                    $el.remove();
                }
            });

            $slide.addClass(opts.backSlideClass);

            // hide main menu
            me.$sidebarWrapper.css('display', 'none');

            me.$navigation.hide().show(0);

            $slide.addClass(opts.backSlideClass);

            me.inProgress = false;

            $.publish('plugin/swSubCategoryNav/onSlideIn', [ me ]);
        });
    },
    slideToMainMenu: function () {
        var me = this,
            opts = me.opts,
            $overlay = $(opts.overlaySelector);

        $.publish('plugin/swSubCategoryNav/onSlideToMainMenuBefore', [ me ]);

        // make the main menu visible
        me.$sidebarWrapper.css('display', 'block');

        // fade in arrow icons
        me.$sidebarWrapper.find(me.opts.iconRightSelector).fadeIn('slow');

        $overlay[me.slideFunction]({ 'left': '100%' }, opts.animationSpeedOut, me.easingEffectOut, function () {
            $overlay.remove();

            // enable scrolling on main menu
            me.$sidebar.removeClass(opts.disableScrollingClass);

            me.inProgress = false;

            $.publish('plugin/swSubCategoryNav/onSlideToMainMenu', [ me ]);
        });
    },
});