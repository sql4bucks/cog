package org.cog

class ScriptureService {

    def getScripture() {

		def list = session.scriptureList
		def random = session.random
		if (!list) {
		// Lazy retrieve the list of scriptures
			list = Scripture.all()
			session.scriptureList = list
			random = new Random()
			session.random = random
		}
		
		def index = random.nextInt(list.count)
		index++
		Scripture scripture = Scripture.get(index)
		return scripture
    }
}
