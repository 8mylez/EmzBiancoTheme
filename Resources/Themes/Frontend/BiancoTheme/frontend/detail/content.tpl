{extends file="parent:frontend/detail/content.tpl"}

{block name="frontend_index_content_inner"}
    <div class="content emz-product--details" 
        itemscope 
        itemtype="http://schema.org/Product" 
        data-ajax-wishlist="true" 
        data-compare-ajax="true"
        {if $theme.ajaxVariantSwitch} data-ajax-variants-container="true"{/if} 
        data-orderNumberSelector=".emz-detail-product-style .emz-ordernumber"
        data-productDetailsSelector=".emz-product--details"
    >
        <div class="emz-detail-product-gallery" data-image-slider="true" data-thumbnails=".image--thumbnails">
            {include file="frontend/detail/emz-detail-product-gallery.tpl"}
        </div>
        <div class="emz-detail-product-details">
            {block name="frontend_detail_rich_snippets_brand"}
                <meta itemprop="brand" content="{$sArticle.supplierName|escape}"/>
            {/block}

            {block name="frontend_detail_rich_snippets_weight"}
                {if $sArticle.weight}
                    <meta itemprop="weight" content="{$sArticle.weight} kg"/>
                {/if}
            {/block}

            {block name="frontend_detail_rich_snippets_height"}
                {if $sArticle.height}
                    <meta itemprop="height" content="{$sArticle.height} cm"/>
                {/if}
            {/block}

            {block name="frontend_detail_rich_snippets_width"}
                {if $sArticle.width}
                    <meta itemprop="width" content="{$sArticle.width} cm"/>
                {/if}
            {/block}

            {block name="frontend_detail_rich_snippets_depth"}
                {if $sArticle.length}
                    <meta itemprop="depth" content="{$sArticle.length} cm"/>
                {/if}
            {/block}

            {block name="frontend_detail_rich_snippets_release_date"}
                {if $sArticle.sReleasedate}
                    <meta itemprop="releaseDate" content="{$sArticle.sReleasedate}"/>
                {/if}
            {/block}
            
            <div class="emz-detail-product-details-name">
                <h1>{$sArticle.articleName}</h1>
            </div>
            
            <div class="emz-detail-product-style">
                <h2><strong>{s namespace="frontend/detail/index" name="EmzStyleAttributeLabel"}Style: {/s}</strong>
                {$sArticle.attr1} - <span class="emz-ordernumber">{$sArticle.ordernumber}</span></h2>
            </div>

            <div class="emz-detail-product-note-action">
                <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}" method="post" class="action--form">
                    <button type="submit"
                    class="action--link link--notepad"
                    title="{"{s name='DetailLinkNotepad'}{/s}"|escape}"
                    data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber}"
                    data-text="{s name="DetailNotepadMarked"}{/s}">
                        <i class="fa fa-heart-o"></i> <span class="action--text">{s name="DetailLinkNotepadShort"}{/s}</span>
                    </button>
                </form>
            </div>

            {if $sArticle.sConfigurator}
                <div class="emz-detail-product--configurator product--configurator">
                    {include file="frontend/detail/emz-config-variants.tpl"}
                </div>
            {/if}

            {if $sArticle.sProperties}
                {foreach $sArticle.sProperties as $property}
                    {if $property.name == "Schnitt"}
                        <div class="emz-detail-product-properties">
                            <strong>{$property.name}:</strong>
                            {foreach $property.values as $value}
                                {$value}{if !$value@last},{/if}
                            {/foreach}
                        </div>
                    {/if}
                {/foreach}
            {/if}
            
            <div class="emz-detail-product-description-link">
                <strong>{s namespace="frontend/detail/index" name="EmzDescriptionLink"}
                    <i class="fa fa-angle-right"></i> Beschreibung / Material und Pflege
                {/s}</strong>
            </div>

            <div class="emz-detail-product-price-info">
                <div class="emz-detail-product-info">
                    {s namespace="frontend/detail/data" name="DetailDataPriceInfo"}{/s}
                </div>
                <div class="emz-detail-product-price">
                    {if $sArticle.has_pseudoprice}
                        <span class="emz-detail-product-pseudoprice">
                            {$sArticle.pseudoprice|currency}
                        </span>
                    {/if}
                    {$sArticle.price|currency}
                </div>
            </div>

            <div class="emz-detail-product-buy-button">
                {include file="frontend/detail/buy.tpl"}
            </div>

            <div class="emz-detail-product-instock-note">
                {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sArticle}
            </div>
        </div>
        <div class="emz-detail-product-details-info" data-emz-detail-read-more="true">
            <div class="emz-detail-product-details-info-left emz-detail-product-details-info-box">
                <div class="emz-detail-product-details-info-header">
                    {s namespace="frontend/detail/index" name="EmzDetailsAttributeLabel"}Details{/s}
                </div>
                <div class="emz-detail-product-details-info-content">
                    {if $sArticle.sProperties}
                        <ul>
                            {foreach $sArticle.sProperties as $property}
                                {if $property.attributes.core && $property.attributes.core->get('emz_full_hide_details')}

                                {else}
                                    <li>
                                        {if $property.attributes.core && $property.attributes.core->get('emz_show_frontend')}{$property.name}:{/if}
                                        {foreach $property.values as $value}
                                            {$value}{if !$value@last},{/if}
                                        {/foreach}
                                    </li>
                                {/if}
                            {/foreach}
                        </ul>
                    {/if}
                </div>
            </div>
            <div class="emz-detail-product-details-info-right emz-detail-product-details-info-box">
                <div class="emz-detail-product-details-info-header">
                    {s namespace="frontend/detail/index" name="EmzSizeAttributeLabel"}Grösse und Passform{/s}
                </div>
                <div class="emz-detail-product-details-info-content">
                    {$sArticle.attr2}
                </div>
            </div>
            <div class="emz-detail-product-details-info-footer">
                <div class="emz-detail-product-details-info-more">
                    <i class="fa fa-angle-down" aria-hidden="true"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="emz-product--details-description-headline-wrapper">
        <div class="emz-product--details-description-headline">
            Produktbeschreibung
        </div>
    </div>
    <div class="emz-product--details-description-wrapper">
        <div class="emz-product--details-description-box">
            <div class="emz-product--details-description-content-wrapper">
                <div class="emz-product--details-description">
                    <div class="emz-product--details-description-title">
                        {s namespace="frontend/detail/index" name="EmzDescriptionHeadline"}Beschreibung{/s}
                    </div>
                    <div class="emz-product--details-description-content emz-product--details-description-slide">
                        {$sArticle.description_long}
                    </div>
                </div>
                <div class="emz-product--details-description">
                    <div class="emz-product--details-description-title">
                        {s namespace="frontend/detail/index" name="EmzDescriptionAdditionalHeadline"}Material und Pflege{/s}
                    </div>
                    <div class="emz-product--details-description-content-additional emz-product--details-description-slide">
                        {$sArticle.attr3}
                        <div class="emz-product--details-description-content-additional-icons">
                            {if $sArticle.sProperties}
                                <ul>
                                    {foreach $sArticle.sProperties as $property}
                                        {if $property.attributes.core && $property.attributes.core->get('emz_full_hide_details')}
                                            {foreach $property.options as $option}
                                                <li>
                                                    {if $option.attributes.core && $option.attributes.core->get('emz_wash_icon')}<div class="icon icon---{$option.attributes.core->get('emz_wash_icon')}"></div>{/if}<div class="icon-label">{$option.name}</div>
                                                </li>
                                            {/foreach}
                                        {/if}
                                    {/foreach}
                                </ul>
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {if $sArticle.images[0] && $sArticle.images[0].thumbnails[1]}
            <div class="emz-product--details-description-box emz-product--details-description-box-right">
                <img srcset="{$sArticle.images[0].thumbnails[1].sourceSet}"
                    alt="{$sArticle.articleName}"
                    title="{$sArticle.articleName}" />
            </div>
        {/if}
    </div>
    <div class="emz-product--details-description-headline-wrapper">
        <div class="emz-product--details-description-headline">
            {s namespace="frontend/detail/index" name="EmzRecommendationHeadline"}8mylez Empfiehlt{/s}
        </div>
    </div>
    <div class="emz-product--details-recommendation-wrapper">
        <div class="tab-menu--cross-selling"{if $sArticle.relatedProductStreams} data-scrollable="true"{/if}>
            {include file="frontend/detail/content/tab_navigation.tpl"}
            {include file="frontend/detail/content/tab_container.tpl"}
        </div>
    </div>
{/block}