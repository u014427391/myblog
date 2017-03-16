package net.myblog.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
@Table(name="sys_role")
@Entity
public class Role {

	/**
	 * 角色Id
	 */
	private int roleId;
	
	/**
	 * 描述
	 */
	private String desc;
	
	/**
	 * 
	 */
	private String name;
	
	/**
	 * 
	 */
	private String role;
	
	private Set<Permission> permissions = new HashSet<Permission>();

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@ManyToMany(targetEntity=Permission.class,fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
	//@JoinTable(name="sys_role_permission", joinColumns=@JoinColumn(name="roleId",referencedColumnName="id"), inverseJoinColumns=@JoinColumn(name="permissionId",referencedColumnName="id"))
	public Set<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(Set<Permission> permissions) {
		this.permissions = permissions;
	}
	
	
}
