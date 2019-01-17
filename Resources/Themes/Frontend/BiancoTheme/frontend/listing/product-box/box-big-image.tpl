{extends file="parent:frontend/listing/product-box/box-big-image.tpl"}

{block name='frontend_listing_box_article_image_media'}
  {include file="frontend/listing/product-box/emzlistinghover-box-big-image.tpl"}
  {$smarty.block.parent}
{/block}
