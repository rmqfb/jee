
public class R​eservationBean {
	private int seatNo;  // 자리번호
	private String dateAndTime;  // 날짜 및 시간
	private int awaiter;		// 대기자
	
	public int getPositionNumber() {
		return seatNo;
	}
	public void setPositionNumber(int seatNo) {
		this.seatNo = seatNo;
	}
	public String getDateAndTime() {
		return dateAndTime;
	}
	public void setDateAndTime(String dateAndTime) {
		this.dateAndTime = dateAndTime;
	}
	public int getAwaiter() {
		return awaiter;
	}
	public void setAwaiter(int awaiter) {
		
		
		this.awaiter = awaiter;
	}
	
	
}
