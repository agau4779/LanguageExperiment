$(document).ready(function() {
  // User Entry Testing
  $('.testing').each(function() {
    console.log("User Entry Testing")

    $(".choices-wrapper input[type='radio']").on("click", function() {
      $('.selected').toggleClass('selected');
      $(this).toggleClass('selected');
      $('.next').show();
    });
    
    // Sem to Phone
    $('.sem-to-phone').each(function() {
      $('.play').on("click", function() {
        $(this).next()[0].load();
        $(this).next()[0].play();
      });

      // Select next audio file and play it
      $('.next').on("click", function() {
        $('.selected').closest('.choice').css('visibility', 'hidden')
        $('.selected').toggleClass('selected');
        $('.testing').toggleClass('testing').toggleClass('show').next().toggleClass('testing').toggleClass('show')
        $('.next').hide();
      });
    });

    // Phone to sem
    $('.phone-to-sem').each(function() {

      // Play once initially
      $('.testing audio')[0].play();

      // Enable button to play word again
      $('.play-again').on("click", function() {
        // console.log("Play")
        $('.testing audio')[0].load();
        $('.testing audio')[0].play();
      });

      // Select next audio file and play it
      $('.next').on("click", function() {
        $('.selected').closest('.choice').css('visibility', 'hidden')
        $('.selected').toggleClass('selected');
        $('.testing').toggleClass('testing').next().toggleClass('testing')
        $('.testing audio')[0].load();
        $('.testing audio')[0].play();
        $('.next').hide();
      });
    });
  });
});