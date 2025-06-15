package org.cog

class SuggestionBox {

    Integer		id
    String		name
    String		suggestion
    Date        modifiedDate
    Integer     reviewed
    User		modifiedUser

    static constraints = {
        name (nullable:false, blank:false, maxSize:50)
        suggestion(blank:false, nullable:false, maxSize: 2000)
        reviewed(nullable:true)
        modifiedDate(nullable:true)

    }

    static mapping = {
        table 'suggestion_box'
        id column:'id'
        name column:'name'
        suggestion column:'suggestion'
        modifiedDate column:'created_at'
        modifiedUser column:'modified_user'
        reviewed column:'reviewed'
        autoTimestamp false
        version false

    }

    String toString() {
        name
    }
}
