{extends file="parent:frontend/listing/product-box/product-badges.tpl"}

{block name='frontend_listing_box_article_discount'}
    <div class="product--badge badge--discount">
        {if $sArticle.has_pseudoprice}
            SALE
        {/if}
    </div>
{/block}