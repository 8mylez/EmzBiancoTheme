{extends file="parent:frontend/checkout/ajax_cart.tpl"}

{block name='frontend_checkout_ajax_cart'}
    <div class="ajax--cart">
        <div class="emz-ajax-cart-header">
            <div class="emz-ajax-cart-header-headline">
                {s name="AjaxCartEmzHeadline" namespace="frontend/checkout/ajax_cart"}Bestellübersicht{/s}
            </div>
            <div class="buttons--off-canvas">
                {block name='frontend_checkout_ajax_cart_buttons_offcanvas_inner'}
                    <a href="#close-categories-menu" class="close--off-canvas">
                        <i class="fa fa-times"></i>
                    </a>
                {/block}
            </div>
            <div class="emz-ajax-cart-header-show-cart">
                <a href="{url controller='checkout' action='cart'}" class="btn button--open-basket is--icon-right" title="{"{s name='AjaxCartEmzLinkBasket' namespace="frontend/checkout/ajax_cart"}{/s}"|escape}">
                    {s name='AjaxCartEmzLinkBasket' namespace="frontend/checkout/ajax_cart"}Details anzeigen{/s}
                </a>
            </div>
        </div>
        {if $sBasket.content}
            <div class="emz-ajax-cart-buttons">
                <div class="emz-ajax-cart-amount">
                    <div class="emz-ajax-cart-amount-label">
                        {s name="AjaxCartEmzTotalAmount"}Gesamtsumme der Ware{/s}
                    </div>
                    <div class="emz-ajax-cart-amount-value">
                        {$sBasket.Amount|currency}
                    </div>
                </div>
                <div class="emz-ajax-confirm-buttons">
                    {if !($sDispatchNoOrder && !$sDispatches)}
                        {block name='frontend_checkout_ajax_cart_open_checkout_inner'}
                            <a href="{if {config name=always_select_payment}}{url controller='checkout' action='shippingPayment'}{else}{url controller='checkout' action='confirm'}{/if}" class="btn is--primary button--checkout" title="{"{s name='AjaxCartLinkConfirm'}{/s}"|escape}">
                                {s name='AjaxCartLinkConfirm'}{/s}
                            </a>
                        {/block}
                    {else}
                        {block name='frontend_checkout_ajax_cart_open_checkout_inner_disabled'}
                            <span class="btn is--disabled is--primary button--checkout is--icon-right" title="{"{s name='AjaxCartLinkConfirm'}{/s}"|escape}">
                                {s name='AjaxCartLinkConfirm'}{/s}
                            </span>
                        {/block}
                    {/if}
                </div>
            </div>
            <div class="emz-ajax-cart-items">
                <div class="item--container">
                    {block name='frontend_checkout_ajax_cart_item_container_inner'}
                        {if $sBasket.content}
                            {foreach $sBasket.content as $sBasketItem}
                                {block name='frontend_checkout_ajax_cart_row'}
                                    {include file="frontend/checkout/ajax_cart_item.tpl" basketItem=$sBasketItem}
                                {/block}
                            {/foreach}
                        {else}
                            {block name='frontend_checkout_ajax_cart_empty'}
                                <div class="cart--item is--empty">
                                    {block name='frontend_checkout_ajax_cart_empty_inner'}
                                        <span class="cart--empty-text">{s name='AjaxCartInfoEmpty'}{/s}</span>
                                    {/block}
                                </div>
                            {/block}
                        {/if}
                    {/block}
                </div>
            </div>
            <div class="emz-ajax-cart-summary">
                <div class="emz-ajax-cart-summary-headline">
                    {s name="AjaxCartEmzSummary" namespace="frontend/checkout/ajax_cart"}Ihre Bestellung{/s}
                </div>
                <div class="emz-ajax-cart-total-amount emz-ajax-cart-summary-entry">
                    <span class="emz-ajax-cart-summary-label">
                        {s name="AjaxCartTotalAmount"}Gesamtsumme der Ware{/s}
                    </span>
                    <span class="emz-ajax-cart-summary-amount">
                        {$sBasket.Amount|currency}
                    </span>
                </div>
                <div class="emz-ajax-cart-dispatch emz-ajax-cart-summary-entry">
                    <span class="emz-ajax-cart-summary-label">
                        {s name="AjaxCartEmzDispatch" namespace="frontend/checkout/ajax_cart"}Versand{/s}
                    </span>
                    <span class="emz-ajax-cart-summary-amount">
                        {$sBasket.sShippingcostsWithTax|currency}
                    </span>
                </div>
                <div class="emz-ajax-cart-tax emz-ajax-cart-summary-entry">
                    <span class="emz-ajax-cart-summary-label">
                        {s name="AjaxCartEmzTax" namespace="frontend/checkout/ajax_cart"}inkl. {$sBasket.sShippingcostsTax}% MwSt.{/s}
                    </span>
                    <span class="emz-ajax-cart-summary-amount">
                        {$sBasket.sAmountTax|currency}
                    </span>
                </div>
                <div class="emz-ajax-cart-total emz-ajax-cart-summary-entry">
                    <span class="emz-ajax-cart-summary-label">
                        {s name="AjaxCartEmzTotal" namespace="frontend/checkout/ajax_cart"}Gesamtpreis{/s}
                    </span>
                    <span class="emz-ajax-cart-summary-amount">
                        {$sBasket.sAmount|currency}
                    </span>
                </div>
            </div>
            <div class="emz-ajax-cart-buttons">
                <div class="emz-ajax-confirm-buttons">
                    {if !($sDispatchNoOrder && !$sDispatches)}
                        {block name='frontend_checkout_ajax_cart_open_checkout_inner'}
                            <a href="{if {config name=always_select_payment}}{url controller='checkout' action='shippingPayment'}{else}{url controller='checkout' action='confirm'}{/if}" class="btn is--primary button--checkout" title="{"{s name='AjaxCartLinkConfirm'}{/s}"|escape}">
                                {s name='AjaxCartLinkConfirm'}{/s}
                            </a>
                        {/block}
                    {else}
                        {block name='frontend_checkout_ajax_cart_open_checkout_inner_disabled'}
                            <span class="btn is--disabled is--primary button--checkout is--icon-right" title="{"{s name='AjaxCartLinkConfirm'}{/s}"|escape}">
                                {s name='AjaxCartLinkConfirm'}{/s}
                            </span>
                        {/block}
                    {/if}
                </div>
            </div>
        {else}
            <div class="emz-ajax-empty-cart">
                {s name="AjaxCartEmzEmptyBasket" namespace="frontend/checkout/ajax_cart"}Ihr Warenkorb enthählt aktuell keine Artikel.{/s}
            </div>
        {/if}
    </div>
{/block}