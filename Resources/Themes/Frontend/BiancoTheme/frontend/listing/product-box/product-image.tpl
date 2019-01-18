{extends file="parent:frontend/listing/product-box/product-image.tpl"}

{block name='frontend_listing_box_article_image_picture_element'}
    <img srcset="{$sArticle.image.thumbnails[3].sourceSet}"
            alt="{$desc}"
            title="{$desc|truncate:160}" />
            <!--270x405 thumbnail size-->
{/block}

{block name='frontend_listing_box_article_image_media'}
  {include file="frontend/listing/product-box/emzlistinghover-product-image.tpl"}
  {$smarty.block.parent}
{/block}