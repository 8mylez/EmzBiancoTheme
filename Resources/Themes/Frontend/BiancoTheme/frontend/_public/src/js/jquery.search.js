;(function ($, StateManager, window) {
    'use strict';

    var msPointerEnabled = window.navigator.msPointerEnabled,
        $body = $('body');

    /**
     * Shopware Search Plugin.
     *
     * The plugin controlling the search field behaviour in all possible states
     */
     $.overridePlugin('swSearch', {

        /**
         * Initializes the plugin
         *
         * @public
         * @method init
         */
        init: function () {
            var me = this,
                $el = me.$el,
                opts = me.opts;

            me.applyDataAttributes();

            /**
             * The URL to which the search term will send via AJAX
             *
             * @public
             * @property requestURL
             * @type {String}
             */
            me.requestURL = opts.requestUrl || window.controller.ajax_search;

            if (!me.requestURL) {
                throw new Error('Parameter "requestUrl" needs to be set.');
            }

            /**
            * Converts the url to a protocol relative url, so we don't need to manually
            * check the used http protocol. See the example from paul irish to get an idea
            * how it should work:
            *    `http://www.paulirish.com/2010/the-protocol-relative-url/`
            *    `http://blog.httpwatch.com/2010/02/10/using-protocol-relative-urls-to-switch-between-http-and-https/`
            *
            * @param {String} url - the url which needs to be converted
            * @returns {String} converted string
            */
            var convertUrlToRelativeUrl = function(url) {
                url = url.replace('https:', '');
                url = url.replace('http:', '');

                return url;
            };

            me.requestURL = convertUrlToRelativeUrl(me.requestURL);

            /**
             * The search field itself.
             *
             * @public
             * @property $searchfield
             * @type {jQuery}
             */
            me.$searchField = $el.find(opts.searchFieldSelector);

            /**
             * The list in which the top results will be shown
             *
             * @public
             * @property $results
             * @type {jQuery}
             */
            me.$results = $el.find(opts.resultsSelector);

            /**
             * The loading indicator thats inside the search
             *
             * @public
             * @property $loader
             * @type {jQuery}
             */
            me.$loader = $el.find(opts.loadingIndicatorSelector);

            /**
             * The button to toggle the search field on mobile viewport
             *
             * @public
             * @property $toggleSearchBtn
             * @type {jQuery}
             */
            me.$toggleSearchBtn = $el.parent().parent().find('.entry--search ' + opts.triggerSelector);

            /**
             * The shop header to add a new class after opening
             *
             * @public
             * @property $mainHeader
             * @type {jQuery}
             */
            me.$mainHeader = $(opts.headerSelector);

            /**
             * The last search term that was entered in the search field.
             *
             * @public
             * @property lastSearchTerm
             * @type {String}
             */
            me.lastSearchTerm = '';

            /**
             * Timeout ID of the key up event.
             * The timeout is used to buffer fast key events.
             *
             * @public
             * @property keyupTimeout
             * @type {Number}
             */
            me.keyupTimeout = 0;

            /**
             * Indicates if the form is already submitted
             *
             * @type {boolean}
             * @private
             */
            me._isSubmitting = false;

            me.registerListeners();
        },

        /**
         * onClickSearchTrigger event for displaying and hiding
         * the search field
         *
         * @public
         * @method onClickSearchEntry
         * @param event
         */
        onClickSearchEntry: function (event) {
            var me = this,
                $el = me.$el,
                opts = me.opts;

            $.publish('plugin/swSearch/onClickSearchEntry', [ me, event ]);

            me.$searchField.focus();

            if (!StateManager.isCurrentState('xs')) {
                return;
            }

            event.preventDefault();
            event.stopPropagation();

            $el.hasClass(opts.activeCls) ? me.closeMobileSearch() : me.openMobileSearch();
        },
    });
})(jQuery, StateManager, window);
