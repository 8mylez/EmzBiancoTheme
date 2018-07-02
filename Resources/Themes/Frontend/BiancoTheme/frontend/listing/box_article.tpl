{extends file="parent:frontend/listing/box_article.tpl"}

{block name="frontend_listing_box_article_includes"}
    {if $emzProductLayout == 'emzslider'}
        {include file="frontend/listing/product-box/box-product-emzslider.tpl"}
    {else}
        {$smarty.block.parent}
    {/if}
{/block}