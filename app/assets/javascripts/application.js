// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
  $(".open-new-form-container").click(function(e){
    e.preventDefault();
    $(".new-form-container").show();
    $(this).hide();
  });

  $(".close-new-form-container").click(function(e){
    e.preventDefault();
    $(".new-form-container").hide();
    $(".open-new-form-container").show();
  });

  $(".submit-button").click(function(e){
    e.preventDefault();
    var valid = true;
    $(".required").next().each(function(index, field){
      field = $(field);
      if(field.val() == ""){
        valid = false;
        field.parent().addClass("has-error");
        field.parent().removeClass("has-success");
      } else {
        field.parent().addClass("has-success");
        field.parent().removeClass("has-error");
      }
    });
    if(($(".required-check").size() > 0) && ($(".required-check:checked").size() == 0)){
      valid = false;
      $(".checkbox-required-alert").addClass("has-error");
      $(".checkbox-required-alert").removeClass("has-success");
    } else {
      $(".checkbox-required-alert").addClass("has-success");
      $(".checkbox-required-alert").removeClass("has-error");
    }
    if(valid){
      $('form').submit();
    } else {
      alert("Houveram erros no formulário. Por favor revise-o.");
    }
  });
});