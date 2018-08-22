package FileInputParser;

import java.util.Comparator;
import java.lang.*;

public class CompareGP implements Comparator<String>
{
	public int compare(String o1, String o2) {
		
		
		String gp1 = o1.split("\\.")[0];
		String gp2 = o2.split("\\.")[0];
		
		return (Integer.parseInt(gp1) - Integer.parseInt(gp2));
		
	}
}
