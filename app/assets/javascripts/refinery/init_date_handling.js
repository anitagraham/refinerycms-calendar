
function extend(obj, src) {
  Object.keys(src).forEach(function(key) { obj[key] = src[key]; });
  return obj;
}

var handleDates;
handleDates = (options) => {

  const defaults = {
    dateFormat: 'd MM, yy',
    timeFormat: 'g:ia',
    dateDelta: 0,
    timeDelta: '30'
  };

  options = extend(defaults, options);

  let datetime = $('#datetime');

  datetime.find('.time').timepicker({
    'showDuration': true,
    'timeFormat': options.timeFormat
  });

  datetime.find('.date').datepicker({
    'autoclose': true,
    'format': options.dateFormat
  });

  let datepair = datetime.datepair({
    defaultDateDelta: options.dateDelta,         // days
    defaultTimeDelta: options.timeDelta * 60 * 1000,  // hours -> milliseconds
    parseDate: (input) => {
      return $(input).datepicker('getDate');

    },
    updateDate: (input, dateObj) => {
      return $(input).datepicker('setDate', dateObj);
    }
  });
};
