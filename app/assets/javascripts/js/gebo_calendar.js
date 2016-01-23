/* [ ---- Gebo Admin Panel - calendar ---- ] */

	$(document).ready(function() {
		gebo_calendar.regular();
		gebo_calendar.google();
		//* resize elements on window resize
		var lastWindowHeight = $(window).height();
		var lastWindowWidth = $(window).width();
		$(window).on("debouncedresize",function() {
			if($(window).height()!=lastWindowHeight || $(window).width()!=lastWindowWidth){
				lastWindowHeight = $(window).height();
				lastWindowWidth = $(window).width();
				//* rebuild calendar
				$('#calendar').fullCalendar('render');
				$('#calendar_google').fullCalendar('render');
			}
		});
	});