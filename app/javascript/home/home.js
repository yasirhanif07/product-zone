$(document).on('turbolinks:load', function() {
    $("#search").on("keyup", function(e) {
    var key = e.keyCode || e.charCode;
    var input_result = this.value;
    if ((key == 8 || key == 46) && (input_result.length == 0)){
        $.ajax ({
            type: "GET",
            data: { remove_results: true },
            url: '/home/search_product'
        });
    }
    });
});