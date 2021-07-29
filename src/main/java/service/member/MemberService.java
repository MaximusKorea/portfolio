package service.member;

import java.util.List;

import domain.member.Member;
import domain.member.MemberNotFoundException;
import domain.member.MemberPointJoinResult;
import domain.member.PasswordCheck;
import pagebean.ListPageConfigBeanNo;
import pagebean.ListResultBeanReserve;

public interface MemberService {
		
	/********* 회 원 가 입 ************/
	public int memberJoin(Member member) throws Exception;	
	
	public int memberKakaoJoin(Member member) throws Exception;
	
	
	/********* 회 원 탈 퇴 ************/
	public int memberOut(int m_no) throws Exception;
	
	/********* 특정회원 정보 ***********/
	public Member showMemberOneById(String m_id) throws Exception;
	
	/********* 특정회원 정보 ***********/
	public Member showMemberOneByNo(int m_no) throws Exception;
	
	/********* 회원 리스트 ***********/
	public List<MemberPointJoinResult> showMemberList() throws Exception;		
	
	/********  회원 수정 ************/
	public int memberInfoModify(Member member) throws Exception;
 
	/********  회원 아이디찾기 *************/
	public String memberFindId(Member member) throws Exception;
	
	/********  회원 비번찾기 *************/
	public String memberFindPw(Member member) throws Exception;
	
	/********  로그인 **********************/
	public Member login(String m_id,String m_pass) throws MemberNotFoundException, PasswordCheck,Exception;
	
	public Member loginkakao(String m_id) throws Exception;
		
	public int memberInfoModify(int m_no, int pt_point) throws Exception;
	
	public int memberInfoModify(int m_no, String m_password) throws Exception;
	
	
	/*********** 영화 예매 목록**************/
	public ListResultBeanReserve resv_check(ListPageConfigBeanNo pageConfig) throws Exception;
	  
	/*********** 회원의 영화 관람 횟수**************/
	public int mvSeeCount(int m_no) throws Exception;

	/*********** 회원의 포인트 **************/
	public int memberPointCalc(int m_no,int m_point) throws Exception;

}
