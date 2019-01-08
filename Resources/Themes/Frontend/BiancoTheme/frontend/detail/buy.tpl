{extends file="parent:frontend/detail/buy.tpl"}

{block name='frontend_detail_buy_quantity'}
    {if $sArticle.emz_external_article_link_url eq ""}
        <input type='hidden' name='sQuantity' value='1' />
    {/if}
{/block}

{* "Buy now" button *}
{block name="frontend_detail_buy_button"}
{if $sArticle.emz_external_article_link_url neq ""}
    <a href="{$sArticle.emz_external_article_link_url}" target="_blank" class="buybox--button block btn is--primary is--icon-right is--center is--large"
       name="{s name="EmzExternalArticleLinkDetailBuyActionAdd" namespace="frontend/plugins/emz_external_article_link"}Zum Artikel{/s}"{if $buy_box_display} style="{$buy_box_display}"{/if}>
       {s name="EmzExternalArticleLinkDetailBuyActionAdd" namespace="frontend/plugins/emz_external_article_link"}Zum Artikel{/s} <i class="icon--arrow-right"></i>
    </a>
{else}
    {if $sArticle.sConfigurator && !$activeConfiguratorSelection}
        <button class="buybox--button block btn is--disabled is--icon-right is--large" disabled="disabled" aria-disabled="true" name="{s name="DetailBuyActionAddName"}{/s}"{if $buy_box_display} style="{$buy_box_display}"{/if}>
            <div class="add-article">{s name="DetailBuyActionAdd"}{/s} <i class="icon--arrow-right"></i></div>
            <div class="add-success-message"><span>{$theme.emzFancyShoppingCartText}</span> <i class="icon--check"></i></div>
        </button>
    {else}
        <button class="buybox--button block btn is--primary is--icon-right is--center is--large" name="{s name="DetailBuyActionAddName"}{/s}"{if $buy_box_display} style="{$buy_box_display}"{/if}>
            <div class="add-article">{s name="DetailBuyActionAdd"}{/s} <i class="icon--arrow-right"></i></div>
            <div class="add-success-message"><span>{$theme.emzFancyShoppingCartText}</span> <i class="icon--check"></i></div>
        </button>
    {/if}
{/if}
{/block}
