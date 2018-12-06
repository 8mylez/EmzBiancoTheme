{extends file="parent:frontend/listing/listing.tpl"}

{block name="frontend_listing_listing_content"}
    <div class="listing emz-listing"
            data-ajax-wishlist="true"
            data-compare-ajax="true"
            data-infinite-scrolling="true"
            data-loadPreviousSnippet="{s name="ListingActionsLoadPrevious"}{/s}"
            data-loadMoreSnippet="{s name="ListingActionsLoadMore"}{/s}"
            data-categoryId="{$sCategoryContent.id}"
            data-pages="{$pages}"
            data-threshold="{$theme.infiniteThreshold}"
            data-productBoxSelector=".emz-product--box">

        {if $sCategoryContent.cmsHeadline && $sCategoryContent.cmsText}
            <div class="emz-product--box">
                <div class="emz-product--box-text-wrapper">
                    <div class="emz-product--box-text-header">
                        <h1>{$sCategoryContent.cmsHeadline}</h1>
                    </div>
                    <div class="emz-product--box-text-description">{$sCategoryContent.cmsText}</div>
                </div>
            </div>
        {/if}
        {foreach $sArticles as $sArticle}
            {include file="frontend/listing/product-box/emz-box-custom.tpl"}
        {/foreach}
    </div>
{/block}