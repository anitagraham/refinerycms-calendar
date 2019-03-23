 $(document).ready(function () {
    // initialize input widgets first

    var datetime = $('#datetime');
    datetime.find('.time').timepicker({
      'showDuration': true,
      'timeFormat': 'g:ia'
    });

    datetime.find('.date').datepicker(
      {
        format: 'dd/mm/yyyy',
        autoclose: true
      }
    );

// initialize datepair
    datetime.datepair({
      defaultDateDelta: 0,
      defaultTimeDelta: 10800000    // 3 hours
    })
});
