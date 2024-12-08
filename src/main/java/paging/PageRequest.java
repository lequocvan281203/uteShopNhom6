package paging;


public class PageRequest implements Pageble {


	 private Integer page;
	 private Integer maxPageItem;
	 public PageRequest(Integer page, Integer maxPageItem) {
		 this.page=page;
		 this.maxPageItem=maxPageItem;
	 }

	@Override
	public Integer getPage() {
		// TODO Auto-generated method stub

		return this.page;
	}

	@Override
	public Integer getOffset() {
		// TODO Auto-generated method stub
		if(this.page != null && this.maxPageItem !=null)
		{
			return (this.page - 1)*(this.maxPageItem);
		}
		else
		{
			return null;
		}
	}

	@Override
	public Integer getLimit() {
		// TODO Auto-generated method stub
		return this.maxPageItem;
	}




}