$.overridePlugin('swListingActions', {
    createActiveFilterElement: function (param, label) {
        
        this.activeFilterElements[param] = $('<span>', {
            'class': this.opts.activeFilterCls,
            'html': param === 'reset' ? label : label + this.getLabelIcon(),
            'data-filter-param': param
        }).appendTo(this.$activeFilterCont);
    
        $.publish('plugin/swListingActions/onCreateActiveFilterElement', [this, param, label]);
    },
    updateActiveFilterElement: function (param, label) {
        this.activeFilterElements[param].html(label + this.getLabelIcon());

        $.publish('plugin/swListingActions/onUpdateActiveFilterElement', [this, param, label]);
    },
});