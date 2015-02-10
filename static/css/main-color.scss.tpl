//Background color
$bg-color: {{ settings.background_color }};

// Color primario
$primary-color: {{ settings.primary_color }};
// Variante clara color primario
$primary-light-color: lighten($primary-color, 30%);
// Variante oscura color primario
$primary-dark-color: darken($primary-color, 30%);

// Color secundario
$secondary-color: {{ settings.secondary_color }};
// Variante clara color secundario
$secondary-light-color: lighten($secondary-color, 30%);
// Variante oscura color secundario
$secondary-dark-color: darken($secondary-color, 30%);

// Color de texto por defecto
$text-primary-color: {{ settings.text_primary_color }};

// Color de texto secundario
$text-secondary-color: lighten($text-primary-color, 30%);

// Color de lineas
$line-color: {{ settings.line_color }};

// Tipografia principal
$main-font: {{ settings.main_font | raw }};
// Tipografia secundaria
$default-font: {{ settings.default_font | raw }};

@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
     -moz-border-radius: $radius;
      -ms-border-radius: $radius;
       -o-border-radius: $radius;
          border-radius: $radius;
}

@mixin cta-button($color, $height) {
	color: $bg-color;
	letter-spacing: 3px;
	font-weight: 900;
	font-size: 12px;
	text-transform: uppercase;
	height: $height;
	line-height: $height - 4;
	background-color: $color;
	border: none;
	border-bottom: 4px solid darken($color, 15);
	min-width: 210px;
	padding-left: 10px;
	padding-right: 10px;
	margin-top: 18px;
	margin-bottom: 18px;
	overflow: hidden;
	text-align: center;
	@include border-radius(10px);
	&:hover {
		height: $height - 4;
		line-height: $height - 4;
		margin-top: 22px;
		border-bottom: 0;
		color: $bg-color;
	}
}
@mixin cta-button-disabled($color, $height) {
	color: #fff;
	letter-spacing: 3px;
	font-weight: 900;
	font-size: 12px;
	text-transform: uppercase;
	height: $height;
	line-height: $height - 4;
	background-color: $color;
	border: none;
	border-bottom: 4px solid darken($color, 15);
	min-width: 210px;
	padding-left: 10px;
	padding-right: 10px;
	margin-top: 18px;
	margin-bottom: 18px;
	overflow: hidden;
	@include border-radius(10px);
}

%social-button {
	color: #fff;
	font-weight: 900;
	font-size: 12px;
	text-transform: uppercase;
	line-height: 40px;
	background-color: $line-color;
	border: none;
	border-bottom: 0;
	padding-left: 10px;
	padding-right: 10px;
	width: 44px;
	height: 40px;
	margin-top: 22px;
	margin-bottom: 18px;
	overflow: hidden;
	@include border-radius(10px);
	&:hover {
		margin-top: 18px;
		background-color: $primary-color;
		border-bottom: 4px solid darken($primary-color, 15);
		height: 44px;
		color:#fff;
	}
}

.social-button{
	@extend %social-button;
}

%default-text {
	color: $text-primary-color;
	font-family: $default-font;
	font-size: 16px;
	letter-spacing: 0;
	text-transform: none;
}

%very-small-text {
	@extend %default-text;
	color: $text-secondary-color;
	font-size: 13px;
}

%very-small-text-dark {
	@extend %very-small-text;
	color: $text-primary-color;
}

%small-text {
	@extend %very-small-text;
	font-size: 14px;
}

%small-text-dark {
	@extend %small-text;
	color: $text-primary-color;
}

%uppercase-text {
	@extend %default-text;
	text-transform: uppercase;
}

%bold-text {
	@extend %default-text;
	font-weight: bold;
}

%title-text {
	@extend %uppercase-text;
	@extend %bold-text;
	font-family: $main-font;
}

%main-title {
	@extend %title-text;
	font-size: 28px;
	letter-spacing: 2px;
}

%secondary-title {
	@extend %title-text;
	font-size: 18px;
	letter-spacing: 2px;
}

%main-menu-text {
	@extend %uppercase-text;
	font-size: 15px;
	letter-spacing: 0;
	&:hover {
		color: $primary-color;
	}
}

%link-text {
	color: $text-secondary-color;
	text-decoration: none;
}

/* ------------------ Bootstrap ------------------ */
body {
  color: $text-primary-color;
  background-color: $bg-color;
}
a {
  color: $text-secondary-color;
}
a:hover,
a:focus {
  color: $primary-color;
}
.img-thumbnail {
  background-color: $bg-color;
  border-color: $line-color;
}
hr {
  border-top-color: $line-color;
}
.text-primary {
  color: $primary-color;
}
a.text-primary:hover {
  color: $primary-dark-color;
}
.bg-primary {
  color: $bg-color;
  background-color: $primary-color;
}
a.bg-primary:hover {
  background-color: $primary-dark-color;
}
abbr[title],
abbr[data-original-title] {
  border-bottom-color: $line-color;
}
blockquote {
  border-left-color:$line-color;
}
blockquote footer,
blockquote small,
blockquote .small {
  color: $text-secondary-color;
}
.blockquote-reverse,
blockquote.pull-right {
  border-right-color: $line-color;
}
.table > thead > tr > th,
.table > tbody > tr > th,
.table > tfoot > tr > th,
.table > thead > tr > td,
.table > tbody > tr > td,
.table > tfoot > tr > td {
  border-top-color: $line-color;
}
.table > thead > tr > th {
  border-bottom-color: $line-color;
}
.table > tbody + tbody {
  border-top-color: $line-color;
}
.table .table {
  background-color: $bg-color;
}
.table-bordered {
  border-color: $line-color;
}
.table-bordered > thead > tr > th,
.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th,
.table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td,
.table-bordered > tfoot > tr > td {
  border-color: $line-color;
}
.table-striped > tbody > tr:nth-child(odd) > td,
.table-striped > tbody > tr:nth-child(odd) > th {
  background-color: darken($bg-color, 5%);
}
.table-hover > tbody > tr:hover > td,
.table-hover > tbody > tr:hover > th {
  background-color: darken($bg-color, 8%);
}
.table > thead > tr > td.active,
.table > tbody > tr > td.active,
.table > tfoot > tr > td.active,
.table > thead > tr > th.active,
.table > tbody > tr > th.active,
.table > tfoot > tr > th.active,
.table > thead > tr.active > td,
.table > tbody > tr.active > td,
.table > tfoot > tr.active > td,
.table > thead > tr.active > th,
.table > tbody > tr.active > th,
.table > tfoot > tr.active > th {
  background-color: darken($bg-color, 12%);
}
.table-hover > tbody > tr > td.active:hover,
.table-hover > tbody > tr > th.active:hover,
.table-hover > tbody > tr.active:hover > td,
.table-hover > tbody > tr.active:hover > th {
  background-color: darken($bg-color, 15%);
}
@media (max-width: 767px) {
  .table-responsive {
    border-color: $line-color;
  }
}
.form-control {
  color: $text-secondary-color;
  background-color: $bg-color;
  border-color: $line-color;
}
.btn:hover,
.btn:focus {
  color: $text-primary-color;
}
.btn-default {
  color: $text-primary-color;
  background-color: $bg-color;
  border-color: $line-color;
}
.btn-default:hover,
.btn-default:focus,
.btn-default:active,
.btn-default.active,
.open .dropdown-toggle.btn-default {
  color: $text-primary-color;
  background-color: darken($bg-color, 15%);
  border-color: $line-color;
}
.btn-default.disabled,
.btn-default[disabled],
fieldset[disabled] .btn-default,
.btn-default.disabled:hover,
.btn-default[disabled]:hover,
fieldset[disabled] .btn-default:hover,
.btn-default.disabled:focus,
.btn-default[disabled]:focus,
fieldset[disabled] .btn-default:focus,
.btn-default.disabled:active,
.btn-default[disabled]:active,
fieldset[disabled] .btn-default:active,
.btn-default.disabled.active,
.btn-default[disabled].active,
fieldset[disabled] .btn-default.active {
  background-color: $bg-color;
  border-color: $line-color;
}
.dropdown-menu {
  background-color: $bg-color;
  border-color: $line-color;
}
.dropdown-menu .divider {
  background-color: darken($bg-color, 15%);
}
.dropdown-menu > li > a {
  color: $text-primary-color;
}
.dropdown-menu > li > a:hover,
.dropdown-menu > li > a:focus {
  color: $text-primary-color;
  background-color: darken($bg-color, 10%);
}
.dropdown-menu > .active > a,
.dropdown-menu > .active > a:hover,
.dropdown-menu > .active > a:focus {
  color: #fff;
  background-color: $primary-color;
  outline: 0;
}

/* ------------------ End Bootstrap ------------------ */

html,
body,
h1,
h2,
h3,
h4,
h5,
h6,
a,
p,
span {
	@extend %default-text;
}
h1,
h2,
h3,
h4,
h5,
h6 {
	@extend %title-text;
}
h1 {
	@extend %main-title;
}
h2 {
	@extend %secondary-title;
}
h3 {
	@extend %title-text;
}
a {
	@extend %link-text;
	&:hover {
		color: $primary-color;
		text-decoration: none;
	}
}
#no-logo{
	color: $primary-color;
	@extend %uppercase-text;
	@extend %bold-text;
	font-size: 20px;
}
.header-bar-fixed #no-logo{
	font-size: 16px;
}
/* Header */
.header-bar-top {
	border-bottom: 1px solid $line-color;
}
.header-bar-top a {
	@extend %very-small-text;
}
.header-bar-top p {
	@extend %very-small-text;
}
.header-bar-top span {
	@extend %very-small-text;
}
.header-bar {
	background: $bg-color;
	-webkit-box-shadow: 0 2px 2px 0 rgba(50, 50, 50, 0.15);
	-moz-box-shadow:    0 2px 2px 0 rgba(50, 50, 50, 0.15);
	box-shadow: 0 2px 2px 0 rgba(50, 50, 50, 0.15);
}
.header-bar-fixed{
	background: $bg-color;
}
/* Menu principal */
.sf-menu ul{
	box-shadow:0 6px 12px rgba(0,0,0,.175);
	-webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
	-moz-box-shadow:0 6px 12px rgba(0,0,0,.175);
}
.sf-menu li a {
	@extend %main-menu-text;
	font-weight: 400;
}
.sf-menu ul li a {
	@extend %main-menu-text;
	text-transform: none;
	&:hover {
		color: #fff;
	}
}
.sf-menu ul li.sfHover > a {
	color: #fff;
}
.sf-menu li.selected > a {
	color: $primary-color;
}
.sf-menu ul li {
	background: $bg-color;
	border-bottom: 1px solid $line-color;
	border-left: 1px solid $line-color;
	border-right: 1px solid $line-color;
	&:hover {
		background: $primary-color;
	}
}
.sf-menu ul li.first {
	border-top: 1px solid $line-color;
}
.sf-menu ul li.sfHover .arrow i{
	color:#fff;
}
nav.mobile select {
	border-color:$line-color;
	background-color:$bg-color;
}

/* Search Box */
.searchbox .text-input {
	@extend %very-small-text;
}
.searchbox .submit-button i{
	color:$text-secondary-color;
}
.form-control {
	border: 1px solid $line-color;
	@extend %small-text;
}
/* Shopping cart */
.img_icon_cart i{
	color: $text-primary-color;
}
.img_icon_cart_fixed i{
	color: $text-primary-color;
}
.cart-summary .cart-circle,
.cart-summary-fixed .cart-circle {
	font-weight: bold;
	background: $secondary-color;
	color: #fff;
	font-size: 11px;
}
.cart-summary span,
.cart-summary-fixed span {
	font-size: 12px;
	color: $text-secondary-color;
}
.cart-detail th {
	@extend %uppercase-text;
	font-size: 12px;
}
.cart-detail tr {
	border-bottom: 1px solid $line-color;
}
.cart-detail h2 a {
	@extend h2;
}
.cart-detail .unit-price,
.cart-detail .subtotal,
.cart-detail-totals p {
	@extend h2;
	font-weight: normal;
}
.cart-detail-totals p {
	span {
		font-size: 30px;
		font-weight: bold;
		color: $primary-color;
		letter-spacing: 0;
	}
}
.cart-detail .col-quantity input {
	font-size: 18px;
}
.cart-detail-totals .cart-detail-shipping {
	border-top-color: $line-color;
	border-bottom-color: $line-color;
}
.cart-detail-totals .cart-detail-shipping p {
	@extend %default-text;
}

/* Breadcrumbs */
.breadcrumb-custom,
.breadcrumb-custom span,
.breadcrumb-custom a {
	@extend %very-small-text-dark;
	color:$text-secondary-color;
}
.cart-detail-shipping #invalid-cep{
	color: $secondary-color;
}
.shipping-list li label:hover{
	background-color: darken($bg-color, 8%);
	@include border-radius(5px);
}

/* Titulos de secciones */
.section-title fieldset{
	border-top: 1px solid $line-color;
}

/* Precios */
.price {
	@extend %secondary-title;
	color: $primary-color;
	font-weight: 900;
}
.old-price {
	@extend %title-text;
	letter-spacing: 0;
	color: $secondary-color;
	font-size: 16px;
	text-decoration: line-through;
}
.big-price {
	@extend .price;
	font-size: 36px;
	letter-spacing: 0;
}
.big-old-price {
	@extend .old-price;
	font-size: 18px;
	letter-spacing: 0;
}
/* Botones */
.product-related-button {
	@include cta-button($secondary-color, 44px);
}
a.product-related-button:hover {
    color: $bg-color;
}
.big-product-related-button {
	@include cta-button($secondary-color, 55px);
	width: 50%;
	float: right;
}
.big-product-related-button.nostock {
	@include cta-button-disabled($secondary-light-color, 55px);
	width: 100%;
}
.cart-button {
	@include cta-button($secondary-color, 60px);
}
.cart-general-button {
	@include cta-button($primary-color, 60px);
}
.general-button {
	color: white;
letter-spacing: 3px;
font-weight: 900;
font-size: 12px;
text-transform: uppercase;
height: 44px;
line-height: 40px;
background-color: #ebc736;
border: none;
border-bottom: 4px solid #b79714;
min-width: 210px;
padding-left: 10px;
padding-right: 10px;
margin-top: 18px;
margin-bottom: 18px;
overflow: hidden;
text-align: center;
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
-ms-border-radius: 10px;
-o-border-radius: 10px;
border-radius: 10px;
}

/* Product Box */
.grid a {
	color: $text-primary-color;
}
.grid svg.white path {
	fill: $bg-color;
}

.grid svg.blue path {
	fill: $primary-color;
}

.pills div {
	@extend %uppercase-text;
	font-size: 11px;
	color: $bg-color;
	-webkit-box-shadow: 1px 1px 2px 0 rgba(50, 50, 50, 0.30);
	-moz-box-shadow:    1px 1px 2px 0 rgba(50, 50, 50, 0.30);
	box-shadow:         1px 1px 2px 0 rgba(50, 50, 50, 0.30);
	text-align:center;
}

.pills .offer-pill {
	background: $secondary-color;
}
.pills .stock-pill {
	background: $primary-color;
}

.pills .free-shipping-pill {
	background: $primary-dark-color;
}

.grid figure {
	background-color: $primary-color;
}

/* Product variants */
.variant-container {
	border-top: 1px solid $line-color;
}
.variant-container .variant {
	border-bottom: 1px solid $line-color;
}
.variant-container .variant h3 {
	font-size: 14px;
}
.variant-container .variant select {
	font-size: 18px;
}
.custom-select select {
	background-color: $bg-color;
}
#shipping-calculator {
	border-top: 1px solid $line-color;
	border-bottom: 1px solid $line-color;
}
/* Footer */
.footer {
	background: $bg-color;
	.footer-main {
		border-bottom: 1px solid $line-color;
		@extend %small-text;
		ul a {
			@extend %small-text;
				&:hover {
				color: $primary-color;
				text-decoration: none;
			}
		}
	}
	.footer-bottom p {
		@extend %very-small-text-dark;
	}
	.footer-bottom p a {
		@extend %small-text-dark;
	}
}
.footer-contact li i{
	color:$text-primary-color;
}

/* Contact */
ul.contact-info li {
	@extend %small-text;
	a {
		@extend %small-text;
		&:hover {
			color: $primary-color;
			text-decoration: none;
		}
	}
}
.contact-info li i{
	color:$text-primary-color;
}
#google-map {
	border-color: $line-color;
}
.bg-danger,
.bg-success,
.bg-info {
	font-size: 13px;
}
.bg-danger {
	border: 1px solid #a94442;
}
.bg-success {
	border: 1px solid #3c763d;
}
.bg-info {
	border: 1px solid #0053cd;
}
.bg-info a {
	@extend %secondary-title;
}

/* Search results */
.search-no-result {
	@extend %bold-text;
	color: $secondary-color;
}

/* 404 */
.box-404{
	@include border-radius(200px);
	border: dashed $secondary-color 5px;
}
.text-404 {
	@extend %bold-text;
	font-size:150px;
}
.text-oops {
	@extend %bold-text;
	font-size:40px;
}

/* Pagination */
.pagination>li>a,
.pagination>li>span {
	color: $text-primary-color;
}

.pagination>li>a:hover,
.pagination>li>span:hover,
.pagination>li>a:focus,
.pagination>li>span:focus {
	color: $text-primary-color;
	background-color: darken($bg-color, 10%);
	border-color: $line-color;
}

.pagination>.active>a,
.pagination>.active>span,
.pagination>.active>a:hover,
.pagination>.active>span:hover,
.pagination>.active>a:focus,
.pagination>.active>span:focus {
	color: $text-primary-color;
	background-color: lighten($primary-color, 50%);
	border-color: $line-color;
}
.cloud-zoom-loading {
	background:$bg-color;
	color:$text-primary-color;
	@include border-radius(5px);
}

.pattern-background{
    background-image: url( "{{ ("img/tramas/" ~ settings.background_pattern ~ ".png") | static_url }}" );
}
.user-background{
    background-image: url( "{{ ("default-background.jpg") | static_url }}" );
}

/* Slider */
#slider {
    position:relative;
    background-color:$bg-color;
}

/**
* BxSlider v4.1.2 - Fully loaded, responsive content slider
* http://bxslider.com
*
* Written by: Steven Wanderski, 2014
* http://stevenwanderski.com
* (while drinking Belgian ales and listening to jazz)
*
* CEO and founder of bxCreative, LTD
* http://bxcreative.com
*/


/** RESET AND LAYOUT
===================================*/

.bx-wrapper {
    position: relative;
    margin: 0 auto 60px;
    padding: 0;
    *zoom: 1;
}

.bx-wrapper img {
    max-width: 100%;
    display: block;
    width: 100%;
}

/** THEME
===================================*/

.bx-wrapper .bx-viewport {
    /*fix other elements on the page moving (on Chrome)*/
    -webkit-transform: translatez(0);
    -moz-transform: translatez(0);
    -ms-transform: translatez(0);
    -o-transform: translatez(0);
    transform: translatez(0);
}

.bx-wrapper .bx-pager,
.bx-wrapper .bx-controls-auto {
    position: absolute;
    bottom: -30px;
    width: 100%;
}

/* LOADER */

.bx-wrapper .bx-loading {
    min-height: 50px;
    background: url(images/bx_loader.gif) center center no-repeat #fff;
    height: 100%;
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 2000;
}

/* PAGER */

.bx-wrapper .bx-pager {
    text-align: center;
    font-size: .85em;
    font-family: Arial;
    font-weight: bold;
    color: #666;
    padding-top: 20px;
}

.bx-wrapper .bx-pager .bx-pager-item,
.bx-wrapper .bx-controls-auto .bx-controls-auto-item {
    display: inline-block;
    *zoom: 1;
    *display: inline;
}

.bx-wrapper .bx-pager.bx-default-pager a {
    background: #666;
    text-indent: -9999px;
    display: block;
    width: 10px;
    height: 10px;
    margin: 0 5px;
    outline: 0;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
}

.bx-wrapper .bx-pager.bx-default-pager a:hover,
.bx-wrapper .bx-pager.bx-default-pager a.active {
    background: #000;
}

/* DIRECTION CONTROLS (NEXT / PREV) */

.bx-wrapper .bx-prev {
    left: 10px;
    background: url(images/controls.png) no-repeat 0 -32px;
}

.bx-wrapper .bx-next {
    right: 10px;
    background: url(images/controls.png) no-repeat -43px -32px;
}

.bx-wrapper .bx-prev:hover {
    background-position: 0 0;
}

.bx-wrapper .bx-next:hover {
    background-position: -43px 0;
}

.bx-wrapper .bx-controls-direction a {
    position: absolute;
    top: 50%;
    margin-top: -16px;
    outline: 0;
    width: 32px;
    height: 32px;
    z-index: 9999;
}

.bx-wrapper .bx-controls-direction a i {
    font-size: 6em;
}

.bx-wrapper .bx-controls-direction a.disabled {
    display: none;
}

/* AUTO CONTROLS (START / STOP) */

.bx-wrapper .bx-controls-auto {
    text-align: center;
}

.bx-wrapper .bx-controls-auto .bx-start {
    display: block;
    text-indent: -9999px;
    width: 10px;
    height: 11px;
    outline: 0;
    background: url(images/controls.png) -86px -11px no-repeat;
    margin: 0 3px;
}

.bx-wrapper .bx-controls-auto .bx-start:hover,
.bx-wrapper .bx-controls-auto .bx-start.active {
    background-position: -86px 0;
}

.bx-wrapper .bx-controls-auto .bx-stop {
    display: block;
    text-indent: -9999px;
    width: 9px;
    height: 11px;
    outline: 0;
    background: url(images/controls.png) -86px -44px no-repeat;
    margin: 0 3px;
}

.bx-wrapper .bx-controls-auto .bx-stop:hover,
.bx-wrapper .bx-controls-auto .bx-stop.active {
    background-position: -86px -33px;
}

/* PAGER WITH AUTO-CONTROLS HYBRID LAYOUT */

.bx-wrapper .bx-controls.bx-has-controls-auto.bx-has-pager .bx-pager {
text-align: left;
width: 80%;
}

.bx-wrapper .bx-controls.bx-has-controls-auto.bx-has-pager .bx-controls-auto {
    right: 0;
    width: 35px;
}

/* IMAGE CAPTIONS */

.bx-wrapper .bx-caption {
    position: absolute;
    bottom: 0;
    left: 0;
    background: #666\9;
    background: rgba(80, 80, 80, 0.75);
    width: 100%;
}

.bx-wrapper .bx-caption span {
    color: #fff;
    font-family: Arial;
    display: block;
    font-size: .85em;
    padding: 10px;
}

.bx-wrapper .bx-controls-direction a {
    position:absolute;
    width: 60px;
    height: 60px;
    cursor:pointer;
    margin-top: -30px;
    top: 50%;
}

.bx-wrapper .bx-prev {
    margin-left: 20px;
    left:0;
}
.bx-wrapper .bx-next {
    right: 0;
    margin-right: 20px
}

.bx-wrapper .bx-controls-direction a {
    border:0;
    text-align: center;
    -webkit-transition: all 200ms ease-in-out;
    -moz-transition: all 200ms ease-in-out;
    -o-transition: all 200ms ease-in-out;
    transition: all 200ms ease-in-out;
}

.bx-wrapper .bx-controls-direction a i{
    margin-top: 6px;
}
.bx-wrapper .bx-controls-direction a { opacity: 1; }