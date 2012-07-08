package scoutbar.logic
{
	public final class UserFunctions
	{
	
		public static function convertMySQLDateToActionscript( s:String ):Date {
			var a:Array = s.split( '-' );
			return new Date( a[0], a[1] - 1, a[2] );
		}
		
		public static function calculateAge(birthdate:Date):Number {
			var dtNow:Date = new Date();// gets current date
			var currentMonth:Number = dtNow.getMonth();
			var currentDay:Number = dtNow.getDay();
			var currentYear:Number = dtNow.getFullYear();
			
			var bdMonth:Number = birthdate.getMonth();
			var bdDay:Number = birthdate.getDay();
			var bdYear:Number = birthdate.getFullYear();
			
			// get the difference in years
			var years:Number = dtNow.getFullYear() - birthdate.getFullYear();
			// subtract another year if we're before the
			// birth day in the current year
			if (currentMonth < bdMonth || (currentMonth == bdMonth && currentDay < bdDay)) {
				years--;
			}
			return years;
		}
	}
}