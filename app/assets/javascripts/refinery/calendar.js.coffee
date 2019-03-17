jQuery ->
# initialize input widgets first
  $('.datetimepicker .time').timepicker({
    'showDuration': true,
    'timeFormat': 'g:ia'
  })

  $('.datetimepicker .date').datepicker({
    'format': 'd/m/yyyy',
    'autoclose': true
  })

  # initialize datepair
  $('.start_and_end').datepair();
