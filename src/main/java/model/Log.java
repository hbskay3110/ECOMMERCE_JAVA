package model;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

public class Log {
	  	int id;
	    int level;
	    String userId;
	    String src;
		String ipAddress;
		String userAgent;
	    String content;
	    Date creatAt;
	    int status;

	    static Map<Integer, String> levelMapping = new HashMap<>();
	    static {
	        levelMapping.put(0, "INFO");
	        levelMapping.put(1, "ALERT");
	        levelMapping.put(2, "WARNING");
	        levelMapping.put(3, "DANGER");
	    }

	   public static int INFO = 0;
	    public static int ALERT = 1;
	    public static int WARNING = 2;
	    public static int DANGER = 3;
	    
	    public Log() {
			// TODO Auto-generated constructor stub
		}
		public Log(int level, String userId, String src, String content, Date creatAt, int status) {
			super();
			
			this.level = level;
			this.userId = userId;
			this.src = src;
			this.content = content;
			this.creatAt = creatAt;
			this.status = status;
		}
		public Log(int level, String userId, String src, String content, int status) {
			super();
			this.level = level;
			this.userId = userId;
			this.src = src;
			this.content = content;
			this.status = status;
		}

	public Log(int id, int level, String userId, String src, String ipAddress, String userAgent, String content, Date creatAt, int status) {
		this.id = id;
		this.level = level;
		this.userId = userId;
		this.src = src;
		this.ipAddress = ipAddress;
		this.userAgent = userAgent;
		this.content = content;
		this.creatAt = creatAt;
		this.status = status;
	}

	public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getLevel() {
			return level;
		}
		public void setLevel(int level) {
			this.level = level;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getSrc() {
			return src;
		}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public static Map<Integer, String> getLevelMapping() {
		return levelMapping;
	}

	public static void setLevelMapping(Map<Integer, String> levelMapping) {
		Log.levelMapping = levelMapping;
	}

	public String getLevelWithName() {
	        return levelMapping.get(levelMapping.containsKey(this.level) ? this.level : 0);
	    }
		public void setSrc(String src) {
			this.src = src;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Date getCreatAt() {
			return creatAt;
		}
		public void setCreatAt(Date creatAt) {
			this.creatAt = creatAt;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}

	@Override
	public String toString() {
		return "Log{" +
				"id=" + id +
				", level=" + level +
				", userId='" + userId + '\'' +
				", src='" + src + '\'' +
				", ipAddress='" + ipAddress + '\'' +
				", userAgent='" + userAgent + '\'' +
				", content='" + content + '\'' +
				", creatAt=" + creatAt +
				", status=" + status +
				'}';
	}
}
