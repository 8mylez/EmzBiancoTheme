{extends file="parent:frontend/detail/buy.tpl"}

{block name='frontend_detail_buy_quantity'}
    <input type='hidden' name='sQuantity' value='1' />
{/block}

{block name="frontend_detail_buy_button"}
    <button class="buybox--button block btn is--primary is--icon-right is--center is--large" name="{s name="DetailBuyActionAddName"}{/s}"{if $buy_box_display} style="{$buy_box_display}"{/if}>
        {s name="DetailBuyActionAdd"}{/s} <i class="icon--arrow-right"></i>
    </button>
{/block}