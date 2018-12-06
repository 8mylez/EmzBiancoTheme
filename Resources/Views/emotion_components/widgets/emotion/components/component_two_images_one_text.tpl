{block name="widgets_emotion_components_two_images_one_text_element"}
  <div class="emz-bt-tiot-ewe">
    <div class="container">
      <div class="emz-bt-tiot-title">{$Data.title}</div>
      <div class="emz-bt-tiot-left-image">
        <img src="{$Data.left_image}" />
      </div>
      <div class="emz-bt-tiot-right-image">
        <img src="{$Data.right_image}" />
      </div>
      <div class="emz-bt-tiot-description-wrapper">
        <div class="emz-bt-tiot-description-title">{$Data.descriptionTitle}</div>
        <div class="emz-bt-tiot-description">{$Data.description}</div>
        <div class="emz-bt-tiot-links-wrapper">
          <div class="emz-bt-tiot-link-wrapper emz-bt-tiot-read-more-wrapper">
            <a href="{$Data.readMoreLink}" target="_blank">
              <div class="emz-bt-tiot-link-icon">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
              </div>
              Mehr lesen
            </a>
          </div>
          <div class="emz-bt-tiot-link-wrapper emz-bt-tiot-go-shopping-wrapper">
            <a href="{$Data.goShoppingLink}" target="_blank">
              <div class="emz-bt-tiot-link-icon">
                <i class="fa fa-angle-right" aria-hidden="true"></i>
              </div>
              Jetzt shoppen
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
{/block}
