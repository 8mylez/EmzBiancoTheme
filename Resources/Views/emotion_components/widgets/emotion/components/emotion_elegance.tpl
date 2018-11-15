{block name="widgets_emotion_components_elegance_element"}
    {if ($Data.emzphe_image|strpos:"http://" !== false) || ($Data.emzphe_image|strpos:"https://" !== false)}
        {assign var="slashOrNot" value=""}
    {else}
        {assign var="slashOrNot" value="/"}
    {/if}

    {if ($Data.emzphe_hover_image|strpos:"http://" !== false) || ($Data.emzphe_hover_image|strpos:"https://" !== false)}
        {assign var="slashOrNotHover" value=""}
    {else}
        {assign var="slashOrNotHover" value="/"}
    {/if}

    <div class="hover-effect hover-effect-layout-horizontal-center hover-effect-style-emzphe-elegance-up hover-effect-layout-vertical-middle">
        <figure class="emzphe-elegance-up">
            <div class="hover-effect-thumb-ratio-container">
                <div style='background-image: url({$slashOrNot}{$Data.emzphe_image});{if $emotionMode == "rows"} padding-top: calc({$Data.emzphe_image_hdw} * 100%){/if}'></div>
            </div>

            <figcaption style="background-color: {$Data.emzphe_background_color};{if $Data.emzphe_hover_image}background-image: url({$slashOrNotHover}{$Data.emzphe_hover_image});{/if}">
                <div class="hover-effect-caption-content">
                    <div class="hover-effect-caption-content-inner">
                        <h3 class="emzphe-ih-fade-down emzphe-ih-delay-xs">{$Data.emzphe_text_upper}</h3>
                        <p class="emzphe-ih-fade-up emzphe-ih-delay-sm">{$Data.emzphe_text_lower}</p>
                    </div>
                </div>
            </figcaption>

            {if $Data.emzphe_url}
                <a href='{$Data.emzphe_url}' {if $Data.emzphe_url_target=='newtab'}target='_blank'{/if}></a>
            {/if}
        </figure>
    </div>
{/block}
