dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			url="jdbc:mysql://localhost/cog?autoReconnect=true"
			username = "cog"
			password = "password"
			pooled = true
			// Other database parameters..
			properties {
			   maxActive = 50
			   maxIdle = 25
			   minIdle = 5
			   initialSize = 5
			   minEvictableIdleTimeMillis = 1800000
			   timeBetweenEvictionRunsMillis = 1800000
			   maxWait = 10000
			}
        }
    }
    test {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			url="jdbc:mysql://localhost/cog?autoReconnect=true"
			username = "cog"
			password = "password"
			pooled = true
			// Other database parameters..
			properties {
			   maxActive = 50
			   maxIdle = 25
			   minIdle = 5
			   initialSize = 5
			   minEvictableIdleTimeMillis = 1800000
			   timeBetweenEvictionRunsMillis = 1800000
			   maxWait = 10000
			}
        }
    }
    production {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			url="jdbc:mysql://localhost/cog?autoReconnect=true"
			 username = "cog"
			 password = "password"
			// Other database parameters..
			properties {
			   maxActive = 50
			   maxIdle = 25
			   minIdle = 5
			   initialSize = 5
			   minEvictableIdleTimeMillis = 1800000
			   timeBetweenEvictionRunsMillis = 1800000
			   maxWait = 10000
			}
        }
    }
}
