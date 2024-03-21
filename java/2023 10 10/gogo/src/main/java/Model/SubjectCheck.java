package Model;

import java.util.ArrayList;
import java.util.TreeMap;

public class SubjectCheck {
	public boolean check(TreeMap<String,ArrayList<Message>> map, String subject) {
		if(map.get(subject) == null) {
			return true;
		}
		return false;
	}
}