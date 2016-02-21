package edu.cqupt.po.project;

/**
 * <p>
 * Description:团队项目图片
 * </p>
 * 
 * @author dave
 * @date 2015-9-3
 */
public class Image {
	private Integer image_id;
	private String path;
	private Integer image_pid;

	public Image() {
		super();
	}

	public Integer getImage_id() {
		return image_id;
	}

	public void setImage_id(Integer image_id) {
		this.image_id = image_id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getImage_pid() {
		return image_pid;
	}

	public void setImage_pid(Integer image_pid) {
		this.image_pid = image_pid;
	}

	@Override
	public String toString() {
		return "Image [image_id=" + image_id + ", path=" + path
				+ ", image_pid=" + image_pid + "]";
	}

}
