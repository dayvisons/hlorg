<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<fieldset><legend><h1>{{ "La página no existe" | translate }}</h1></legend></fieldset>
			</div>
		</div>
	</div>
	<div class="row text-center">
		<div class="box-404">
			<p class="text-404 text-center">404</p>
			<p class="text-oops text-center">oops!</p>
		</div>
		<p class="text-center">{{ "La página que estás buscando no existe." | translate }} {{ "Quizás te interesen los siguientes productos." | translate }}</p>
		{% set related_products = sections.primary.products | take(4) | shuffle %}
		{% if related_products | length > 1 %}
		<div class="row">
			<div class="col-md-12">
				<div class="section-title section-title-large">
					<fieldset><legend><h2>{{"Productos recomendados" | translate}}</h2></legend></fieldset>		
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<section id="grid" class="grid clearfix">
				{% for related in related_products %}
					{% include 'snipplets/single_product.tpl' with {product : related} %}
				{% endfor %}
				</section>
			</div>
		</div>
		{% endif %}	
	</div>
</div>
