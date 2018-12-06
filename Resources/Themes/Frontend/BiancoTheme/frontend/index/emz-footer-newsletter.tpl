<div class='emz-footer-newsletter'>
  <div class='emz-footer-newsletter-wrapper'>
    <div class='emz-footer-newsletter-header'>
      {s namespace="frontend/index/menu_footer" name="sFooterNewsletterHead"}{/s}
    </div>
    <div class='emz-footer-newsletter-description'>
      {s namespace="frontend/index/menu_footer" name="sFooterNewsletter"}{/s}
    </div>
    <div class='emz-footer-newsletter-form'>
      {block name="frontend_index_footer_column_newsletter_form"}
          <form class="newsletter--form" action="{url controller='newsletter'}" method="post">
              <input type="hidden" value="1" name="subscribeToNewsletter" />

              {block name="frontend_index_footer_column_newsletter_form_field"}
                  <input type="email" name="newsletter" class="newsletter--field" />
              {/block}

              {block name="frontend_index_footer_column_newsletter_form_submit"}
                  <button type="submit" class="newsletter--button btn">
                      <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
                  </button>
              {/block}
          </form>
      {/block}
    </div>
  </div>
</div>
