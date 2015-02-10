{% if settings.slider %}
<div class="slider-shadow"></div>
<div class="slider-wrapper theme-default">
	<ul id="slider">
        {% for slide in settings.slider %}
            <li>
                {% set slide_img = slide.image | static_url %}
                {% if slide.link is empty %}
                    <img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" />
                {% else %}
                    <a href="{{ slide.link }}"><img src="{{ slide_img }}" data-thumb="{{ slide_img }}" alt="" /></a>
                {% endif %}
            </li>
        {% endfor %}
	</ul>
</div>
{% endif %}

<div class="container">
<div class="wrapper">
    <div id="banner01">
        <a href="{{ item.url | default('http://hlorganizadores.nuvemshop.com.br/organizadores/') }}">{{ "organizadores-cat.jpg" | static_url | img_tag("Texto alternativo da imagem") }} </a>
    </div>
    <div id="banner02">
        <a href="{{ item.url | default('http://hlorganizadores.nuvemshop.com.br/armarios-e-closets/') }}">{{ "armarios-cat.jpg" | static_url | img_tag("Texto alternativo da imagem") }} </a>
    </div>
    <div id="banner03">
        <a href="{{ item.url | default('http://hlorganizadores.nuvemshop.com.br/cozinha/') }}">{{ "cozinha-cat.jpg" | static_url | img_tag("Texto alternativo da imagem") }} </a>
    </div>
    <div class="bannersbox">
        <div id="banner04">
            <a href="{{ item.url | default('http://hlorganizadores.nuvemshop.com.br/utilidades/') }}">{{ "utilidades-cat.jpg" | static_url | img_tag("Texto alternativo da imagem") }} </a>
        </div>
        <div id="banner05">
            <a href="{{ item.url | default('http://hlorganizadores.nuvemshop.com.br/veiculos/') }}">{{ "veiculos-cat.jpg" | static_url | img_tag("Texto alternativo da imagem") }} </a>
        </div>
    </div>
    <div id="banner06">
        <a href="{{ item.url | default('http://hlorganizadores.nuvemshop.com.br/infantil/') }}">{{ "infantil-cat.jpg" | static_url | img_tag("Texto alternativo da imagem") }} </a>
    </div>
    <div id="banner07">
        <a href="{{ item.url | default('http://hlorganizadores.nuvemshop.com.br/viagens/') }}">{{ "viagens-cat.jpg" | static_url | img_tag("Texto alternativo da imagem") }} </a>
    </div>
    <div id="banner08">
        <a href="{{ item.url | default('#') }}">{{ "cupom.jpg" | static_url | img_tag("Texto alternativo da imagem") }} </a>
    </div>
</div>
    
    
    
	<div class="row">
		{% set blocksCount = 1%}
		{% if settings.show_footer_fb_like_box and store.facebook %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		{% if settings.twitter_widget %}
			{% set blocksCount = blocksCount + 1 %}
		{% endif %}
		{% if blocksCount == 1 %}
		<div class="col-md-12">
		{% elseif blocksCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-4" style="float: right; margin-top: 45px;">
		{% endif%}
        
        
			<div class="section-title">
				<fieldset><legend><h2>{{"Nuestro Newsletter" | translate}}</h2></legend></fieldset>
			</div>
			{% snipplet "newsletter.tpl" %}
		</div>
		{% if settings.show_footer_fb_like_box and store.facebook %}
		{% if blocksCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-4">
		{% endif%}
			<div class="section-title">
				<fieldset><legend><h2>{{"Estamos en Facebook" | translate}}</h2></legend></fieldset>
			</div>
			<div style="margin:10px 0" class="fb-like-box" data-href="{{ store.facebook }}" data-height="340" data-show-faces="true" data-stream="false" data-show-border="false" data-header="false" data-width="100%"></div>
		</div>
		{% endif %}
		{% if settings.twitter_widget %}
		{% if blocksCount == 2 %}
		<div class="col-md-6">
		{% else %}
		<div class="col-md-4">
		{% endif%}
			<div class="section-title">
				<fieldset><legend><h2>{{"Estamos en Twitter" | translate}}</h2></legend></fieldset>
			</div>
				<iframe src="http://snapwidget.com/sl/?u=aGxvcmdhbml6YWRvcmVzfGlufDM2MHwzfDN8fG5vfDV8bm9uZXxvblN0YXJ0fHllc3xubw==&ve=290115" title="Instagram Widget" class="snapwidget-widget" allowTransparency="true" frameborder="0" scrolling="no" style="border:none; overflow:hidden; width:365px; height:365px"></iframe>
		</div>
		{% endif %}
	</div>
</div>
