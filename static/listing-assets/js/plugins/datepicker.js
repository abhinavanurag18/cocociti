var Datepicker = function () {

    return {
        
        //Datepickers
        initDatepicker: function () {
	        // Regular datepicker
	        $('#date').datepicker({
	            dateFormat: 'dd.mm.yy',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>'
	        });
	        
	        // Date range
	        var start;
	        var finish;
	        $('#start').datepicker({
	            dateFormat: 'dd.mm.yy',
	            minDate: new Date(),
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            onSelect: function( selectedDate )
	            {
	                $('#finish').datepicker('option', 'minDate', selectedDate);
	                start = selectedDate;
	                var st = $('#start').datepicker('getDate');
	                // alert(st);
	                var fn = $('#finish').datepicker('getDate');
			        var dayDiff = (finish)?((fn - st)/1000/60/60/24):0;
			        // alert(dayDiff);
			        // if( finish )
			        	$('.daydiff').html(dayDiff).trigger("contentchange");
	            }
	        });
	        $('#finish').datepicker({
	            dateFormat: 'dd.mm.yy',
	            minDate: new Date(),
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            onSelect: function( selectedDate )
	            {
	                $('#start').datepicker('option', 'maxDate', selectedDate);
	                finish = selectedDate;

	                var st = $('#start').datepicker('getDate');
	                // alert(st);
	                var fn = $('#finish').datepicker('getDate');
			        var dayDiff = (finish)?((fn - st)/1000/60/60/24):0;
			        // alert(dayDiff);
			        $('.daydiff').html(dayDiff).trigger("contentchange");
			       
				}
	        });
	        
	        // Inline datepicker
	        $('#inline').datepicker({
	            dateFormat: 'dd.mm.yy',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>'
	        });
	        
	        // Inline date range
	        $('#inline-start').datepicker({
	            dateFormat: 'dd.mm.yy',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            onSelect: function( selectedDate )
	            {
	                $('#inline-finish').datepicker('option', 'minDate', selectedDate);
	            }
	        });
	        $('#inline-finish').datepicker({
	            dateFormat: 'dd.mm.yy',
	            prevText: '<i class="fa fa-angle-left"></i>',
	            nextText: '<i class="fa fa-angle-right"></i>',
	            onSelect: function( selectedDate )
	            {
	                $('#inline-start').datepicker('option', 'maxDate', selectedDate);
	            }
	        });
        }

    };
}();