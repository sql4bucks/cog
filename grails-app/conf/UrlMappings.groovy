class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"403"(controller: "error", action: "forbidden")
		"404"(controller: "error", action: "notFound")
		"405"(controller: "error", action: "notAllowed")
		"500"(view:'/error')
	}
}
