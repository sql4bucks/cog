package org.cog

class Utility {
	
	/**
	 * Create a string based on the "yyyy/MM" format of the passed in date
	 * If date argument is null, use the current date
	 * @param contentDate
	 * @return
	 */
	static String getDatedDirectory(Date contentDate) {
		Date recordedDate = contentDate
		if (recordedDate == null) {
			recordedDate = new Date()
		}	
		String year = recordedDate.format("yyyy/MM")
		return year
	}
	
	/**
	 * Make file system directories if they don't exist for media and picture content
	 * @param directory
	 */
	static void makeDir(String directory) {
		File dir = new File(directory)
		if (!dir.exists()) {
			dir.mkdirs()
		} 
	}
	
	/**
	 * Encode an email address
	 * @return
	 */
	static String encodeEmail(String email) {
		StringBuilder buffer = new StringBuilder()
		if (email) {
			email.each() {
				int ascii = (int) it
				buffer.append("&#")
				buffer.append(ascii)
				buffer.append(";")
			}
		}
		return buffer.toString()
	}

}
