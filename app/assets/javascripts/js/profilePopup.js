$(document).ready(function(){
  $('#popover1').popover({
      html : true,
      content: function() {
        return $("#popover-content1").html();
      }
  });
  $('#popover2').popover({
      html : true,
      content: function() {
        return $("#popover-content2").html();
      }
  });
})
