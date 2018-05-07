

//// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.facebook.domain.classname='FacebookUser'
grails.plugin.springsecurity.facebook.secret = '7797d0e11a5191f7643edeaabc8111b8'
grails.plugin.springsecurity.facebook.appId = '2103327649911618'
//grails.plugin.springsecurity.facebook.filter.type='cookieDirect'
grails.plugin.springsecurity.userLookup.userDomainClassName = 'library.items.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'library.items.UserSecurityRole'
grails.plugin.springsecurity.authority.className = 'library.items.SecurityRole'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/home/index',     access: ['permitAll']],
	[pattern: '/home/search',    access: ['permitAll']],
	[pattern: '/home/filter',    access: ['permitAll']],
	[pattern: '/book/show',      access: ['permitAll']],
	[pattern: '/book/show/**',   access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/fonts/**',    access: ['permitAll']],
	[pattern: '/fonts/**',    access: ['permitAll']],
	[pattern: '/**/fonts',    access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/fonts/**',       filters: 'none'],
	[pattern: '/fonts/**',       filters: 'none'],
	[pattern: '/**/fonts',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]



// Added by the Spring Security OAuth2 Google Plugin:
grails.plugin.springsecurity.oauth2.domainClass = 'library.items.OAuthID'
