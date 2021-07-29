package domain.member;

@SuppressWarnings("serial")
public class MemberNotFoundException extends Exception {
	public MemberNotFoundException(){}
	public MemberNotFoundException(String msg){
		super(msg);
	}
}
