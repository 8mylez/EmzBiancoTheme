{extends file='parent:frontend/index/main-navigation.tpl'}

{block name='frontend_index_navigation_categories'}
  <div class='emz-header-categories-wrapper'  data-menu-scroller="true" data-listSelector=".navigation--list.container" data-viewPortSelector=".navigation--list-wrapper">
    {$smarty.block.parent}
  </div>
{/block}

{block name='frontend_index_navigation_categories_top_home'}
{/block}
