$(document).ready(function() {
  // Training
  $('.training').each(function() {
    console.log("User Entry Training")
    var count = 0;
    var stimuli = $(".training-stimulus");
    var interval_1 = setInterval("cycleThroughStimuli()", 2000);

    cycleThroughStimuli = function() {
      stimuli.each(function() {
        $(this).removeClass("show")
      })

      if (count < stimuli.length) {
        $(stimuli[count]).addClass("show");
        stimuli[count].getElementsByTagName("audio")[0].play();
        count++;
      } else {
        interval_1 = window.clearInterval(interval_1);
      }
    }
  });
});
