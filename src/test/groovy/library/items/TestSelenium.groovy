package library.items

import org.junit.Test
import org.openqa.selenium.By
import org.openqa.selenium.NoSuchElementException
import org.openqa.selenium.ElementNotVisibleException
import org.openqa.selenium.JavascriptExecutor
import org.openqa.selenium.WebDriver
import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.support.ui.Select;

//import org.openqa.selenium.Dimension;

class TestSelenium {

    WebDriver driver
    int maxDepth = 40

    @Test
    void firstTest() {
        System.setProperty('webdriver.chrome.driver', 'E:\\chromedriver.exe')
        driver = new ChromeDriver()
        driver.manage().window().maximize();
//        driver.manage().window().setSize(new Dimension(1920, 1080))

        String baseUrl = "http://localhost:8080/";
        String expectedTitle = "Welcome: Mercury Tours";
        String actualTitle = "";

        // launch Fire fox and direct it to the Base URL
        driver.get(baseUrl);

        // get the actual value of the title
        actualTitle = driver.getTitle();

        // Login
        this.clickByWhenIsVisible('LOGIN', 'linkText')
        driver.findElement(By.id("username")).sendKeys("delo")
        driver.findElement(By.id("password")).sendKeys("delo")
        driver.findElement(By.id('login_btn_id')).click()

        // Create author
        this.clickByWhenIsVisible('AUTHORS', 'linkText')
        this.clickByWhenIsVisible('new_author_id', 'name')
        driver.findElement(By.id("author_name_id")).sendKeys("author asd 1")
        this.clickByWhenIsVisible('#createBtn', 'id')

        // Create category
        this.clickByWhenIsVisible('CATEGORY', 'linkText')
        this.clickByWhenIsVisible('new_category', 'name')
        driver.findElement(By.id("category_name_id")).sendKeys("category asd 1")
        this.clickByWhenIsVisible('#createBtn', 'id')

        // Create book
        this.clickByWhenIsVisible('BOOKS', 'linkText')
        this.clickByWhenIsVisible('new_book', 'name')
        driver.findElement(By.id("title_id")).sendKeys("Java")
        driver.findElement(By.id("isbn_id")).sendKeys("9517386240753")
        driver.findElement(By.id("page_number_id")).sendKeys("500")
        Select bookCreateDayCombo = new Select(driver.findElement(By.id("publish_date_id_day")))
        bookCreateDayCombo.selectByValue("14")
        Select bookCreateMonthCombo = new Select(driver.findElement(By.id("publish_date_id_month")))
        bookCreateMonthCombo.selectByValue("7")
        Select bookCreateYearCombo = new Select(driver.findElement(By.id("publish_date_id_year")))
        bookCreateYearCombo.selectByValue("1937")
        driver.findElement(By.id("description_id")).sendKeys("Repulsive questions contented him few extensive supported.")
        driver.findElement(By.id("publisher_id")).sendKeys("Internet")
        driver.findElement(By.id("cover_id")).sendKeys("Hard")
        driver.findElement(By.id("category_id")).sendKeys("category asd 1")
        driver.findElement(By.id("author_id")).sendKeys("author asd 1")
        this.clickByWhenIsVisible('#createBtn', 'id')
        this.waitForAjax()

        // Create Book Item
        this.clickByWhenIsVisible('BOOK ITEMS', 'linkText')
        this.clickByWhenIsVisible('new_book_item', 'name')
        this.clickByWhenIsVisible('book_id', 'id')
        Select bookItemCombo = new Select(driver.findElement(By.id("book_id")))
        bookItemCombo.selectByValue("1");
        driver.findElement(By.id("serial_number_id")).sendKeys((Math.abs(new Random().nextInt() % 1000000000000) + 1).toString())
        this.clickByWhenIsVisible('create_btn_id', 'id')

        // Create Reader Card
        this.clickByWhenIsVisible('READERS CARDS', 'linkText')
        this.clickByWhenIsVisible('new_reader_card', 'name')
        driver.findElement(By.id("card_number_id")).sendKeys((Math.abs(new Random().nextInt() % 1000000000) + 1).toString())
        driver.findElement(By.id("reader_names_id")).sendKeys("Selenium Chrome")
        driver.findElement(By.id("person_number_id")).sendKeys((Math.abs(new Random().nextInt() % 10000) + 1000000000).toString())
        driver.findElement(By.id("phone_id")).sendKeys((Math.abs(new Random().nextInt() % 1000000000) + 1).toString())
        Select cardReaderCreateDayCombo = new Select(driver.findElement(By.id("registerDate_day")))
        cardReaderCreateDayCombo.selectByValue("1")
        Select cardReaderCreateMonthCombo = new Select(driver.findElement(By.id("registerDate_month")))
        cardReaderCreateMonthCombo.selectByValue("2")
        Select cardReaderCreateYearCombo = new Select(driver.findElement(By.id("registerDate_year")))
        cardReaderCreateYearCombo.selectByValue("2018")
        driver.findElement(By.id("email_id")).sendKeys("selenium@test.com")
        driver.findElement(By.id("address_id")).sendKeys("Peres Goth 12")
        this.clickByWhenIsVisible('#createBtn', 'id')

        // Give book
        this.clickByWhenIsVisible('give_book', 'name')
        Select giveBookCombo = new Select(driver.findElement(By.id("give_book_id")))
        giveBookCombo.selectByIndex(1)
        this.clickByWhenIsVisible('give_btn_id', 'id')

        // Send email
        this.clickByWhenIsVisible('name_1', 'name')
        this.waitForAjax()
        this.clickByWhenIsVisible('modal_btn_id', 'id')

        /*
         * compare the actual title of the page with the expected one and print
         * the result as "Passed" or "Failed"
         */
        if (actualTitle.contentEquals(expectedTitle)) {
            System.out.println("Test Passed!");
        } else {
            System.out.println("Test Failed");
        }

//        driver.close();
    }

    void clickByWhenIsVisible(String lookup, String byType, int count = 0) {
        count++
        try {
            switch (byType) {
                case 'id':
                    driver.findElement(By.id(lookup)).click()
                    break
                case 'name':
                    driver.findElement(By.name(lookup)).click()
                    break
                case 'linkText':
                    driver.findElement(By.linkText(lookup)).click()
                    break
            }
        }
        catch (NoSuchElementException e) {
            if (count > maxDepth) {
                throw e
            }
            System.out.println(e.getMessage())
            Thread.sleep(100)
            this.clickByWhenIsVisible(lookup, byType, count)
        }
        catch (ElementNotVisibleException e) {
            if (count > maxDepth) {
                throw e
            }
            System.out.println(e.getMessage())
            Thread.sleep(100)
            this.clickByWhenIsVisible(lookup, byType, count)
        }
    }

    void waitForAjax() throws InterruptedException {
        def count = 0
        while (true) {
            count++
            if (count > maxDepth) {
                throw new Exception('Ajax not response too much time!')
            }
            Boolean ajaxIsComplete = (Boolean) ((JavascriptExecutor) driver).executeScript("return jQuery.active == 0")
            if (ajaxIsComplete) {
                Thread.sleep(500)
                break
            }
            Thread.sleep(100)
        }
    }
}
