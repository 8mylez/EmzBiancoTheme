$.overridePlugin('swFilterComponent', {
    open: function(closeSiblings) {
        var me = this;
    
        me.$el.addClass(me.opts.collapseCls);
    
        $.publish('plugin/swFilterComponent/onOpen', [ me ]);
    },
});