<div class="container">
    <div itemscope itemtype="http://schema.org/Product">
        <div class="row">
            <div class="col-md-12">
                <div class="section-title">
                    <fieldset><legend><h1 itemprop="name">{{ product.name }}</h1></legend></fieldset>
                </div>
            </div>
        </div>
        {% snipplet "breadcrumbs.tpl" %}
        <div class="row" id="single-product" data-variants="{{product.variants_object | json_encode }}">
            <div class="col-md-6 product-photos">
                <div class="row">
                    <div class="direction-nav no-gutter">
                        <a href="#" class="prev {% if product.images_count == 1 %}hidden{% endif %}">&nbsp;</a>
                    </div>
                    <div class="current-photo no-gutter">
                        <div class="current-photo-container">
                            <div class="pills">
                                {% if product.compare_at_price %}
                                    <div class="offer-pill">{{ settings.offer_text }}</div>
                                {% endif %}
                                {% if not product.available %}
                                    <div class="stock-pill">{{ settings.no_stock_text }}</div>
                                {% endif %}
                                {% if product.free_shipping %}
                                    <div class="free-shipping-pill">{{ settings.free_shipping_text }}</div>
                                {% endif %}
                            </div>
                            {% if product.featured_image %}
                                <a href="{{ product.featured_image | product_image_url('original') }}" id="zoom" class="cloud-zoom" rel="position: 'inside', showTitle: false, loading: '{{ 'Cargando...' | translate }}'">
                                    {{ product.featured_image | product_image_url('large') | img_tag(product.name) }}
                                </a>
                            {% else %}
                                {{ product.featured_image | product_image_url('large') | img_tag(product.name) }}
                            {% endif %}
                        </div>
                    </div>
                    <div class="direction-nav right no-gutter">
                        <a href="#" class="next {% if product.images_count == 1 %}hidden{% endif %}">&nbsp;</a>
                    </div>
                </div>
                <div class="row">
                    {% if product.images_count > 1 %}
                    <div class="thumb-container">
                        {% for image in product.images %}

                                <a href="{{ image | product_image_url('original') }}" class="cloud-zoom-gallery" rel="useZoom: 'zoom', smallImage: '{{ image | product_image_url('large') }}' ">
                                    <span>
                                    {{ image | product_image_url('thumb') | img_tag(product.name) }}
                                    </span>
                                </a>

                        {% endfor %}
                    </div>
                    {% endif %}
                </div>
            </div>
            <div class="col-md-6">
                <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
                    <div class="price-container {% if not product.display_price%}hidden{% endif %}">
                        <p id="compare_price_display" {% if not product.compare_at_price %}class="hidden"{% endif %}class="big-old-price"> {{ product.compare_at_price | money }}</p>
                        <p class="big-price" id="price_display" itemprop="price" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</p>
                        <meta itemprop="priceCurrency" content="{{ product.currency }}" />
                        {% if product.stock_control %}
                            <meta itemprop="inventoryLevel" content="{{ product.stock }}" />
                            <meta itemprop="availability" href="http://schema.org/{{ product.stock ? 'InStock' : 'OutOfStock' }}" content="{{ product.stock ? 'In stock' : 'Out of stock' }}" />
                        {% endif %}
                    </div>
                </div>
                <meta itemprop="image" content="{{ 'http:' ~ product.featured_image | product_image_url('medium') }}" />
                <meta itemprop="url" content="{{ product.social_url }}" />
                {% if page_description %}
                    <meta itemprop="description" content="{{ page_description }}" />
                {% endif %}
                {% if product.sku %}
                    <meta itemprop="sku" content="{{ product.sku }}" />
                {% endif %}
                {% if product.weight %}
                    <div itemprop="weight" itemscope itemtype="http://schema.org/QuantitativeValue" style="display:none;">
                        <meta itemprop="unitCode" content="{{ product.weight_unit | iso_to_uncefact}}" />
                        <meta itemprop="value" content="{{ product.weight}}" />
                    </div>
                {% endif %}
                  <div class="installments {% if not product.display_price or product.installments <= 1 %}hidden{% endif %}">
                                {% set installments %}<span id="installments_number">{{ product.installments }}</span>{% endset %}
                                {% if settings.no_interest %}
                                    {% set installment_amount %}<span id="installments_amount">{{ (product.price / product.installments) | money }}</span>{% endset %}
                                    {{ "En hasta {1} cuotas de {2} sin interés" | translate(installments, installment_amount) }}
                                {% else %}
                                    {{ "En hasta {1} cuotas en tarjeta de crédito" | translate(installments) }}
                                {% endif %}
                            </div>
                <form id="product_form" method="post" action="{{ store.cart_url }}">
                    <input type="hidden" name="add_to_cart" value="{{product.id}}" />
                    {% if product.variations %}
                        <div class="variant-container">
                            {% for variation in product.variations %}
                                <div class="variant">
                                    <label class="variation-label" for="variation_{{loop.index}}"><h3>{{variation.name}}:</h3></label>
                                    <div class="custom-select">
                                        {% if variation.options | length > 1 %}
                                            <select class="form-control on-steroids" id="variation_{{loop.index}}" name="variation[{{ variation.id }}]" onchange="LS.changeVariant(changeVariant, '#single-product')">
                                                {% for option in variation.options %}
                                                    <option value="{{ option.id }}" {% if product.default_options[variation.id] == option.id %}selected="selected"{% endif %}>{{ option.name }}</option>
                                                {% endfor %}
                                            </select>
                                        {% else %}
                                            <p>{{ variation.options[0].name }}</p>
                                            <input type="hidden" name="variation[{{ variation.options[0].id }}]" value="{{variation.options[0].id}}">
                                        {% endif %}
                                    </div>
                                </div>
                            {% endfor %}
                        </div>
                    {% endif %}
                    {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                    {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'catalog': "Consultar", 'nostock' : settings.no_stock_text} %}
                    <input type="submit" class="addToCart big-product-related-button {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />
                    {% if settings.shipping_calculator %}
                        {% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_product_page and not product.free_shipping, shipping_calculator_variant = product.selected_or_first_available_variant %}
                    {% endif %}
                    <div class="shareLinks">
                        <div class="shareItem twitter">
                            {{product.social_url | tw_share('none', 'Tweet', store.twitter_user, current_language.lang) }}
                        </div>
                        <div class="shareItem google">
                            {{product.social_url | g_plus('medium') }}
                        </div>
                        <div class="shareItem facebook">
                            {{product.social_url | fb_like('store-product', 'button_count')}}
                        </div>
                        <div class="shareItem pinterest">
                            {{product.social_url | pin_it('http:' ~ product.featured_image | product_image_url('original'))}}
                        </div>
                    </div>
                    {% if settings.show_description_bottom == 0 %}
                        <div class="description">{{ product.description }}</div>
                    {% endif %}
                </form>
            </div>
        </div>
    </div>
	<div class="row">
		{% if settings.show_description_bottom %}
		<div class="col-md-12">
			<p class="description">{{ product.description }}</p>
		</div>
		{% endif %}	
		<div class="col-md-12">
			<div class="comments-area">
                {% if settings.show_product_fb_comment_box %}
				    <div class="fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
                {% endif %}
            </div>
		</div>
	</div>
	{% set related_products = category.products | shuffle | take(4) %}
	{% if related_products | length > 1 %}
	<div class="row">
		<div class="col-md-12">
			<div class="section-title section-title-large">
				<fieldset><legend><h2>{{"Productos Relacionados" | translate}}</h2></legend></fieldset>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<section id="grid" class="grid clearfix">
			{% for related in related_products %}
				{% if product.id != related.id %}
					{% include 'snipplets/single_product.tpl' with {product : related} %}
				{% endif %}
			{% endfor %}
			</section>
		</div>
	</div>
	{% endif %}		
</div>
