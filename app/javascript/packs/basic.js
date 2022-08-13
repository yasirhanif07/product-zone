import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import $ from 'jquery';
import "@fortawesome/fontawesome-free/css/all";
import "@fortawesome/fontawesome-free/js/all";

require('jquery')

window.$ = window.jQuery = $;

Rails.start()
Turbolinks.start()
ActiveStorage.start()
