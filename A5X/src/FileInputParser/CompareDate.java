package FileInputParser;

import java.util.Comparator;

public class CompareDate implements Comparator<String>
{
	public int compare(String o1, String o2) {
		
		String date1[] = o1.split("-");
		String date2[] = o2.split("-");	
		
	
		
		if(date1[0].compareTo(date2[0]) != 0) {
			return (Integer.parseInt(date1[0]) - Integer.parseInt(date2[0]));
		} else {
			
			
			if(date1[1].compareTo(date2[1]) !=0) {
				return (Integer.parseInt(date1[1]) - Integer.parseInt(date2[1]));
			} else {
				if(date1[2].compareTo(date2[2]) !=0) {
					return (Integer.parseInt(date1[2]) - Integer.parseInt(date2[2]));
				} else {
				
					return -1;
				
				}
			}
		}
			
	}
}
