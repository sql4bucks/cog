package org.cog

enum SecurityAccess {
	GUEST(1), VIEWER(2), UPLOADER(3), POWER(4), SUPER(5)
	SecurityAccess(int value) {
		this.value = value
	}
	private final int value
	public int value() {return value}
	
}
