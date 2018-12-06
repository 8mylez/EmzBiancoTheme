{extends file="parent:widgets/index/shop_menu.tpl"}

{block name="frontend_index_actions_active_shop_language_form_content"}
    <div class="field--select">
        {s namespace="frontend/index/menu_footer" name="emzLanguageSwitcherLabel"}Land auswählen:{/s}
        {block name="frontend_index_actions_active_shop_language_form_select"}
            <select name="__shop" class="language--select" data-auto-submit="true">
                {foreach $languages as $language}
                    <option value="{$language->getId()}" {if $language->getId() === $shop->getId()}selected="selected"{/if}>
                        {$language->getName()}
                    </option>
                {/foreach}
            </select>
        {/block}
        <input type="hidden" name="__redirect" value="1">
        {block name="frontend_index_actions_active_shop_inline"}{/block}
        <span class="arrow"></span>
        <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
    </div>
{/block}
