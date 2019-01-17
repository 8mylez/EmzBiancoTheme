{extends file="parent:frontend/checkout/shipping_payment.tpl"}

{* Shop header *}
{block name='frontend_index_navigation'}
  {* Maincategories navigation top *}
    <nav class="navigation-main">
      <div class='emz-header-icons is-emz-header-icon-left'>
        <ul>
          {* Menu (Off canvas left) trigger *}
          {block name='frontend_index_offcanvas_left_trigger'}
              <li class="navigation--entry entry--menu-left" role="menuitem">
                  <a class="entry--link entry--trigger btn" href="#offcanvas--left" data-offcanvas="true" data-offCanvasSelector=".sidebar-main">
                      <i class="fa fa-bars"></i>
                  </a>
              </li>
          {/block}
        </ul>
      </div>
      <div class='emz-header-logo'>
        {* Logo container *}
        {block name='frontend_index_logo_container'}
            {include file="frontend/index/logo-container.tpl"}
        {/block}
      </div>
      <div class='emz-header-categories'>
        {block name="frontend_index_navigation_categories_top_include"}
            {include file='frontend/index/main-navigation.tpl'}
        {/block}
      </div>
      <div class='emz-header-icons'>
        <ul>
          {* Search form *}
          {block name='frontend_index_search'}
              <li class="navigation--entry entry--search" role="menuitem">
                  <a class="btn entry--link entry--trigger"
                      href="#"
                      title="{"{s namespace='frontend/index/search'
                      name="IndexTitleSearchToggle"}{/s}"|escape}"
                      data-offcanvas="true"
                      data-emz-offcanvas="true"
                      data-offCanvasSelector=".emz-search-offcanvas"
                      data-direction="fromRight"
                      data-closeButtonSelector=".emz-search-close-btn"
                    >
                      <i class="fa fa-search"></i>
                  </a>
              </li>
          {/block}
          {* Cart entry *}
          {block name='frontend_index_checkout_actions'}
            {* Include of the cart *}
            {block name='frontend_index_checkout_actions_include'}
                {action module=widgets controller=checkout action=info}
            {/block}
          {/block}
        </ul>
      </div>
    </nav>
    {block name="emz_frontend_index_sub_navigation"}
      {include file="frontend/index/emz-sub-navigation.tpl"}
    {/block}
    {include file="frontend/register/steps.tpl" sStepActive="paymentShipping"}
  {block name='frontend_index_container_ajax_cart'}
      <div class="container--ajax-cart" data-collapse-cart="true"{if $theme.offcanvasCart} data-displayMode="offcanvas"{/if}></div>
      <div class="emz-search-offcanvas emz-offcanvas off-canvas" data-search="true">
        <div class="emz-offcanvas-header">
          <h2>{s namespace="frontend/index/shop-navigation" name="IndexSearchFieldSubmit"}Suchen{/s}</h2>
          <a href="#" class="emz-search-close-btn emz-close-btn">
            <i class="fa fa-times"></i>
          </a>
        </div>

        <div class="emz-offcanvas-content-wrapper">
          {block name='frontend_index_search_include'}
              {include file="frontend/index/search.tpl"}
          {/block}
        </div>
      </div>
  {/block}
{/block}


{* Back to the shop button *}
{block name='frontend_index_logo_trusted_shops'}
{/block}

{* Hide sidebar left *}
{block name='frontend_index_content_left'}
{/block}

{* Hide breadcrumb *}
{block name='frontend_index_breadcrumb'}{/block}

{block name='frontend_index_logo_supportinfo'}{/block}

{* Main content *}
{block name="frontend_index_content"}
    <div class="content content--confirm product--table" data-ajax-shipping-payment="true">
        {include file="frontend/checkout/shipping_payment_core.tpl"}
    </div>
{/block}

{* Footer *}
{block name="frontend_index_footer"}
  {include file='frontend/index/emz-footer-newsletter.tpl'}
  <footer class="footer-main">
    {block name="frontend_index_footer_container"}
        {include file='frontend/index/footer.tpl'}
    {/block}
  </footer>
{/block}
