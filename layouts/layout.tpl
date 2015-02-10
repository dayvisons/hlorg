<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		{% if template == 'home' %}
		<title>{{ store.name }}</title>
		{% else %}
			<title>{{ page_title }} &mdash; {{ store.name }}</title>
		{% endif %}
        <meta name="description" content="{{ page_description }}" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		{% if settings.fb_admins %}
			<meta property="fb:admins" content="{{ settings.fb_admins }}" />
		{% endif %}
		{% if not store.has_custom_domain %}
			<meta property="fb:app_id" content="{{ fb_app.id }}" />
		{% endif %}
		{{ store.name | og('site_name') }}
		{% if template == 'product' %}
			{# Twitter #}
			<meta name="twitter:card" content="product" />
			<meta name="twitter:url" content="{{ product.social_url }}" />
			<meta name="twitter:image:src" content="{{ ('http:' ~ product.featured_image | product_image_url('huge')) }}" />
			{% if store.twitter_user %}
				<meta name="twitter:site" content="{{ store.twitter_user }}" />
			{% endif %}
			<meta name="twitter:title" content="{{ product.name }}" />
			<meta name="twitter:data1" content="{{ product.display_price ? product.price | money_long : 'Consultar' | translate }}" />
			<meta name="twitter:label1" content="{{ 'Precio' | translate | upper }}" />
			<meta name="twitter:data2" content="{{ product.stock_control ? (product.stock > 0 ? product.stock : 'No' | translate) : 'Sí' | translate }}" />
			<meta name="twitter:label2" content="{{ 'Stock' | translate | upper }}" />
			{# Facebook #}
			{{ product.social_url | og('url') }}
			{{ product.name | og('title') }}
			{{ page_description | og('description') }}
			{{ "#{fb_app.namespace}:product" | og('type') }}
			{{ ('http:' ~ product.featured_image | product_image_url('medium')) | og('image') }}
			{{ ('https:' ~ product.featured_image | product_image_url('medium')) | og('image:secure_url') }}
			{% if product.display_price %}
				{{ (product.price / 100) | og_fb_app('price') }}
			{% endif %}
			{% if product.stock_control %}
				{{ product.stock | og_fb_app('stock') }}
			{% endif %}
		{% endif %}

        {{ "//fonts.googleapis.com/css?family=Bitter:400,700|Oswald:400,300,700|Montserrat:400,700|Lato:300,400,500,700,900|Nunito:400,700,300" | css_tag }}
		{{ "//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" | css_tag }}
        {{ '//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css' | css_tag }}
		{{ 'css/style.css' | static_url | css_tag }}
		{{ 'css/main-color.scss.tpl' | static_url | css_tag }}
		{{ 'css/style-media.css' | static_url | css_tag }}

        {% set nojquery = true %}
        {{ "//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" | script_tag }}
        {% head_content %}
        <!--[if lt IE 9]>
        {{ '//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv-printshiv.min.js' | script_tag }}
        <![endif]-->
    </head>
    {% if "default-background.jpg" | has_custom_image %}
    	<body class="user-background {% if not settings.bg_repeat %}bg-no-repeat{% endif %}" style="background-position-x:{{ settings.bg_position_x }};">
	{% else %}
	<body class="pattern-background">
	{% endif %}
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->
			<div class="header-bar">
				{% if settings.fixed_menu %}
				<div class="header-bar-fixed">
					<div class="container">
						<div class="row">
							<!-- comentario -->
							<div class="col-sm-3 logo-container">
								{% if "fixed_menu_logo.jpg" | has_custom_image %}
								<div id="logo" class="img">
									{{ "fixed_menu_logo.jpg" | static_url | img_tag(store.name) | a_tag(store.url) }}
								</div>
								{% elseif has_logo %}
								<div id="logo" class="img">
									{{ store.logo | img_tag(store.name) | a_tag(store.url) }}
								</div>
								{% else %}
								<div id="logo">
									<a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
								</div>								
								{% endif %}
							</div>
							<nav class="col-sm-6 text-center">
								<ul id="menu-fixed" class="sf-menu">
								{% snipplet "navigation.tpl" %}
								</ul>
								<nav class="mobile">
									<select class="on-steroids" name="main_navigation" id="main_navigation" onchange="location = this.options[this.selectedIndex].value;">
										{% snipplet "navigation-mobile.tpl" %}
									</select>
								</nav>
							</nav>

							<div class="col-sm-3 no-gutter">
						
								{% if not store.is_catalog %}
									{% snipplet "cart_fixed.tpl" as "cart" %}
								{% endif %}	
							</div>
								<center>
									<div class="searchbox">
									<form action="{{ store.search_url }}" method="get" role="form">
										<div class="form-group">
											<input class="form-control text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
											<button class="submit-button" type="submit"><i class="fa fa-search"></i></button>
										</div>
									</form>
								</div>
							</center>

						</div>

					</div>

				</div>
				
				{% endif %}
				<div class="header-bar-top">
					<div class="container">
						<div class="row">
							<div class="col-sm-6 text-left">
								{% if languages | length > 1 %}
								<div class="languages dropdown">
									{% for language in languages %}
									{% if language.active %}
									<a  class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
									{{ language.country | flag_url | img_tag(language.name) }}
									<span class="caret"></span>
									</a>
									{% endif %}
									{% endfor %}
									<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
										{% for language in languages %}
										<li role="presentation">
											<a role="menuitem" tabindex="-1" href="{{ language.url }}" class="{{ class }}">
												{{ language.country | flag_url | img_tag(language.name) }}<span>&nbsp{{ language.name }}</span>
											</a>
										</li>
										{% endfor %}
									</ul>
								</div>
								{% endif %}
								{% if store.phone %}
									<p class="phone">
										{{ store.phone }}
										{% if store.email %}
										&nbsp;|&nbsp;
										{% endif %}
									</p>
								{% endif %}
								{% if store.email %}
									<p class="mail">{{ store.email | mailto }}</p>
								{% endif %}
							</div>
							<div class="col-sm-6 text-right">
							{% if store.has_accounts %}
								<div id="auth">
									{% if not customer %}
										{% if store.customer_accounts != 'mandatory' %}
										{{ "Crear cuenta" | translate | a_tag(store.customer_register_url) }}
										<span>&nbsp;|&nbsp;</span>
										{% endif %}
										{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url) }}
									{% else %}
										{{ "Mi cuenta" | translate | a_tag(store.customer_home_url) }}
										<span>&nbsp;|&nbsp;</span>
										{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url) }}
									{% endif %}
								</div>
							{% endif %}						
							</div>
						</div>
					</div>
				</div>
				<div class="header-bar-main container">
					<div class="row">
						<div class="col-sm-3 logo-container">
							{% if has_logo %}
							<div id="logo" class="img">
								{{ store.logo | img_tag(store.name) | a_tag(store.url) }}
							</div>
							{% else %}
							<div id="logo">
								<a id="no-logo" href="{{ store.url }}">{{ store.name }}</a>
							</div>
							{% endif %}
						</div>
						<nav class="col-sm-6 text-center">
							<ul id="menu" class="sf-menu">
							{% snipplet "navigation.tpl" %}
							</ul>
							<nav class="mobile">
								<select class="on-steroids" name="main_navigation" id="main_navigation" onchange="location = this.options[this.selectedIndex].value;">
									{% snipplet "navigation-mobile.tpl" %}
								</select>
							</nav>
						</nav>
						<div class="col-sm-3 no-gutter">
							
							{% if not store.is_catalog %}
								{% snipplet "cart.tpl" as "cart" %}
							{% endif %}						
						</div>
					</div>
				</div>
			</div>
			<center>
				<div class="searchbox">
								<form action="{{ store.search_url }}" method="get" role="form">
									<div class="form-group">
										<input class="form-control text-input" type="text" name="q" placeholder="{{ 'Buscar' | translate }}"/>
										<button class="submit-button" type="submit"><i class="fa fa-search"></i></button>
									</div>
								</form>
							</div>
							</center>
			{% template_content %}
			{% if store.facebook or store.twitter or store.google_plus or store.pinterest or store.instagram %}
			<div class="container">
				<div class="row social-networks">
					<div class="col-md-12">
						<div class="section-title">
							<fieldset><legend><h2>{{"Seguinos" | translate}}</h2></legend></fieldset>
						</div>
                        <ul class="text-center list-inline">
                            {% for sn in ['facebook', 'twitter', 'google_plus', 'pinterest', 'instagram'] %}
                                {% set sn_url = attribute(store,sn) %}
                                {% if sn_url %}
                                    <li>
                                        <a class="social-button soc-foot {{ sn }}" href="{{ sn_url }}" target="_blank" {% if sn == 'google_plus' %}rel="publisher"{% endif %}><i class="fa {% if sn == 'google_plus' %}fa-google-plus{% else %}fa-{{ sn }}{% endif %}"></i></a>
                                    </li>
                                {% endif %}
                            {% endfor %}
                        </ul>
					</div>
				</div>
			</div>
			{% endif %}
			<div class="footer">
				<div class="footer-main">
					<div class="container">
						{% set has_seals = store.afip or ebit or siteforte %}
						<div class="row">
							<div class="col-md-{% if has_seals %}3{% else %}4{% endif %}">
								<h3>{{ settings.footer_menu_title }}</h3>
								<ul class="footer-menu">
									{% snipplet "navigation-foot.tpl" %}
								</ul>
							</div>
							<div class="payment-send col-md-{% if has_seals %}3{% else %}4{% endif %}">
								<h3>{{ 'Medios de pago' | translate }}</h3>
								{% for payment in settings.payments %}
									{{ payment | payment_logo | img_tag('', {'height' : 30}) }}
								{% endfor %}								
								<h3>{{ 'Formas de envío' | translate }}</h3>
								{% for shipping in settings.shipping %}
									{{ shipping | shipping_logo | img_tag('', {'height' : 30}) }}
								{% endfor %}								
							</div>
							{% if store.phone or store.email or store.blog or store.address %}
							<div class="col-md-{% if has_seals %}3{% else %}4{% endif %}">
								<h3>{{ 'Contactanos' | translate }}</h3>
								<ul class="footer-contact">
								{% if store.phone %}
									<li><i class="fa fa-phone"></i>{{ store.phone }}</li>
								{% endif %}
								{% if store.email %}
									<li><i class="fa fa-envelope"></i>{{ store.email | mailto }}</li>
								{% endif %}
								{% if store.blog %}
									<li><a target="_blank" href="{{ store.blog }}"><i class="fa fa-comments"></i>{{ "Visita nuestro Blog!" | translate }}</a></li>
								{% endif %}
								{% if store.address %}
									<li><i class="fa fa-map-marker"></i>{{ store.address }}</li>
								{% endif %}								
								</ul>
							</div>
							{% endif %}
							<div class="col-md-3 seals" {% if not (store.afip or ebit or siteforte) %}style="display:none;"{% endif %}>
								<h3>{{ 'Información legal' | translate }}</h3>
								{% if store.afip %}
									<div class="afip">
										{{ store.afip | raw }}
									</div>
								{% endif %}
								{% if ebit %}
									<div class="ebit">
										{{ ebit }}
									</div>
								{% endif %}
								{% if siteforte %}
									<div class="siteforte">
										{{ siteforte }}
									</div>
								{% endif %}								
							</div>
						</div>
					</div>
				</div>
				<div class="footer-bottom">
					<div class="container">
						<div class="row">
							<div class="col-md-6 copyright">
								<p class="text-left">{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}</p>
							</div>
							<div class="col-md-6 powered-by">
								<div style="float:right; margin-top:10px;">
								<a href="http://www.nuvemshop.com.br/partners/venda-e-cia" target="_blank">Powered by Nuvem Shop</a>
								<a href="http://www.vendaecia.com" target="_blank"><img src="http://vendaecia.com/images/logo.png" width="120"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
        {{ "//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js" | script_tag }}
        {{ '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' | script_tag }}
        {{ '//maps.google.com/maps/api/js?sensor=true' | script_tag }}
		{{ 'js/style.js' | static_url | script_tag }}
		<script type="text/javascript">
			function changeVariant(variant){

                $("#shipping-calculator-response").hide();
                $("#shipping-variant-id").val(variant.id);

		        var parent = $("body");
		        if (variant.element){
		            parent = $(variant.element);
		        }

		        var sku = parent.find('#sku');
		        if(sku.length) {
		            sku.text(variant.sku).show();
		        }

		        if (variant.price_short){
		            parent.find('#price_display').text(variant.price_short).show();
		        } else {
		            parent.find('#price_display').hide();
		        }

		        if (variant.compare_at_price_long){
		            parent.find('#compare_price_display').text(variant.compare_at_price_long).show();
		        } else {
		            parent.find('#compare_price_display').hide();
		        }
		        var button = parent.find('.addToCart');
				button.removeClass('cart').removeClass('contact').removeClass('nostock');
		        {% if not store.is_catalog %}
                var $shipping_calculator_form = $("#shipping-calculator-form");
				if (!variant.available){
					button.val('{{ settings.no_stock_text | escape('js') }}');
					button.addClass('nostock');
					button.attr('disabled', 'disabled');
                    $shipping_calculator_form.hide();
				} else if (variant.contact) {
					button.val('{{ "Consultar precio" | translate }}');
					button.addClass('contact');
					button.removeAttr('disabled');
                    $shipping_calculator_form.hide();
				} else {
					button.val('{{ "Agregar al carrito" | translate }}');
					button.addClass('cart');
					button.removeAttr('disabled');
                    $shipping_calculator_form.show();
				}
		        {% endif %}
			}
		</script>
		<script type="text/javascript">
			$(document).ready(function(){
                if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
                    $('select.on-steroids').removeClass('on-steroids');
                }

				$('#menu').supersubs({
					minWidth:    9,
					maxWidth:    40,
					extraWidth:  1.3
				}).superfish({
					autoArrows: false,
					dropShadows: false,
					speed: 'fast',
					delay: 200
				});
				{% if settings.fixed_menu %}
					$('#menu-fixed').supersubs({
						minWidth:    9,
						maxWidth:    40,
						extraWidth:  1.3
					}).superfish({
						autoArrows: false,
						dropShadows: false,
						speed: 'fast',
						delay: 200
					});
				{% endif %}
				$(".pagination li.disabled a").click(function(event) {
					event.preventDefault();
				});
                $(".contact-form").submit(function(){
                    if ($('input#winnie-pooh').val().length != 0){
                        return false;
                    }
                });

                {% if settings.fixed_menu %}
                var menu = $('.header-bar-main');
                var fixedMenu = $('.header-bar-fixed');
                var pos = menu.offset();

                $(window).scroll(function(){
                    if($(this).scrollTop() > pos.top + menu.height() && !fixedMenu.hasClass('fixed')){
                        fixedMenu.animate({top:'0'},200).addClass('fixed');
                    } else if($(this).scrollTop() <= pos.top && fixedMenu.hasClass('fixed')){
                        fixedMenu.animate({top:'-140px'},200,function(){
                            $(this).removeClass('fixed');
                        });
                    }
                });
                {% endif %}
                var bxslider = $('#slider').bxSlider({
                    auto: {% if settings.slider_auto and settings.slider | length > 1 %}true{% else %}false{% endif %},
                    pause: 5000,
                    autoHover: true,
                    adaptiveHeight: false,
                    prevText: '<i class="fa fa-angle-left"></i>',
                    nextText: '<i class="fa fa-angle-right"></i>',
                    pager: false
                });

                var $bx_controls = $(".bx-wrapper .bx-prev,.bx-wrapper .bx-next");
                $bx_controls.hide();
                $(".bx-wrapper")
                        .mouseover(function(){$bx_controls.toggle();})
                        .mouseout(function(){$bx_controls.toggle();});

                $(".direction-nav .next").click(function(e){
                    e.preventDefault();
                    var current = $(".mousetrap").prev().attr("href");
                    /*alert(current);
                     alert($("[href='" + current + "']").html());
                     $("a.cloud-zoom-gallery[href='" + current + "']").children("img").css("border","solid 1px red");*/
                    var tmp = $("a.cloud-zoom-gallery[href='" + current + "']").next();

                    if(tmp.length) {
                        tmp.click();
                    } else {
                        $("a.cloud-zoom-gallery:first-child").click();
                    }
                });
                $(".direction-nav .prev").click(function(e) {
                    e.preventDefault();
                    var current = $(".mousetrap").prev().attr("href");
                    var tmp = $("a.cloud-zoom-gallery[href='" + current + "']").prev();

                    if(tmp.length) {
                        tmp.click();
                    } else {
                        $("a.cloud-zoom-gallery:last-child").click();
                    }
                });

                $("#product_form").submit(function(e){
                    if($(this).find('input.contact').length) {
                        e.preventDefault();
                        window.location = "{{ store.contact_url | escape('js') }}?product=" + LS.product.id;
                    }
                });

                var $calculator = $("#shipping-calculator");
                var $loading = $calculator.find(".loading");
                $("#calculate-shipping-button").click(function () {
                    var params = {'cep': $("#shipping-cep").val()};
                    var variant = $("#shipping-variant-id");
                    if(variant.length) {
                        params['variant_id'] = variant.val();
                    }
                    $loading.show();
                    $("#invalid-cep").hide();
                    $.post('{{store.shipping_calculator_url | escape('js')}}', params, function (data) {
                        $loading.hide();
                        if (data.success) {
                            $("#shipping-calculator-response").html(data.html);
                            $("#shipping-calculator-form, #shipping-calculator-response").toggle();
                        } else {
                            $("#invalid-cep").show();
                        }
                    }, 'json');
                    return false;
                });
                $loading.hide();

                 $('.sort-by').change(function(){
                    var params = LS.urlParams;
                    params['sort_by'] = $(this).val();
                    var sort_params_array = [];
		            for (var key in params) {
		                if (key != 'results_only') {
		                    sort_params_array.push(key + '=' + params[key]);
		                }
		            }
                    var sort_params = sort_params_array.join('&');
                    window.location = window.location.pathname + '?' + sort_params;
                });

                $('#google-map').gmap3({
                    getlatlng:{
                        address: "{{ store.address | escape('js') }}",
                        callback: function(results) {
                            if ( !results ) return;
                            var store_location = results[0].geometry.location;
                            $('#google-map').gmap3({
                                map: {
                                    options: {
                                        zoom: 14,
                                        center: store_location
                                    }
                                },
                                marker: {
                                    address: "{{ store.address | escape('js') }}"
                                }
                            });
                        }
                    }
                });
			});
		</script>
		{% if settings.infinite_scrolling and (template == 'category' or template == 'search') %}
	    <script type="text/javascript">
	        $(function() {
	            new LS.infiniteScroll({
	                afterSetup: function() {
	                    $('.crumbPaginationContainer').hide();
	                },
	                productGridClass: 'product-grid',
	                productsPerPage:8,
	                bufferPx: 550,
	                loadingElement:'<div class="col-sm-12 text-center infinite-scroll-loading" style="margin-top:10px;"><i class="fa fa-refresh fa-2x fa-spin"></i></div>'
	            });
	        });
	    </script>
		{% endif %}
		{% if template == 'cart' %}
			<script type="text/javascript">
			    $(document).ready(function(){
			        $(".col-quantity input").keypress(function(){
                    	$('#change-quantities').removeClass("hidden");
			            {% if settings.cart_minimum_value %}
			                $(".go-to-checkout .cart-button").hide();
			            {% endif %}
			        });
			    });
			</script>
		{% endif %}
		{% if template == 'product' %}
		<script type="text/javascript">
			{% if settings.show_product_fb_comment_box %}
				window.fbAsyncInit = function() {
					FB.Event.subscribe('comment.create',
							function (response) {
								LS.commentNotify("{{store.fb_comment_url}}", {{product.id}}, response);
							});
				};
			{% endif %}
		</script>
		{% endif %}
		{{ social_js }}
		{% if store.live_chat %}
			<!-- begin olark code --><script type='text/javascript'>/*{literal}<![CDATA[*/
			window.olark||(function(c){var f=window,d=document,l=f.location.protocol=="https:"?"https:":"http:",z=c.name,r="load";var nt=function(){f[z]=function(){(a.s=a.s||[]).push(arguments)};var a=f[z]._={},q=c.methods.length;while(q--){(function(n){f[z][n]=function(){f[z]("call",n,arguments)}})(c.methods[q])}a.l=c.loader;a.i=nt;a.p={0:+new Date};a.P=function(u){a.p[u]=new Date-a.p[0]};function s(){a.P(r);f[z](r)}f.addEventListener?f.addEventListener(r,s,false):f.attachEvent("on"+r,s);var ld=function(){function p(hd){hd="head";return["<",hd,"></",hd,"><",i,' onl' + 'oad="var d=',g,";d.getElementsByTagName('head')[0].",j,"(d.",h,"('script')).",k,"='",l,"//",a.l,"'",'"',"></",i,">"].join("")}var i="body",m=d[i];if(!m){return setTimeout(ld,100)}a.P(1);var j="appendChild",h="createElement",k="src",n=d[h]("div"),v=n[j](d[h](z)),b=d[h]("iframe"),g="document",e="domain",o;n.style.display="none";m.insertBefore(n,m.firstChild).id=z;b.frameBorder="0";b.id=z+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){b.src="javascript:false"}b.allowTransparency="true";v[j](b);try{b.contentWindow[g].open()}catch(w){c[e]=d[e];o="javascript:var d="+g+".open();d.domain='"+d.domain+"';";b[k]=o+"void(0);"}try{var t=b.contentWindow[g];t.write(p());t.close()}catch(x){b[k]=o+'d.write("'+p().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}a.P(2)};ld()};nt()})({loader: "static.olark.com/jsclient/loader0.js",name:"olark",methods:["configure","extend","declare","identify"]});
			/* custom configuration goes here (www.olark.com/documentation) */
			olark.identify('{{store.live_chat | escape('js')}}');/*]]>{/literal}*/</script>
			<!-- end olark code -->
		{% endif %}
		{{ store.assorted_js | raw }}
    </body>
</html>
