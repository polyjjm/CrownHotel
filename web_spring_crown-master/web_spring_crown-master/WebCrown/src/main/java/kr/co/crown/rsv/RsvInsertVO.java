package kr.co.crown.rsv;



public class RsvInsertVO {
	private int roomNumber;
	private Integer room_people;
	private String user_id;
	private String checkIn;
	private String checkOut;
	private String require;
	private Integer breakfast_adult;
	private Integer price;
	private Integer pack_code;
	private Integer guest_code;
	private Integer room_rsv_code;
	
	private RsvInsertVO() {
		
	}
	
	public static RsvInsertVO of(int roomNumber, Integer room_people,String userid,String checkIn,String checkOut,String require,int breakfast_adult,int price,Integer pack_code) {
		
		RsvInsertVO rsvInsertVO = new RsvInsertVO();
		rsvInsertVO.roomNumber = roomNumber;
		rsvInsertVO.room_people=room_people;
		rsvInsertVO.user_id=userid;
		rsvInsertVO.checkIn=checkIn;
		rsvInsertVO.checkOut=checkOut;
		rsvInsertVO.require =require;
		rsvInsertVO.breakfast_adult=breakfast_adult;
		rsvInsertVO.price=price;
		rsvInsertVO.pack_code=pack_code;
		
		return rsvInsertVO;
	}
public static RsvInsertVO of(int roomNumber,int guest_code, int room_people,String checkIn,String checkOut,String require,int breakfast_adult,int price,Integer pack_code) {
		
		RsvInsertVO rsvInsertVO = new RsvInsertVO();
		rsvInsertVO.roomNumber = roomNumber;
		rsvInsertVO.guest_code=guest_code;
		rsvInsertVO.room_people=room_people;
		rsvInsertVO.checkIn=checkIn;
		rsvInsertVO.checkOut=checkOut;
		rsvInsertVO.require =require;
		rsvInsertVO.breakfast_adult=breakfast_adult;
		rsvInsertVO.price=price;
		rsvInsertVO.pack_code=pack_code;
		
		return rsvInsertVO;
	}

	public int getRoomNumber() {
		return roomNumber;
	}

	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}

	public Integer getRoom_people() {
		return room_people;
	}

	public void setRoom_people(Integer room_people) {
		this.room_people = room_people;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public String getRequire() {
		return require;
	}

	public void setRequire(String require) {
		this.require = require;
	}

	public Integer getBreakfast_adult() {
		return breakfast_adult;
	}

	public void setBreakfast_adult(Integer breakfast_adult) {
		this.breakfast_adult = breakfast_adult;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getPack_code() {
		return pack_code;
	}

	public void setPack_code(Integer pack_code) {
		this.pack_code = pack_code;
	}

	public Integer getGuest_code() {
		return guest_code;
	}

	public void setGuest_code(Integer guest_code) {
		this.guest_code = guest_code;
	}

	public Integer getRoom_rsv_code() {
		return room_rsv_code;
	}

	public void setRoom_rsv_code(Integer room_rsv_code) {
		this.room_rsv_code = room_rsv_code;
	}



	
}
