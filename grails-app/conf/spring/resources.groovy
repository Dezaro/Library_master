import library.items.UserPasswordEncoderListener
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
}

// Place your Spring DSL code here
beans = {
    localeResolver(SessionLocaleResolver) {
        defaultLocale= new java.util.Locale('bg');
    }
}