// {namespace name="backend/emotion/emz_bianco_theme"}
//{block name="emotion_components/backend/classic_hover"}
Ext.define('Shopware.apps.Emotion.view.components.ClassicHover', {

    /**
     * Extend from the base class for the emotion components
     */
    extend: 'Shopware.apps.Emotion.view.components.Base',

    /**
     * Create the alias matching the xtype you defined in your `createEmotionComponent()` method.
     * The pattern is always 'widget.' + xtype
     */
    alias: 'widget.emotion-components-classic',

    /**
     * The constructor method of each component.
     */
    initComponent: function () {
        var me = this;

        /**
         * Call the original method of the base class.
         */
        me.callParent(arguments);
    }
});
//{/block}
