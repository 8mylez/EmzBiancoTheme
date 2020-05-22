{block name='frontend_account_payment_error_messages'}
    {block name='frontend_account_payment_error_messages_paypal_unified_errors'}
        {if $paypalUnifiedErrorCode}
            {include file='frontend/paypal_unified/checkout/error_message.tpl'}
        {/if}
    {/block}
    
    {include file="frontend/register/error_message.tpl" error_messages=$sErrorMessages}
{/block}

<div class="confirm--outer-container">
    <form id="shippingPaymentForm" name="shippingPaymentForm" method="post" action="{url controller='checkout' action='saveShippingPayment' sTarget='checkout' sTargetAction='index'}" class="payment">

        {* Action top *}
        {block name='frontend_checkout_shipping_payment_core_buttons_top'}
            {block name='frontend_checkout_shipping_payment_core_buttons'}
                <div class="confirm--actions table--actions block">
                    <button type="submit" class="btn is--primary is--icon-right is--large right main--actions">{s namespace='frontend/checkout/shipping_payment' name='NextButton'}{/s}<i class="icon--arrow-right"></i></button>
                </div>
            {/block}
        {/block}

        {* Payment and shipping information *}
        <div class="shipping-payment--information">

            {* Payment method *}
            <div class="confirm--inner-container block">
                <h3 class="payment--method-headline panel--title is--underline">{s namespace='frontend/checkout/shipping_payment' name='ChangePaymentTitle'}{/s}</h3>
                {block name='frontend_checkout_shipping_payment_core_payment_fields'}
                    {include file='frontend/checkout/change_payment.tpl' form_data=$sFormData error_flags=$sErrorFlag payment_means=$sPaymentMeans}

                    {block name='frontend_checkout_shipping_payment_core_buttons_top_paypal_unified_plus'}
                        {if $paypalUnifiedUsePlus && $paypalUnifiedApprovalUrl}
                            <div class="is--hidden paypal-unified--plus-approval-url">{$paypalUnifiedApprovalUrl}</div>
                        {/if}
                    {/block}
                {/block}
            </div>

            {* Shipping method *}
            {if $sDispatches}
                <div class="confirm--inner-container block">
                    <h3 class="dispatch--method-headline panel--title is--underline">{s namespace='frontend/checkout/shipping_payment' name='ChangeShippingTitle'}{/s}</h3>
                    {block name='frontend_checkout_shipping_payment_core_shipping_fields'}
                        {include file="frontend/checkout/change_shipping.tpl"}
                    {/block}
                </div>
            {/if}

            {* Cart values *}
            <div class="confirm--inner-container block">
                <h3 class="cart-footer--method-headline panel--title is--underline">{s namespace='frontend/checkout/shipping_payment' name='CartFooterTitle'}Zusammenfassung{/s}</h3>
                {block name='frontend_checkout_shipping_payment_core_footer'}
                    {include file="frontend/checkout/cart_footer.tpl"}
                {/block}
            </div>
        </div>
    </form>

    {* Action bottom *}
    {block name='frontend_checkout_shipping_payment_core_buttons_bottom'}
        {block name='frontend_checkout_shipping_payment_core_buttons'}
            <div class="confirm--actions table--actions block actions--bottom">
                <button type="submit" form="shippingPaymentForm" class="btn is--primary is--icon-right is--large right main--actions">{s namespace='frontend/checkout/shipping_payment' name='NextButton'}{/s}<i class="icon--arrow-right"></i></button>
            </div>
        {/block}
    {/block}
</div>
