package org.cog

import java.text.SimpleDateFormat

import org.eclipse.jdt.internal.compiler.ast.WhileStatement;

class CogTagLib {
	
	def springSecurityService
		
	def dateFormat = { attrs, body ->
        out << (attrs.value).format(attrs.format)
    }
	
	/** 
	 * Display a random scripture in the banner section. 
	 * This tracks which scriptures have been used and will only
	 * use the same one again once all have been used
	 */
	def scripture = { attrs, body ->
		
		// Get the list of scriptures, the used scriptures and the randomizer out of the session
		def list = session.scriptureList
		def random = session.scriptureRandomizer
		def usedList = session.usedScriptures
		def index = 1
		boolean found = false
		
		if (!list) {
		// This must be the first execution for this session - Lazy retrieve the list of scriptures
			list = Scripture.list()
			session.scriptureList = list
			// Initialize the randomizer
			random = new Random(new Date().getTime())
			session.scriptureRandomizer = random
			// Create list of "used" scriptures
			usedList = []
			session.usedScriptures = usedList
		}
		
		// Reset the used list if we have used them all
		if (usedList.size() >= list.size()) {
			usedList = []
		}
		
		// Find a random, previously unused Scripture
		Scripture scripture = null
		while (!found) {
			index = random.nextInt(list.size())
			index++
			if (!usedList.contains(index)) {
				scripture = Scripture.get(index)
				if (scripture != null) {
					found = true
					usedList << index
				}	
			}
		}
		
		session.usedScriptures = usedList
		out << render(template: "/scripture/scriptureTemplate", model: [scripture: scripture])
	}
	
	def pictures = { attrs, body ->
		
		// Get the list of pictures, the used ones and the randomizer out of the session
		def list = session.pictureList
		def random = session.pictureRandomizer
		def usedList = session.usedPictures
		
		if (!list) {
		// This must be the first execution for this session - Lazy retrieve the list of scriptures
			list = Picture.list()
			session.pictureList = list
			// Initialize the randomizer
			random = new Random(new Date().getTime())
			session.pictureRandomizer = random
			// Create list of "used" scriptures
			usedList = []
			session.usedPictures = usedList
		}
		
		// Reset the used list if we have used them all
		// Deduct the number of pictures to display so we 
		// don't run out of unused pics for an entire set
		final int setSize = 6
		if (usedList.size() >= (list.size() - setSize) )  {
			random = new Random(new Date().getTime())
			session.pictureRandomizer = random
			list = Picture.list()
			usedList = []
		}
		
		// Find random, previously unused pictures
		def List<Integer> indexes = []
		def index = 0
		
		
		def List<Picture> pictureSet = []
		setSize.times {
			boolean found = false
			while (!found) {
				index = random.nextInt(list.size())
				index++
				if (!usedList.contains(index)) {
					Picture picture = Picture.get(index)
					if (picture) {
						found = true
						pictureSet << picture
						usedList << index
					}	
				}
			}
		}	
		
		session.usedPictures = usedList
		out << render(template: "/picture/pictures", model: [pictureSet: pictureSet])
	}
	
	def userProperty = { attrs, body ->
		String field = assertAttribute('field', attrs, 'userProperty')
		def userDetails = springSecurityService.principal
		def person = User.get(userDetails.id)
		out << person."${field}".encodeAsHTML()
	
	}
	
	protected assertAttribute(String name, attrs, String tag) {
		if (!attrs.containsKey(name)) {
			throwTagError "Tag [$tag] is missing required attribute [$name]"
		}
		attrs.remove name
	}


}
