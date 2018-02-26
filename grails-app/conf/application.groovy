

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'library.items.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'library.items.UserSecurityRole'
grails.plugin.springsecurity.authority.className = 'library.items.SecurityRole'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/home/index',     access: ['permitAll']],
	[pattern: '/home/search',    access: ['permitAll']],
	[pattern: '/home/filter',    access: ['permitAll']],
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

