<form method="post" action="{url sArticle=$sArticle.articleID sCategory=$sArticle.categoryID}" class="configurator--form upprice--form">
    {foreach $sArticle.sConfigurator as $sConfigurator}

        <div class="emz-detail-product-variants">
            <div class="configurator--label">
                <div class="configurator--label-groupname">
                    {$sConfigurator.groupname}:
                </div>
                <div class="configurator--label-selected-value">
                    {foreach $sConfigurator.values as $configValue}
                        {if $configValue.selected}
                            {$configValue.optionname}
                        {/if}
                    {/foreach}
                </div>
            </div>
            <div class="configurator--select">
                {foreach $sConfigurator.values as $configValue}
                    {if !{config name=hideNoInstock} || ({config name=hideNoInstock} && $configValue.selectable)}
                        <input type="radio" 
                                name="group[{$sConfigurator.groupID}]" 
                                id="group[{$configValue.groupID}][{$configValue.optionID}]"
                                value="{$configValue.optionID}"
                                data-ajax-select-variants="true"
                                {if $configValue.selected && ($sArticle.notification || $configValue.selectable)}checked="checked"{/if} 
                                style="display: none;"
                        />

                        {if $configValue.attributes.core}
                            <label for="group[{$configValue.groupID}][{$configValue.optionID}]">
                                <div style="height: 20px; width: 30px; background-color: {$configValue.attributes.core->get('color_code')}"></div>
                            </label>
                        {/if}
                    {/if}
                {/foreach}
            </div>
        </div>
    {/foreach}

    {block name='frontend_detail_configurator_noscript_action'}
        <noscript>
            <input name="recalc" type="submit" value="{s name='DetailConfigActionSubmit'}{/s}" />
        </noscript>
    {/block}
</form>
