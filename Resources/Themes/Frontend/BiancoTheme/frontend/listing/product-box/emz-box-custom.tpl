{block name="frontend_listing_box_article"}
    <div class="emz-product--box" data-page-index="{$pageIndex}" data-ordernumber="{$sArticle.ordernumber}">
        <div class="emz-product-highlight">
            {if $sArticle.highlight}
                {s namespace="frontend/listing/boxcustom" name="emzProductHighlight"}Tipp{/s}
            {/if}
        </div>
        <div class="emz-product-actions">
            <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber _seo=false}" method="post">
                <button type="submit"
                title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                class="product--action action--note"
                data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber _seo=false}"
                data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="fa fa-heart-o"></i>
                </button>
            </form>
        </div>
        <div class="emz-product-image">
            {include file="frontend/listing/product-box/product-image.tpl"}
        </div>
        <div class="emz-product-name">
            <a href="{$sArticle.linkDetails}" title="{$sArticle.articleName|escapeHtml}" class="product--title">
                {$sArticle.articleName|truncate:50|escapeHtml} {s namespace="frontend/listing/boxcustom" name="emzSupplierOfArticle"}von{/s} <span class="emz-supplier-name">{$sArticle.supplierName}</span>
            </a>
        </div>
        <div class="emz-product-price">
            {include file="frontend/listing/product-box/product-price-unit.tpl"}
            {include file="frontend/listing/product-box/product-price.tpl"}
        </div>
    </div>
{/block}