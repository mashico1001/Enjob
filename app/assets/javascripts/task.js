$(function() {
  $(function() {
    setInterval(update, 60000);
  });
  
  function update() {
    $.ajax({
      url: location.href,
      type: 'GET',
      dataType: 'json'
    })
  }
});