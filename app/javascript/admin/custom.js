$(document).on('turbolinks:load', function() {
  $('select').select2();

  // fadeout error messages after 5 seconds
  if ($('.alert')){
    $(".alert" ).fadeOut(5000);
  }

  $('body').on("change", ".select_category", function() {
    load_subcategories(this.value)
  });

  $('body').on("change", ".select_subcategory", function() {
    load_brands(this.value)
  });
});

function load_subcategories(category) {
  if (category) {
    $.ajax ({
      type: "GET",
      url: '/admin/categories/'+category+'/load_subcategories'
    });
  }
}

function load_brands(subcategory) {
  if (subcategory) {
    $.ajax ({
      type: "GET",
      url: '/admin/subcategories/'+subcategory+'/load_brands'
    });
  }
}

