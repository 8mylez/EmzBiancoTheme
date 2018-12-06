{extends file='parent:frontend/index/sidebar.tpl'}

{* Mobile specific menu actions *}
{block name="frontend_index_left_navigation_smartphone"}
    <div class="navigation--smartphone">
        <ul class="navigation--list emz-header-mobile-navigation">

            {* Trigger to close the off canvas menu *}
            {block name="frontend_index_left_categories_close_menu"}
                <li class="navigation--entry entry--home" role="menuitem">
                    <a href="{url controller='index'}" title="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkHome'}{/s}"|escape}" class="btn">
                        <i class="fa fa-home"></i>
                    </a>
                </li>
                <li class="navigation--entry entry--notepad" role="menuitem">
                    <a href="{url controller='note'}" title="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkNotepad'}{/s}"|escape}" class="btn">
                        <i class="fa fa-heart-o"></i>
                        {if $sNotesQuantity > 0}
                            <span class="badge notes--quantity">
                                {$sNotesQuantity}
                            </span>
                        {/if}
                    </a>
                </li>
                <li class="navigation--entry entry--account" role="menuitem">
                    {block name="frontend_index_checkout_actions_account"}
                        <a href="{url controller='account'}" title="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}"|escape}" class="btn entry--link account--link">
                            <i class="fa fa-user-o"></i>
                        </a>
                    {/block}
                </li>
                <li class="navigation--entry entry--close-off-canvas">
                    <a href="#close-categories-menu" title="{s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s}" class="btn">
                        <i class="fa fa-times"></i>
                    </a>
                </li>
            {/block}
        </ul>
    </div>
{/block}

{* Categories headline *}
{block name="frontend_index_left_categories_headline"}{/block}
