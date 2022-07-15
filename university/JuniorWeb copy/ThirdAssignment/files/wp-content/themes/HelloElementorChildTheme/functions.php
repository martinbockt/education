<?php
/*Diese Datei ist ein Teil vonHelloElementorChildTheme, hello-elementor child theme.

Alle Funktionen dieser Datei werden vor den Funktionen des Eltern-Themes geladen.
Erfahre mehr unter https://codex.wordpress.org/Child_Themes.

Notiz: Diese Funktion lädt das Stylesheet des Eltern-Themes vor dem Stylesheet des Child-Themes
(Lass es an Ort und Stelle, es sei denn du weißt, was du tust.)
*/

if ( ! function_exists( 'suffice_child_enqueue_child_styles' ) ) {
	function HelloElementorChildTheme_enqueue_child_styles() {
	    // loading parent style
	    wp_register_style(
	      'parente2-style',
	      get_template_directory_uri() . '/style.css'
	    );

	    wp_enqueue_style( 'parente2-style' );
	    // loading child style
	    wp_register_style(
	      'childe2-style',
	      get_stylesheet_directory_uri() . '/style.css'
	    );
	    wp_enqueue_style( 'childe2-style');
	 }
}
add_action( 'wp_enqueue_scripts', 'HelloElementorChildTheme_enqueue_child_styles' );

/*Hier kannst du deine eigenen Funktionen schreiben */


/* Enqueue Javascript in /child-theme-s/includes/js/ */

function child_theme_s_scripts(){
 
 wp_enqueue_script('child-theme-s-js', get_stylesheet_directory_uri() . '/omu.js');
 
 }
 
add_action( 'wp_enqueue_scripts', 'child_theme_s_scripts' );



add_action( 'wp_enqueue_scripts', 'my_jquery' );
function my_jquery() {
  wp_enqueue_script( 'jquery' );
}


function custom_login_form_args( $login_form_args ) {
  $login_form_args['redirect'] = site_url( '/kurse/', is_ssl() ? 'https' : 'http' );
  return $login_form_args;
}

add_filter( 'learndash-login-form-args', 'custom_login_form_args' );


add_action( 'wp_head', function () { 
echo '<!-- Cookie Consent --><script type="application/javascript" src="https://app.usercentrics.eu/latest/main.js" id="A7FhhXKu4"></script>';
 }, 0 );


add_action( 'wp_head', function () { 
echo '<!-- Google Search Console --><meta name="google-site-verification" content="ieP3VWhRXKra8Lr0baa6FxAhdyzVo8CyLzucj124S4c" />';
 }, 0 );



