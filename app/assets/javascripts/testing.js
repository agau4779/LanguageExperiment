$(document).ready(function() {
  // User Entry Testing
  $('.iterative-chains-testing').each(function() {
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

      // Show next image file
      $('.next').on("click", function() {
        $('.selected').closest('.choice').toggleClass('already-selected')
        $('.img-wrapper.testing input.sound').attr('value', $('.selected')[0].value)
        $('.selected').toggleClass('selected');
        $('.testing').toggleClass('testing').toggleClass('show').next().toggleClass('testing').toggleClass('show')
        $('.next').hide();
        if($('.testing').length == 0) {
          $("input[type='submit']").show();
        }
      });
    });
    // END Sem to Phone

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
        $('.selected').closest('.choice').toggleClass('already-selected')
        $('.audio-wrapper.testing input.image').attr('value', $('.selected')[0].value)
        $('.selected').toggleClass('selected');
        $('.testing').toggleClass('testing').next().toggleClass('testing')
        $('.testing audio')[0].load();
        $('.testing audio')[0].play();
        $('.next').hide();
        if($('.testing').length == 0) {
          $("input[type='submit']").show();
        }
      });
    });
    // END Phone to sem
    
  });
  // END User Entry Testing
  
});