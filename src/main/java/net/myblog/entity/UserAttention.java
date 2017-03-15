package net.myblog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用户关注
 * @author Nicky
 */
//@Table(name="user_attention")
@Entity(name="user_attention")
public class UserAttention {

	/**
	 * 自增Id
	 */
	private int aId;
	
	/**
	 * 用户Id
	 */
	private int userId;
	
	/**
	 * 关注者Id
	 */
	private int attentionId;

	@GeneratedValue
	@Id
	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	@Column(nullable=false)
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(nullable=false)
	public int getAttentionId() {
		return attentionId;
	}

	public void setAttentionId(int attentionId) {
		this.attentionId = attentionId;
	}
	
	
}
