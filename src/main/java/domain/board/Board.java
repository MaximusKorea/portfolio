package domain.board;

import java.util.Date;

public class Board {
	private int board_no;
	private String board_title;
	private String board_writer;
	private String board_content;
	private Date board_regDate;
	private String board_type;
	private String board_image;
	private int readCount;
	private int board_groupno;
	private int board_step;
	private int board_depth;
	
	public Board() {}
	public Board(int board_no, String board_title, String board_writer, String board_content, Date board_regDate,
			String board_type, String board_image, int readCount, int board_groupno, int board_step, int board_depth) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_writer = board_writer;
		this.board_content = board_content;
		this.board_regDate = board_regDate;
		this.board_type = board_type;
		this.board_image = board_image;
		this.readCount = readCount;
		this.board_groupno = board_groupno;
		this.board_step = board_step;
		this.board_depth = board_depth;
	}

	public int getBoard_groupno() {
		return board_groupno;
	}

	public void setBoard_groupno(int board_groupno) {
		this.board_groupno = board_groupno;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getBoard_step() {
		return board_step;
	}

	public void setBoard_step(int board_step) {
		this.board_step = board_step;
	}

	public int getBoard_depth() {
		return board_depth;
	}

	public void setBoard_depth(int board_depth) {
		this.board_depth = board_depth;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_regDate() {
		return board_regDate;
	}

	public void setBoard_regDate(Date board_regDate) {
		this.board_regDate = board_regDate;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getBoard_image() {
		return board_image;
	}

	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}
	
	@Override
	public String toString() {
		return board_no + "\t" + board_title + "\t" + board_content + "\t" + board_regDate + "\t"
				+ board_type + "\t" + board_image + "\t" + readCount + "\t" + board_groupno + "\t"
				+ board_step + "\t" + board_depth;
	}
}
