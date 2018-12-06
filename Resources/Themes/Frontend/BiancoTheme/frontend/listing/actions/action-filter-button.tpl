{extends file="parent:frontend/listing/actions/action-filter-button.tpl"}

{block name="frontend_listing_actions_filter_button"}
    {if $facets|count > 0}
        <a href="#"
            class="filter--trigger btn is--small"
            data-filter-trigger="true"
            data-offcanvas="true"
            data-emz-offcanvas="true"
            data-offCanvasSelector=".emz-filter-offcanvas"
            data-closeButtonSelector=".emz-filter-close-btn"
        >
            <i class="icon--filter"></i>
            {s namespace="frontend/listing/listing_actions" name='ListingFilterButton'}{/s}
            <span class="action--collapse-icon"></span>
        </a>
    {/if}
{/block}