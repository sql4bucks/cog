package org.cog

import java.util.Date;
import org.hibernate.SessionFactory

class TimeService {

	def sessionService
	def sessionFactory
	static transactional = true
	
	/*
	* Get a representation of the current database time. The initializeTime method below
	* compared the database time to the OS time and stores the offset in the session. This method
	* simply adds the time offset to the current OS time to approximate the DB time.
	*/
   public Date getTime() {
	   Long offset = sessionService.getTimeOffset()
	   if (offset == null) {
		   log.debug "Offset is null, initializing time"
		   offset = initializeTime();
	   }
	   Date osDate = new Date()
	   long time = osDate.getTime();
	   long now = time + offset;
	   Date dbTime = new Date(now);
	   log.info "getTime: OS Time = ${osDate}"
	   log.info "getTime: Time Offset = ${offset}"
	   log.info "getTime: Calculated db time = ${dbTime}"
	   return dbTime;
   }
   
   /*
	* Initialize the session time handling
	*
	* All objects will be time stamped based on the database time.
	* However, to save database calls, we will only retrieve the database time once per session.
	*   1) After retrieving the database time, we get the current OS time.
	*   2) Calculate the difference in milliseconds between the OS time and the DB time
	*   3) Store the difference (offset) in the session.
	*   4) Later, the getTime method will return a representation of database time by adding the offset
	*      to the current OS time every time it is called.
	*/
   public long initializeTime() {
	   
	   // Get current date/time from DB
	   def session = sessionFactory.getCurrentSession()
	   def query = "select now()"
	   def seqList = session.createSQLQuery(query).list()
	   
	   Date sysDate = null
	   if (seqList) {
		   sysDate = seqList[0]
	   }
	   
	   // Now get the OS time and calculate the offset
	   Date now = new Date();
	   Date dbTime = sysDate
	   long offset = dbTime.getTime() - now.getTime();
	   log.debug "Initialize: DB Time = ${dbTime}"
	   log.debug "Initialize: OS Time = ${now}"
	   log.info "Initialize: DB offset = ${offset}"
	   sessionService.setTimeOffset(offset);
	   return offset
   }
	
   
	
}
