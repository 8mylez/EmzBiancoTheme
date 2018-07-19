{extends file="parent:frontend/index/index.tpl"}

{* Step box *}
{block name='frontend_index_navigation_categories_top'}
    {$smarty.block.parent}
    {include file="frontend/register/steps.tpl" sStepActive="paymentShipping"}
{/block}

{block name='frontend_index_logo_supportinfo'}{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="content content--confirm product--table" data-ajax-shipping-payment="true">
        {include file="frontend/checkout/shipping_payment_core.tpl"}
    </div>
{/block}
