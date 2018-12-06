{extends file="parent:frontend/search/fuzzy.tpl"}

{block name='frontend_index_content_main'}
    {$smarty.block.parent}

    {include file="frontend/listing/emz-filter.tpl"}
{/block}
