( function ( $, undefined ) {
  var C_PAGINATION_LABEL = ".a-IRR-pagination-label"
    , C_MAX_ROWS         = 1
    , C_ROWS_FETCHED     = 1;
  /** @purpose retrieve the current min row of an IR by parsing the pagination label of an "X - Y" or X - Y of Z" scheme.
    * @param uiw the widget instance
    */
  function getCurrentRow (uiw) {
    var currentText = $(C_PAGINATION_LABEL, uiw.element).text()
      , currentMinRow = currentText.substring(0, currentText.indexOf("-")).trim();
    return currentMinRow;
  };
  
  /** @purpose constructs the pagination strings as apex expects
    * @param pMinRow the row from which to start the page
    * @param pMaxRows irrelevant - this is not used by apex
    * @param pRowsFetched irrelevant - this is not used by apex
    */
  function constructPaginationString ( pMinRow, pMaxRows, pRowsFetched ) {
    return "pgR_min_row="+pMinRow+"max_rows="+pMaxRows+"rows_fetched="+pRowsFetched;
  };      
  
  $.widget("apex.interactiveReport", $.apex.interactiveReport, {
    /** @purpose refresh the interactive report
      * @param pMaintainPagination set to true to preserve pagination. Set to false or blank for regular refresh
      */
    refresh: function ( pMaintainPagination ) {
      var uiw = this;
      if ( pMaintainPagination ) {
        uiw._paginate(constructPaginationString(getCurrentRow(uiw), C_MAX_ROWS, C_ROWS_FETCHED));    
      } else {
        uiw._super();
      }
    }
  });
})( apex.jQuery );