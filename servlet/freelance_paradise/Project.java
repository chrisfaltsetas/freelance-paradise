package freelance_paradise;

public class Project {

	private int projectId;
	private String title;
	private String state;
	private String descr;
	private String budget;
	private String categoryTitle;
	private String username;
	private String seller;
	private String chat;


	public Project(int projectId, String title, String state, String descr, String budget, String categoryTitle, String username, String seller, String chat) {

		this.projectId = projectId;
		this.title = title;
		this.state = state;
		this.descr = descr;
		this.budget = budget;
		this.categoryTitle = categoryTitle;
		this.username = username;
		this.seller = seller;
		this.chat = chat;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username)  {
		this.username = username;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller)  {
		this.seller = seller;
	}

	public String getChat() {
		return chat;
	}

	public void setChat(String chat)  {
		this.chat = chat;
	}

	@Override
	public String toString() {
		return "Project: " + title + " #" + projectId;
	}
}
