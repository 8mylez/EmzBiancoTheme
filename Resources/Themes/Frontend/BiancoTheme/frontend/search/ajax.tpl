{extends file="parent:frontend/search/ajax.tpl"}

{block name="search_ajax_inner"}
    <h2>{s namespace="frontend/search/ajax" name="IndexSearchResultsHeadline"}Produkte{/s}</h2>
    {$smarty.block.parent}
{/block}

{block name="search_ajax_list_entry"}
    <li class="list--entry block-group result--item">
        <a class="search-result--link" href="{$search_result.link}" title="{$search_result.name|escape}">
            <div class="emz-offcanvas-search-result-item">
                <div class="emz-offcanvas-search-result-item-left-wrapper">
                    {block name="search_ajax_list_entry_name"}
                        <span class="entry--name block">
                            {$search_result.name|escapeHtml}
                        </span>
                        {block name="search_ajax_list_entry_price"}
                            <span class="entry--price block">
                                {$sArticle = $search_result}
                                {$sArticle.has_pseudoprice = 0}
                                {include file="frontend/listing/product-box/product-price.tpl" sArticle=$sArticle}
                            </span>
                        {/block}
                    {/block}
                </div>
                <div class="emz-offcanvas-search-result-item-right-wrapper">
                    {block name="search_ajax_list_entry_media"}
                        <span class="entry--media block">
                            {if $search_result.image.thumbnails[0]}
                                <img srcset="{$search_result.image.thumbnails[0].sourceSet}" alt="{$search_result.name|escape}" class="media--image">
                            {else}
                                <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{"{s name='ListingBoxNoPicture'}{/s}"|escape}" class="media--image">
                            {/if}
                        </span>
                    {/block}
                </div>
            </div>            
        </a>
    </li>
{/block}