{if $sArticle.attributes.emzExtendListing && $sArticle.attributes.emzExtendListing->get('emzHoverImage')}
  {block name='frontend_listing_hover_listing_plugin_variables'}
    {$sArticleHoverImage = $sArticle.attributes.emzExtendListing->get('emzHoverImage')}
  {/block}
  <span class="emz-image--media-second">
    <img class="emz-hl-image"
      {*set plugin active or not*}
      data-emz-hl-active="{if $sArticleHoverImage}true{else}false{/if}" 
      {*this will be the source of the img*}
      data-emzImageSrc="{$sArticleHoverImage[0]}" 
      {* srcset will be filled with jquery plugin*}
      srcset=""
      alt="{$desc}"
      title="{$desc|truncate:160}" />
  </span>
{/if}
