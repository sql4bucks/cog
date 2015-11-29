package org.cog

class Scripture {

    def grailsApplication

    Integer id
    String text
    String chapterVerse

    static constraints = {
        text(nullable: false, blank: false, maxSize: 512)
        chapterVerse(nullable: false, blank: false, maxSize: 75)
    }

    static mapping = {
        table 'scripture'
        id column: 'scripture_id'
        text column: 'scripture_txt'
        chapterVerse column: 'chapter_verse'
        autoTimestamp false
        version false

    }

    /**
     * Construct a URL to access the Bible Gateway web site with the given chapter and verse
     * @return
     */
    String getUrl() {
        String work = this.chapterVerse
        def baseUrl = grailsApplication.config.cog.bible.gateway.base.url
        if (chapterVerse != null && chapterVerse.size() > 1) {
            // If the chapter has a digit and space "example: 1 Corinthians", remove the white space
            if (this.chapterVerse[0].isInteger() && this.chapterVerse[1] == " ") {
                work = chapterVerse[0] + chapterVerse[2..(chapterVerse.size() - 1)]
            }
        }
        work = work.replaceAll(" ", "+")
        work += "&version=KJV"
        return baseUrl + work
    }

    String toString() {
        text
    }
}
