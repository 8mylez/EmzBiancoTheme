{block name="widgets_emotion_components_classic_element"}
    <div class="hover-effect hover-effect-layout-horizontal-center hover-effect-style-emzphc-classic hover-effect-layout-vertical-middle">
        <figure class="emzphc-classic">

            <div class="hover-effect-thumb-ratio-container">
                <div style='background-image: url({$Data.emzphc_image});'></div>
            </div>

            <figcaption style="background-color: {$Data.emzphc_background_color};{if $Data.emzphc_hover_image}background-image: url({$Data.emzphc_hover_image});{/if}">
                <div class="hover-effect-caption-content">
                    <div class="hover-effect-caption-content-inner">
                        <h3 class="emzphc-ih-fade-down emzphc-ih-delay-xs">{$Data.emzphc_text_upper}</h3>
                        <p class="emzphc-ih-fade-up emzphc-ih-delay-sm">{$Data.emzphc_text_lower}</p>
                    </div>
                </div>
            </figcaption>

            {if $Data.emzphc_url}
                <a href='{$Data.emzphc_url}' {if $Data.emzphc_url_target=='newtab'}target='_blank'{/if}></a>
            {/if}
        </figure>
    </div>
{/block}
