{extends file="parent:frontend/listing/product-box/box-product-slider.tpl"}

{block name='frontend_listing_box_article_name'}
    {$smarty.block.parent}

    <div class="emz-product--supplier">
        {s namespace="frontend/detail/slider" name="supplierFrom"}von{/s}
        <div class="emz-product--supplier-name">
            {$sArticle.supplierName}
        </div>
    </div>
{/block}