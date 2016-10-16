jQuery(document).ready ->
  $('body').css("background", "#f2f2f2");

  # Dashbaord 모바일 최적화
  if $(window).width() <= 780
    currentPage = $('#action_name').val()
    $('#' + "mob-" + currentPage).hide()
    $('#only_mobile').removeAttr('href').css 'cursor', 'pointer'
    if $('#controller_name').val() == 'shows'
      $('#mob-manage').hide()
  else
    $('#only_mobile').hide()
