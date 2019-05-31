
function extend(obj, src) {
  Object.keys(src).forEach(function(key) { obj[key] = src[key]; });
  return obj;
}

function domReady(callback){
  if (
    document.readyState === "complete" || (document.readyState !== "loading" && !document.documentElement.doScroll))
      { callback }
  else {
    document.addEventListener("DOMContentLoaded", callback );
  }
}

var handleDates;
handleDates = (options) => {

  const defaults = {
    dateFormat: 'mm/dd/yy',
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
    'dateFormat': options.dateFormat
  });

  let datepair = datetime.datepair({
    defaultDateDelta: options.dateDelta,              // days
    defaultTimeDelta: options.timeDelta * 60 * 1000,  // hours -> milliseconds
    parseDate: (input) => {
      var val = $(input).datepicker('getDate');
      if (!val) {
        return null;
      }
      var utc = new Date(val);
      return utc && new Date(utc.getTime() + (utc.getTimezoneOffset() * 60000));
    },
    updateDate: (input, dateObj) => {
      $(input).datepicker('setDate', new Date(v.getTime() - (v.getTimezoneOffset() * 60000)));
    }
  });
};
