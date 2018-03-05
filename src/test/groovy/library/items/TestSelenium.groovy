package library.items

import org.junit.Test
import org.openqa.selenium.By
import org.openqa.selenium.WebDriver
import org.openqa.selenium.chrome.ChromeDriver

class TestSelenium {

    @Test
    void firstTest(){
//    public static void main(String[] args) {
        System.setProperty('webdriver.chrome.driver', 'F:\\chromedriver.exe')
        WebDriver driver = new ChromeDriver()
//        driver.get('http://localhost:8080/')
//        driver.close()
//        driver.quit()

        String baseUrl = "http://localhost:8080/";
        String expectedTitle = "Welcome: Mercury Tours";
        String actualTitle = "";

        // launch Fire fox and direct it to the Base URL
        driver.get(baseUrl);

        // get the actual value of the title
        actualTitle = driver.getTitle();

        // Login
        driver.findElement(By.linkText("LOGIN")).click()
        driver.findElement(By.id("username")).sendKeys( "delo")
        driver.findElement(By.id("password")).sendKeys("delo")
        driver.findElement(By.id('login_btn_id')).click()

        // Create author
        driver.findElement(By.linkText("AUTHORS")).click()
        driver.findElement(By.name("new_author_id")).click()
        driver.findElement(By.id("author_name_id")).sendKeys( "author asd 1")
        driver.findElement(By.id("#createBtn")).click()

        // Create category
        driver.findElement(By.linkText("CATEGORY")).click()
        driver.findElement(By.name("new_category")).click()
        driver.findElement(By.id("category_name_id")).sendKeys( "category asd 1")
        driver.findElement(By.id("#createBtn")).click()

        // Create book
        driver.findElement(By.linkText("BOOKS")).click()
        driver.findElement(By.name("new_book")).click()
        driver.findElement(By.id("title_id")).sendKeys( "Java")
        driver.findElement(By.id("isbn_id")).sendKeys( "9517386240753")
        driver.findElement(By.id("page_number_id")).sendKeys( "500")
        driver.findElement(By.id("publish_date_id_day")).sendKeys( "14")
        driver.findElement(By.id("publish_date_id_month")).sendKeys( "April")
        driver.findElement(By.id("publish_date_id_year")).sendKeys( "1994")
        driver.findElement(By.id("description_id")).sendKeys( "Repulsive questions contented him few extensive supported.")
        driver.findElement(By.id("publisher_id")).sendKeys( "Internet")
        driver.findElement(By.id("cover_id")).sendKeys( "Hard")
        driver.findElement(By.id("category_id")).sendKeys( "category asd 1")
        driver.findElement(By.id("author_id")).sendKeys( "author asd 1")
        driver.findElement(By.id("#createBtn")).click()
        Thread.sleep(1000)

        // Create Book Item
        driver.findElement(By.linkText("BOOK ITEMS")).click()
        driver.findElement(By.linkText("BOOK ITEMS")).click()
        driver.findElement(By.name("new_book_item")).click()
        driver.findElement(By.id("book_id")).click()
//        driver.findElement(By.value(4))
        /*
         * compare the actual title of the page with the expected one and print
         * the result as "Passed" or "Failed"
         */
        if (actualTitle.contentEquals(expectedTitle)){
            System.out.println("Test Passed!");
        } else {
            System.out.println("Test Failed");
        }

        //close Fire fox
//        driver.close();
    }
}
