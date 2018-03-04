package library.items

import org.junit.Test
import org.openqa.selenium.WebDriver
import org.openqa.selenium.chrome.ChromeDriver

/**
 * Created by Dezaro on 4.3.2018 г..
 */
class TestSelenium {

    @Test
    public void Test1(){
        System.setProperty("webdriver.chrome.driver", "F:\\chromedriver.exe");

        WebDriver driver = new ChromeDriver();
        driver.get('http://localhost:8080/');
        driver.close();
        driver.quit();
    }
}
