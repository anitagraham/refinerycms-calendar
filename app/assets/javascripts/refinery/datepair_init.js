
function extend(obj, src) {
  Object.keys(src).forEach(function(key) { obj[key] = src[key]; });
  return obj;
}

 const handleDates = (options) => {

   const defaults = {
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
     dateFormat: options.dateFormat,
     autoclose: true
   });

   let datepair = datetime.datepair({
     defaultDateDelta: options.dateDelta,         // days
     defaultTimeDelta: options.timeDelta*60*1000,  // hours -> milliseconds
     parseDate: (input) => {
       return $(input).datepicker('getDate');

     },
     updateDate: (input, dateObj) => {
       return $(input).datepicker('setDate', dateObj);
     }
   });
 };
