<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="section-title">
				<fieldset><legend><h1>{{ "Carrito de Compras" | translate }}</h1></legend></fieldset>
			</div>
		</div>
	</div>
	<div itemscope itemtype="http://www.schema.org/WebPage" itemid="body">
		<ul class="breadcrumb-custom" itemprop="breadcrumb">
			<li>
				<a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
			</li>
			<li>
				<span class="separator">></span>
				<span class="crumb"><strong>{{ "Carrito de Compras" | translate }}</strong></span>
			</li>
		</ul>
	</div>
	<form role="form" action="" method="post" {% if store.analytics_account %}onsubmit="_gaq.push(['_linkByPost',this])"{% endif %}>
		{% if cart.items %}
		<div class="cart-detail">
			{% if error.add %}
				<p class="bg-info">{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}</p>
			{% endif %}
			{% for error in error.update %}
				<p class="bg-info">{{ "No podemos ofrecerte {1} unidades de {2}. Solamente tenemos {3} unidades." | translate(error.requested, error.item.name, error.stock) }}</p>
			{% endfor %}
			<table cellpadding="0" cellspacing="0" class="cart-table table-hover">
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th class="start">{{ "Producto" | translate }}</th>
						<th>{{ "Cantidad" | translate }}</th>
						<th>{{ "Precio" | translate }}</th>
						<th>{{ "Subtotal" | translate }}</th>
						<th class="last">{{ "Eliminar" | translate }}</th>
					</tr>
				</thead>
				<tbody>
					{% for item in cart.items %}
					<tr class="even">
						<td class="pic">
							<a class="thumb" href="{{ item.url }}">{{ item.featured_image | product_image_url("thumb") | img_tag(item.name) }}</a>
						</td>
						<td class="title">
							<h2><a class="name" href="{{ item.url }}">{{ item.name }}</a></h2>
						</td>
						<td class="col-quantity form-group">
							<input class="form-control text-center" type="text" name="quantity[{{ item.id }}]" value="{{ item.quantity }}" />
						</td>
						<td class="unit-price">
							{{ item.unit_price | money }}
						</td>
						<td class="subtotal">
							{{ item.subtotal | money }}
						</td>
						<td class="remove">
							<a class="center-block" href="#" onclick="LS.removeItem({{ item.id }})"><i class="fa fa-trash-o"></i></a>
						</td>
					</tr>
					{% endfor %}
				</tbody>
			</table>
		</div>
		<div class="cart-detail-totals">
			<div class='total-price text-right'>
				<p>{{ "Total" | translate }}: <span>{{ cart.total | money }}</span></p>
			</div>			
			<div class="go-to-checkout row">
			{% set cart_total = (settings.cart_minimum_value * 100) %}
                {% if cart.total >= cart_total %}
					<input class="cart-button pull-right" type="submit" name="go_to_checkout" value="{{ 'Iniciar Compra' | translate }}" />
				{% else %}
                    <h3 class="lessthan pull-right">{{ "El monto mínimo de compra es de" | translate }} <strong>{{ cart_total | money }}</strong></h3>
                {% endif %}
                {% if settings.continue_buying %}
                	<a href="{{ store.url }}" class="cart-general-button continue-buying pull-left">{{ 'Seguir comprando' | translate }}</a>
            	{% endif %}
				<input class="cart-general-button hidden pull-right" type="submit" name="update" value="{{ 'Cambiar Cantidades' | translate }}" id="change-quantities"/>
			</div>
			<div class="row">
				{% if settings.shipping_calculator %}
					{% snipplet "shipping_cost_calculator.tpl" with shipping_calculator_show = settings.shipping_calculator_cart_page %}
				{% endif %}
			</div>
		</div>
		{% else %}
		<div class="cart-detail text-center">
			{% if error %}
				{{ "No hay suficiente stock para agregar este producto al carrito." | translate }}
			{% else %}
				{{ "El carrito de compras está vacío." | translate }}
			{% endif %}
			{{ ("Seguir comprando" | translate ~ " »") | a_tag(store.products_url) }}
		</div>
		{% endif %}		
	</form>
</div>