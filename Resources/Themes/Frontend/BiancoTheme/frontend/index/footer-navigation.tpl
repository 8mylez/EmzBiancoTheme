<div class="footer--column is--first block">
    <div class="column--headline">
        {$theme.emzFooterColumn1Headline}
    </div>

    <div class="column--content">
        {$theme.emzFooterColumn1Image}
        <p class="column--desc">
            {$theme.emzFooterColumn1Description}
        </p>
        <div class='emz-column--link'>
            <a href="{$theme.emzFooterColumn1Link}" target="_blank">{$theme.emzFooterColumn1Linktext}</a>
        </div>
    </div>
</div>

<div class="footer--column block">
    <div class="column--headline">
        {$theme.emzFooterColumn2Headline}
    </div>

    <nav class="column--navigation column--content">
        <ul class="navigation--list" role="menu">
            {foreach $sMenu.{$theme.emzFooterColumn2Sitegroup} as $item}
            <li class="navigation--entry" role="menuitem">
                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}"
                   title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                    <div class='emz-column--text'>
                        {$item.description}
                    </div>
                </a>

                {* Sub categories *}
                {if $item.childrenCount > 0}
                <ul class="navigation--list is--level1" role="menu">
                    {foreach $item.subPages as $subItem}
                    <li class="navigation--entry" role="menuitem">
                        <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                            {$subItem.description}
                        </a>
                    </li>
                    {/foreach}
                </ul>
                {/if}
            </li>
            {/foreach}
        </ul>
        <div class='emz-column--link'>
            <a href="{$theme.emzFooterColumn2Link}" target="_blank">{$theme.emzFooterColumn2Linktext}</a>
        </div>
    </nav>
</div>

<div class="footer--column column--menu block">
    <div class="column--headline">
        {$theme.emzFooterColumn3Headline}
    </div>

    <nav class="column--navigation column--content">
        <ul class="navigation--list" role="menu">
            {foreach $sMenu.{$theme.emzFooterColumn3Sitegroup} as $item}
            <li class="navigation--entry" role="menuitem">
                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}"
                   title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                    <div class='emz-column--icon'>
                        <i class="fa fa-check" aria-hidden="true"></i>
                    </div>
                    <div class='emz-column--text'>
                        {$item.description}
                    </div>
                </a>

                {* Sub categories *}
                {if $item.childrenCount > 0}
                <ul class="navigation--list is--level1" role="menu">
                    {foreach $item.subPages as $subItem}
                    <li class="navigation--entry" role="menuitem">
                        <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                            {$subItem.description}
                        </a>
                    </li>
                    {/foreach}
                </ul>
                {/if}
            </li>
            {/foreach}
        </ul>
        <div class='emz-column--link'>
            <a href="{$theme.emzFooterColumn3Link}" target="_blank">{$theme.emzFooterColumn3Linktext}</a>
        </div>
    </nav>
</div>

<div class="footer--column column--menu is--last block">
    <div class="column--headline">
        {$theme.emzFooterColumn4Headline}
    </div>

    <nav class="column--navigation column--content">
        <ul class="navigation--list" role="menu">
            {foreach $sMenu.{$theme.emzFooterColumn4Sitegroup} as $item}
            <li class="navigation--entry" role="menuitem">
                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                    {$item.description}
                </a>

                {* Sub categories *}
                {if $item.childrenCount > 0}
                <ul class="navigation--list is--level1" role="menu">
                    {foreach $item.subPages as $subItem}
                    <li class="navigation--entry" role="menuitem">
                        <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                            {$subItem.description}
                        </a>
                    </li>
                    {/foreach}
                </ul>
                {/if}
            </li>
            {/foreach}
        </ul>

        <div class='emz-column--link'>
            <a href="{$theme.emzFooterColumn4Link}" target="_blank">{$theme.emzFooterColumn4Linktext}</a>
        </div>
    </nav>
</div>
