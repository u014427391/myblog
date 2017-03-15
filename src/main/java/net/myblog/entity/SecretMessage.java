package net.myblog.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 私信信息的实体类
 * @author Nicky
 */
//@Table(name="secret_message")
@Entity(name="secret_message")
public class SecretMessage {

	/**
	 * 自增Id
	 */
	private int secretId;
	
	/**
	 * 发送者Id
	 */
	private int sendId;
	
	/**
	 * 接收者Id
	 */
	private int receiveId;
	
	/**
	 * 私信内容
	 */
	private String messageContent;

	@GeneratedValue
	@Id
	public int getSecretId() {
		return secretId;
	}

	public void setSecretId(int secretId) {
		this.secretId = secretId;
	}

	@Column(nullable=false)
	public int getSendId() {
		return sendId;
	}

	public void setSendId(int sendId) {
		this.sendId = sendId;
	}

	@Column(nullable=false)
	public int getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(int receiveId) {
		this.receiveId = receiveId;
	}

	@Column(length=100,nullable=false)
	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	
	
}
