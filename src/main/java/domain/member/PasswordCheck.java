package domain.member;

@SuppressWarnings("serial")
public class PasswordCheck extends Exception {
	public PasswordCheck(){}
	public PasswordCheck(String msg){
		super(msg);
	}
}
