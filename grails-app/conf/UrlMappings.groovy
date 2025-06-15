class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"error", action: "moved")
		"/link/links"(controller:"error", action: "moved")
		"/about/index"(controller:"error", action: "moved")
		"/suggestionBox/list"(controller:"error", action: "moved")
		"403"(controller: "error", action: "forbidden")
		"404"(controller: "error", action: "notFound")
		"405"(controller: "error", action: "notAllowed")
		"500"(view:'/error')
	}
}
