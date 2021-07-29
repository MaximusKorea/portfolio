package pagebean;

// 페이징 처리 계산
public class PageCounterBasicFinder{	
	public static ListResultBeanBasicFinder getPagingInfo(	int selectPage,
												int rowCountPerPage,
												int pageCountPerPage, 
												int totalRecordCount,
												
												String pageno,
												String s,
												String kt,
												String searchtxt,
												String genre,
												String indi,
												String national,
												String grade,
												String sdate,
												String edate,
												String year_start,
												String year_end,
												String page) throws Exception{
		ListResultBeanBasicFinder resultBean = new ListResultBeanBasicFinder();
		int totalPageCount = 1;    			// 전체페이지수
		int startPageNo = 1;        		// 시작페이지 번호
		int endPageNo = 1;         			// 한 화면(그룹)에서 끝페이지 번호
		int selectPageNo = 1;      			// 선택된 페이지 번호
		int previousGroupStartPageNo = 1;  	// 이전 그룹의 시작페이지 번호
		int nextGroupStartPageNo = 1;       // 다음 그룹의 시작페이지
		int groupNo = 0;           			// 페이지별 그룹넘버
		int startRow = 0; // 몇번째 레코드부터..
		int endRow   = 0; // 몇번째 레코드까지..
		
		
		//**********  DB 레코드수에 따른 계산  *********************
		// 1.전체 페이지수 계산
		int modula = 0;
		if (totalRecordCount > 1){ //1개 이상의 레코드가 존재하면...
			modula = (totalRecordCount) % rowCountPerPage;
			if (modula != 0){//나머지가 2, 3, 4, 5,...., 9이면
				modula = 1;
			}else{// 나머지가 0이면(딱 떨어지면)
				modula = 0;
			}		
			totalPageCount = (totalRecordCount)/rowCountPerPage + modula;
		}else{
			totalPageCount = 1;
		}		
		
		if(selectPage > totalPageCount){
			throw new Exception();
			
		}
		
		// 사용자가 페이지번호를 선택할 때마다 각각의 결과값 다르다.
		// 2.한 화면(그룹) 에서 보여지는 그룹넘버,
		selectPageNo = selectPage;		
		groupNo = (selectPageNo-1)/pageCountPerPage;
		// 만일 pageCountPerPage 를 5 으로 설정하였을 경우
		/*  
		      1  2  3  4   5 ▶ --> 0
	 	  ◀  6  7  8  9  10 ▶ --> 1
		  ◀ 11 12 13 14  15 ▶ --> 2
		 */
		// 3.한 화면(그룹) 에서 시작페이지와 끝페이지 
		startPageNo = groupNo*pageCountPerPage + 1;
		endPageNo   = groupNo*pageCountPerPage+pageCountPerPage;
		// 4.이전 화면그룹의 시작페이지와 끝페이지
		previousGroupStartPageNo = startPageNo - pageCountPerPage;		
		if(previousGroupStartPageNo < 0){// groupNo이 0인 경우(페이지 인덱스가 0~10사이)
			previousGroupStartPageNo = 0;
		}
		nextGroupStartPageNo = startPageNo + pageCountPerPage;
		
		if (startPageNo > totalPageCount)   startPageNo = startPageNo - pageCountPerPage + 1;
		if (endPageNo > totalPageCount)     endPageNo = totalPageCount;
		
		// 5. 보여줘여할 게시물 테이블 데이타의 시작번호,끝번호
		if (selectPageNo == 1 && selectPageNo == totalPageCount){// 1페이지인경우..
			startRow=1;
			endRow = totalRecordCount;
		}else if (selectPageNo < totalPageCount){
			startRow=rowCountPerPage*selectPageNo-rowCountPerPage + 1;
			endRow = rowCountPerPage*selectPageNo-rowCountPerPage + rowCountPerPage;
		}else if ( selectPageNo == totalPageCount){ // 끝페이지인경우..
			startRow=rowCountPerPage * selectPageNo - rowCountPerPage + 1;
			endRow = totalRecordCount;
		}
		
		// 페이징처리에 필요한 정보를 ListResultBean에 세팅
		resultBean.setStartPageNo(startPageNo);
		resultBean.setEndPageNo(endPageNo);
		resultBean.setSelectPageNo(selectPageNo);
		resultBean.setTotalRecordCount(totalRecordCount);
		resultBean.setTotalPageCountCount(totalPageCount);
		resultBean.setPreviousGroupStartPageNo(previousGroupStartPageNo);
		resultBean.setNextGroupStartPageNo(nextGroupStartPageNo);
		resultBean.setStartRowNum(startRow);
		resultBean.setEndRowNum(endRow);
		resultBean.setShowPreviousGroup(isShowPreviousMoreIcon(groupNo,totalPageCount));
		resultBean.setShowNextGroup(isShowNextMoreIcon(endPageNo,totalPageCount));
		resultBean.setShowFirst(isShowFirstIcon(groupNo,totalPageCount));
		resultBean.setShowLast(isShowLastIcon(endPageNo,totalPageCount));
		System.out.println("***************페이지정보***************");
		System.out.println("01.selectPage:\t\t\t"+resultBean.getSelectPageNo());
		System.out.println("02.rowCountPerPage:\t\t"+rowCountPerPage);
		System.out.println("03.pageCountPerPage:\t\t"+pageCountPerPage);
		System.out.println("02.totalRecordCount:\t\t"+resultBean.getTotalRecordCount());
		System.out.println("03.totalPageCount:\t\t"+resultBean.getTotalPageCount());
		System.out.println("04.pagegroupNo:\t\t\t"+groupNo);
		System.out.println("05.startPageNo:\t\t\t"+resultBean.getStartPageNo());
		System.out.println("06.endPageNo:\t\t\t"+resultBean.getEndPageNo());
		System.out.println("07.startRowNum:\t\t\t"+resultBean.getStartRowNum());
		System.out.println("08.endRowNum:\t\t\t"+resultBean.getEndRowNum());
		System.out.println("09.previousGroupStartPageNo:\t"+resultBean.getPreviousGroupStartPageNo());
		System.out.println("10.nextGroupStartPageNo:\t"+resultBean.getNextGroupStartPageNo());
		System.out.println("11.isShowPreviousGroup:\t\t"+resultBean.isShowPreviousGroup());
		System.out.println("12.isShowNextGroup:\t\t"+resultBean.isShowNextGroup()); 		
		System.out.println("13.isShowFirst:\t\t\t"+resultBean.isShowFirst());
		System.out.println("14.isShowLast:\t\t\t"+resultBean.isShowLast()); 		
		System.out.println("**************************************");
		
		resultBean.setPageno(pageno);
		resultBean.setS(s);
		resultBean.setKt(kt);
		resultBean.setSearchtxt(searchtxt);
		resultBean.setGenre(genre);
		resultBean.setIndi(indi);
		resultBean.setNational(national);
		resultBean.setGrade(grade);
		resultBean.setSdate(sdate);
		resultBean.setEdate(edate);
		resultBean.setYear_start(year_start);
		resultBean.setYear_end(year_end);
		resultBean.setPage(page);
		
		System.out.println("**************************************");
		System.out.println("15.pageno:\t\t\t"+resultBean.getPageno());
		System.out.println("16.s:\t\t\t"+resultBean.getS());
		System.out.println("17.kt:\t\t\t"+resultBean.getKt());
		System.out.println("18.searchtxt:\t\t\t"+resultBean.getSearchtxt());
		System.out.println("19.genre:\t\t\t"+resultBean.getGenre());
		System.out.println("20.indi:\t"+resultBean.getIndi());
		System.out.println("21.national:\t"+resultBean.getNational());
		System.out.println("22.grade:\t\t"+resultBean.getGrade());
		System.out.println("23.sdate:\t\t"+resultBean.getSdate()); 		
		System.out.println("24.edate:\t\t\t"+resultBean.getEdate());
		System.out.println("25.year_start:\t\t"+resultBean.getYear_start()); 		
		System.out.println("26.year_end:\t\t\t"+resultBean.getYear_end());
		System.out.println("27.page:\t\t\t"+resultBean.getPage());
		System.out.println("**************************************");
		
		return resultBean;				
	}
	
	// 페이지에 [이전 그룹] 출력여부를 판단하는 메소드
	public static boolean isShowPreviousMoreIcon(int groupNo, int totalPageCount) {
		boolean isShow = false;
		int modula = 0;
		modula = groupNo % totalPageCount;
		if (modula != 0)
			modula = 1;
		if ((groupNo / totalPageCount + modula) > 0) {
			isShow = true;
		} else {
			isShow = false;
		}

		return isShow;
	}

	// 페이지에 [다음 그룹] 출력여부를 판단하는 메소드
	public static boolean isShowNextMoreIcon(int endPageNo, int totalPageCount) {
		if (endPageNo < totalPageCount)
			return true;
		else
			return false;
	}

	// 페이지에 [처음으로] 아이콘 출력여부를 판단하는 메소드
	public static boolean isShowFirstIcon(int groupNo, int totalPageCount) {
		int modula = 0;
		modula = groupNo % totalPageCount;
		if (modula != 0)
			modula = 1;
		if ((groupNo / totalPageCount + modula) > 0)
			return true;
		else
			return false;

	}

	// 페이지에 [마지막으로] 아이콘 출력여부를 판단하는 메소드
	public static boolean isShowLastIcon(int endPageNo, int totalPageCount) {
		if (endPageNo < totalPageCount)
			return true;
		else
			return false;
	}
	  
 }