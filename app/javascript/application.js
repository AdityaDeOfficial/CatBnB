// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
// fixes for map_controller.js error
// ran yarn add mapbox-gl
import mapboxgl from 'mapbox-gl';
// remove above To revert
// run yarn remove mapbox-gl
