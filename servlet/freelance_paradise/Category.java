package freelance_paradise;

public class Category {
	
	private String title;
	private String descr;
		

	public Category(String title, String descr) {

		this.title = title;
		this.descr = descr;
	}

	public String getTitle() {
		return title;
	}	

	public void setTitle(String title) {
		this.title = title;
	}	

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	@Override
	public String toString() {
		return "Category: " + title;
	}	
	
}
