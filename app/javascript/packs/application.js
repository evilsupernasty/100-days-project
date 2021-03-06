/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Rails from 'rails-ujs';
import Turbolinks from 'turbolinks';
import forms from '../scripts/forms';
import newUserTimezone from '../scripts/new_user_timezone';
import '../stylesheets/application';

Rails.start();
Turbolinks.start();

function ready() {
  newUserTimezone();
  forms();
}

document.addEventListener('turbolinks:load', ready);
