{extends file="parent:frontend/listing/product-box/product-badges.tpl"}

{block name='frontend_listing_box_article_discount'}
    {if $sArticle.has_pseudoprice}
        <div class="product--badge badge--discount">
            SALE
        </div>
    {/if}
{/block}