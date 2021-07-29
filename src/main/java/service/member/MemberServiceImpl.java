package service.member;

import java.util.List;

import dao.member.MemberDao;
import domain.member.Member;
import domain.member.MemberJoinResult;
import domain.member.MemberNotFoundException;
import domain.member.MemberPointJoinResult;
import domain.member.PasswordCheck;
import pagebean.ListPageConfigBeanNo;
import pagebean.ListResultBeanReserve;
import pagebean.PageCounterReserve;

public class MemberServiceImpl implements MemberService {

	private MemberDao memberdao;
	
	public void setMemberdao(MemberDao memberdao) {
		this.memberdao = memberdao;
	}
	
	@Override
	public int memberJoin(Member member) throws Exception {
		return memberdao.create(member);
	}
	
	@Override
	public int memberKakaoJoin(Member member) throws Exception {
		return memberdao.createKakao(member);
	}

	@Override
	public int memberOut(int m_no) throws Exception{
		return memberdao.delete(m_no);
	}
 
	@Override
	public List<MemberPointJoinResult> showMemberList() throws Exception{
		return memberdao.readByManager();
	}

	@Override
	public Member showMemberOneById(String m_id) throws Exception {
		return memberdao.readById(m_id);
	}
	
	@Override
	public Member showMemberOneByNo(int m_no) throws Exception {
		return memberdao.readByNo(m_no);
	}

	@Override
	public int memberInfoModify(Member member) throws Exception {
		return memberdao.update(member);
	}

	@Override
	public String memberFindId(Member member) throws Exception {
		return memberdao.findID(member);
	}

	@Override
	public String memberFindPw(Member member) throws Exception {
 		return memberdao.findPW(member);
	}

	@Override
	public Member login(String m_id, String m_pass) throws MemberNotFoundException, PasswordCheck, Exception {
		Member loginMember = memberdao.readById(m_id);
		System.out.println("로그인테스트 :"+loginMember );
		if(loginMember == null){
			throw new MemberNotFoundException(m_id+"는 없는 아이디입니다.");
		}else if(!(loginMember.isMatchPassword(m_pass))){
			throw new PasswordCheck("비밀번호가 일치하지 않습니다.");
		}
		return loginMember;
	}
	
	@Override
	public Member loginkakao(String m_id) throws Exception {
		Member loginMember = memberdao.readById(m_id);
		System.out.println("카카오로그인 테스트 :"+loginMember);
		return loginMember;
	}

	@Override
	public int memberInfoModify(int m_no, String m_password) throws Exception {
		return memberdao.update(m_no, m_password);
	}

	@Override
	public ListResultBeanReserve resv_check(ListPageConfigBeanNo pageConfig) throws Exception {
		int totalRecordCount = memberdao.countReadByMNO(pageConfig.getM_no());
		System.out.println("MemberServiceImpl.resv_check --> totalRecordCount --> " + totalRecordCount);
		ListResultBeanReserve resultBean = PageCounterReserve.getPagingInfo(Integer.parseInt(pageConfig.getSelectPage()),
																			pageConfig.getRowCountPerPage(),
																			pageConfig.getPageCountPerPage(),
																			totalRecordCount,
																			pageConfig.getM_no());
		List<MemberJoinResult> reserveList = memberdao.readJoinResult(resultBean.getStartRowNum(),
																	  resultBean.getEndRowNum(),
																	  pageConfig.getM_no());
		System.out.println("resultBean.getStartRowNum() --------> " + resultBean.getStartRowNum());
		System.out.println("resultBean.getEndRowNum() --------> " + resultBean.getEndRowNum());
		System.out.println("pageConfig.getM_no() --------> " + pageConfig.getM_no());
		System.out.println("memberdao.readJoinResult ------> " + memberdao.readJoinResult(resultBean.getStartRowNum(),
																	  						resultBean.getEndRowNum(),
																	  						pageConfig.getM_no()));
		System.out.println(reserveList);
		resultBean.setList(reserveList);
		return resultBean;
	}

	@Override
	public int mvSeeCount(int m_no) throws Exception {
		return memberdao.countReadByMNO(m_no);
	}

	@Override
	public int memberPointCalc(int m_no, int m_point) throws Exception {
		return memberdao.updatePoint(m_no, m_point);
	}

	@Override
	public int memberInfoModify(int m_no, int pt_point) throws Exception {
		System.out.println("m_no : " + m_no + "pt_point : " + pt_point);
		return memberdao.update(m_no,pt_point);
	}

}
