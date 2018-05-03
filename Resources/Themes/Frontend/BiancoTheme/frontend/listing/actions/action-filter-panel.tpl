{extends file="parent:frontend/listing/actions/action-filter-panel.tpl"}

{block name="frontend_listing_actions_filter_form_facets"}
    <div class="filter--active-container"
            data-reset-label="{s namespace="frontend/listing/listing_actions" name='ListingFilterResetAll'}{/s}">
    </div>
    <div class="emz-filter--facet-container">
        {include file="frontend/listing/actions/action-filter-facets.tpl" facets=$facets}
    </div>
{/block}

{block name="frontend_listing_actions_filter_active_filters"}{/block}