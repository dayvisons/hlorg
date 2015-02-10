{% paginate by 8 %}
{% if "banner-products.jpg" | has_custom_image %}
<div class="banner">
	<div class="banner-shadow"></div>
	{% if settings.banner_products_url != '' %}
		{{ "banner-products.jpg" | static_url | img_tag(category.name) | a_tag(settings.banner_products_url) }}
	{% else %}
		{{ "banner-products.jpg" | static_url | img_tag(category.name) }}
	{% endif %}
</div>
{% endif %}
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<fieldset><legend><h1>{{ category.name }}</h1></legend></fieldset>
			</div>
		</div>
	</div>
	{% snipplet "breadcrumbs.tpl" %}
		<div class="container center">
            {% snipplet 'sort_by.tpl' %}
        </div>
	<div class="row">
	{% if products %}
		<section id="grid" class="product-grid grid">
		{% include 'snipplets/product_grid.tpl' %}
		</section>
	{% else %}
        <div class="centered st">
            <h3>{{"Próximamente" | translate}}</h3>
        </div>
    {% endif %}
	</div>
	<div class="crumbPaginationContainer bottom">
		<div class='pagination'>
			{% snipplet "pagination.tpl" %}
		</div>
	</div>
</div>
