package net.myblog.entity;

import java.io.Serializable;
import java.lang.String;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: Menu
 *
 */
@Entity(name="sys_menu")
public class Menu implements Serializable {

	
	private int menuId;
	private int identify;
	private String name;
	private String menuIcon;
	private String menuUrl;
	private String menuType;
	private static final long serialVersionUID = 1L;

	public Menu() {
		super();
	}   
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getMenuId() {
		return this.menuId;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}   
	
	@Column(unique=true)
	public int getIdentify() {
		return this.identify;
	}

	public void setIdentify(int identify) {
		this.identify = identify;
	}   
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}   
	public String getMenuIcon() {
		return this.menuIcon;
	}

	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}   
	public String getMenuUrl() {
		return this.menuUrl;
	}

	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}   
	public String getMenuType() {
		return this.menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
   
}
