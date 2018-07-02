<div class="emz-image-slider--container{if !$sArticle.image} no--image{/if}{if !count($sArticle.images)} no--thumbnails{/if}">
    <div class="emz-image-slider--slide">
        {block name='frontend_detail_image_default_image_slider_item'}
            <div class="emz-image--box emz-image-slider--item">
                {block name='frontend_detail_image_default_image_element'}
                    {$alt = $sArticle.articleName|escape}

                    {if $sArticle.image.description}
                        {$alt = $sArticle.image.description|escape}
                    {/if}
                    <span class="emz-image--element"
                        {if $sArticle.image}
                        data-img-large="{$sArticle.image.thumbnails[2].source}"
                        data-img-small="{$sArticle.image.thumbnails[0].source}"
                        data-img-original="{$sArticle.image.source}"
                        {/if}
                        data-alt="{$alt}">
                        {block name='frontend_detail_image_default_image_media'}
                            <span class="emz-image--media">
                                {if isset($sArticle.image.thumbnails)}
                                    {block name='frontend_detail_image_default_picture_element'}
                                        <img srcset="{$sArticle.image.thumbnails[1].sourceSet}"
                                            src="{$sArticle.image.thumbnails[1].source}"
                                            alt="{$alt}"
                                            itemprop="image" />
                                    {/block}
                                {else}
                                    {block name='frontend_detail_image_fallback'}
                                        <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$alt}" itemprop="image" />
                                    {/block}
                                {/if}
                            </span>
                        {/block}
                    </span>
                {/block}
            </div>
        {/block}

        {foreach $sArticle.images as $image}
            {block name='frontend_detail_images_image_slider_item'}
                <div class="image--box image-slider--item">

                    {block name='frontend_detail_images_image_element'}

                        {$alt = $sArticle.articleName|escape}

                        {if $image.description}
                            {$alt = $image.description|escape}
                        {/if}

                        <span class="image--element"
                            data-img-large="{$image.thumbnails[2].source}"
                            data-img-small="{$image.thumbnails[0].source}"
                            data-img-original="{$image.source}"
                            data-alt="{$alt}">

                            {block name='frontend_detail_images_image_media'}
                                <span class="image--media">
                                    {if isset($image.thumbnails)}
                                        {block name='frontend_detail_images_picture_element'}
                                            <img srcset="{$image.thumbnails[1].sourceSet}" alt="{$alt}" itemprop="image" />
                                        {/block}
                                    {else}
                                        {block name='frontend_detail_images_fallback'}
                                            <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$alt}" itemprop="image" />
                                        {/block}
                                    {/if}
                                </span>
                            {/block}
                        </span>
                    {/block}
                </div>
            {/block}
        {/foreach}
    </div>
</div>