// init_refinery_admin();
// page_options.init(false);
(function init_tabs() {

  $(document).ready(function () {
    var tab_fields = $('#page-tabs');
    var page_parts = $("#page_part_editors").find('.page_part');
    tab_fields.tabs();
  })
})();
