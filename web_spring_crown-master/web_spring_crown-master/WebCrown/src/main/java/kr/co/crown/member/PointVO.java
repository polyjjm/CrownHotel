package kr.co.crown.member;

public class PointVO {
	//����Ʈ
		private int point_code;	
		private String user_id;
		private int point;
		private String point_date;
		private String point_name="가입포인트";
		
		
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public int getPoint_code() {
			return point_code;
		}
		public void setPoint_code(int point_code) {
			this.point_code = point_code;
		}
		
		public int getPoint() {
			return point;
		}
		public void setPoint(int point) {
			this.point = point;
		}
		public String getPoint_date() {
			return point_date;
		}
		public void setPoint_date(String point_date) {
			this.point_date = point_date;
		}
		public String getPoint_name() {
			return point_name;
		}
		public void setPoint_name(String point_name) {
			this.point_name = point_name;
		}
		
		
		
		
		
}
