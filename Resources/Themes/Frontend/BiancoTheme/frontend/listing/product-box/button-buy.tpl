{extends file="parent:frontend/listing/product-box/button-buy.tpl"}

{* "Buy now" button *}
{block name="frontend_listing_product_box_button_buy_button"}
    <button class="buybox--button block btn is--primary is--icon-right is--center is--large">
        {block name="frontend_listing_product_box_button_buy_button_text"}
            <div class="add-article">{s namespace="frontend/listing/box_article" name="ListingBuyActionAdd"}{/s}<i class="icon--basket"></i> <i class="icon--arrow-right"></i></div>
            <div class="add-success-message"><span>{$theme.emzFancyShoppingCartText}</span> <i class="icon--check"></i></div>
        {/block}
    </button>
{/block}
