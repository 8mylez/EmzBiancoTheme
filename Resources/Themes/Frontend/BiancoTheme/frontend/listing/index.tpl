{extends file="parent:frontend/listing/index.tpl"}

{block name="frontend_listing_index_banner"}{/block}

{block name="frontend_listing_index_text"}{/block}

{block name="frontend_listing_index_topseller"}{/block}

{block name='frontend_index_breadcrumb'}{/block}

{block name='frontend_index_content_main'}
    {$smarty.block.parent}

    {include file="frontend/listing/emz-filter.tpl"}

    {if count($sBreadcrumb)}
        <div class="emz-listing-breadcrumb">
            <nav class="content--breadcrumb container block">
                {block name='frontend_index_breadcrumb_inner'}
                    {include file='frontend/index/breadcrumb.tpl'}
                {/block}
            </nav>
        </div>
    {/if}
{/block}