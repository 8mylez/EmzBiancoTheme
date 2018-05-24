{if $sArticle.supplierImg}
    <div class="emz-detail-product-gallery-supplier">
        <a href="{url controller='listing' action='manufacturer' sSupplier=$sArticle.supplierID}"
            title="{"{s name="DetailDescriptionLinkInformation" namespace="frontend/detail/description"}{/s}"|escape}">
            <img src="{$sArticle.supplierImg}" alt="{$sArticle.supplierName|escape}">
        </a>
    </div>
{/if}
<div class="emz-detail-product-gallery-items">
    {include file="frontend/detail/images.tpl"}
</div>