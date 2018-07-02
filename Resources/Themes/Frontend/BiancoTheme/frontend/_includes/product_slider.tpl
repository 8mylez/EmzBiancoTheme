{extends file="parent:frontend/_includes/product_slider.tpl"}

{block name="frontend_common_product_slider_container"}
    <div class="product-slider--container">
        {include file="frontend/_includes/product_slider_items.tpl" articles=$articles emzProductLayout=$emzProductLayout}
    </div>
{/block}