{extends file="parent:frontend/index/breadcrumb.tpl"}

{block name="frontend_index_breadcrumb_prefix"}
    <li class="breadcrumb--entry" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        <span class="breadcrumb--link" itemprop="item">
            <span class="breadcrumb--title" itemprop="name">
                {s namespace="frontend/index/breadcrumb" name="BreadcrumbDefault"}Sie sind hier{/s}
            </span>
        </span>
    </li>
    <li class="breadcrumb--separator">
        <img src="{link file='frontend/_public/src/img/seperator.svg'}" />
    </li>
{/block}

{block name="frontend_index_breadcrumb_entry"}
    <li class="breadcrumb--entry{if $breadcrumb@last} is--active{/if}" itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
        {if $breadcrumb.name}
            {block name="frontend_index_breadcrumb_entry_inner"}
                {if $breadcrumb.link}
                    <a class="breadcrumb--link" href="{$breadcrumb.link}" title="{$breadcrumb.name|escape}" itemprop="item">
                        <link itemprop="url" href="{$breadcrumb.link}" />
                        <span class="breadcrumb--title" itemprop="name">{$breadcrumb.name}</span>
                    </a>
                {else}
                    <span class="breadcrumb--link" itemprop="item">
                        <span class="breadcrumb--title" itemprop="name">{$breadcrumb.name}</span>
                    </span>
                {/if}
                <meta itemprop="position" content="{$breadcrumb@index}" />
            {/block}
        {/if}
    </li>
    {if !$breadcrumb@last}
        <li class="breadcrumb--separator">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
            <img src="{link file='frontend/_public/src/img/seperator.svg'}" />
        </li>
    {/if}
{/block}