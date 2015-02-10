<a href="{{ product.url }}" title="{{ product.name }}" data-path-hover="M 180,400 0,400 0,140 180,160 z">
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
	<figure>
		{{ product.featured_image | product_image_url("medium") | img_tag(product.name) }}
		<svg class="blue" viewBox="0 0 179 320" preserveAspectRatio="none"><path d="M 180,400 0,400 0,0 180,0 z"/></svg>
		<svg class="white" viewBox="0 0 179 320" preserveAspectRatio="none"><path d="M 180,400 0,400 0,210 180,190 z"/></svg>
		<figcaption>
			{% if product.name|length < 32 %}
				<h2>{{ product.name }}</h2>
			{% elseif product.name|length < 60 %}
				<h2 style="font-size: 13px">{{ product.name }}</h2>
			{% elseif product.name|length < 84 %}	
				<h2 style="font-size: 11px">{{ product.name }}</h2>
			{% else %}
				<h2 style="font-size: 9px">{{ product.name }}</h2>
			{% endif %}	
            <div class="price-container {% if not product.display_price%}hidden{% endif %}">
			<p {% if not product.compare_at_price %}class="hidden"{% endif %}class="old-price"> {{ product.compare_at_price | money }}</p>
            <p class="price" id="price_display" itemprop="price" {% if not product.display_price %}class="hidden"{% endif %}>{{ product.price | money }}</p>
            </div>
			{% if not product.available %}
                <div class="product-related-button">{{ settings.no_stock_text }}</div>
            {% else %}
				<div class="product-related-button">{{"Ver producto" | translate }}</div>
			{% endif %}
		</figcaption>
	</figure>
</a>