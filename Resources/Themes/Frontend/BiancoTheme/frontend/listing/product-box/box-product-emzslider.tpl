{extends file="parent:frontend/listing/product-box/box-product-slider.tpl"}

{block name='frontend_listing_box_article_name'}
    <a href="{$sArticle.linkDetails}"
        class="product--title"
        title="{$sArticle.articleName|escapeHtml}">
        {$sArticle.articleName|truncate:50|escapeHtml}
        
        <div class="emz-product--supplier">
            {s namespace="frontend/detail/slider" name="supplierFrom"}von{/s}
            <div class="emz-product--supplier-name">
                {$sArticle.supplierName}
            </div>
        </div>
    </a>
{/block}