import library.items.UserPasswordEncoderListener;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener, ref('hibernateDatastore'))
    localeResolver(SessionLocaleResolver) {
//        defaultLocale= new java.util.Locale('bg');
        defaultLocale = new java.util.Locale('en');
    }
}