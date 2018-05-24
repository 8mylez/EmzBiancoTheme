{extends file="parent:frontend/detail/content.tpl"}

{block name="frontend_index_content_inner"}
    <div class="content emz-product--details" itemscope itemtype="http://schema.org/Product" data-ajax-wishlist="true" data-compare-ajax="true"{if $theme.ajaxVariantSwitch} data-ajax-variants-container="true"{/if}>
        <div class="emz-detail-product-gallery" data-image-slider="true" data-thumbnails=".image--thumbnails">
            {include file="frontend/detail/emz-detail-product-gallery.tpl"}
        </div>
        <div class="emz-detail-product-details">
            Meine tollen Produkt Details
        </div>
    </div>
{/block}