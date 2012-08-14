$(document).ready(function()
{
// Popover 
$('#registerHere input').hover(function()
{
$(this).popover('show')
});
//Slider

// Slideshow 3
      $("#slider1").responsiveSlides({
        auto: true,
        pager: false,
        nav: true,
        speed: 500,
        namespace: "callbacks",
        before: function () {
          $('.events').append("<li>before event fired.</li>");
        },
        after: function () {
          $('.events').append("<li>after event fired.</li>");
        }
      });

});