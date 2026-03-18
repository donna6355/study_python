#Selenium : Web Front Testing tool 
#useful to run browser and collect data from it automatically

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
import time 


#webdriver : connect python and browser
#service : which browser to use
#chromeDriverManager : to use Chrome Driver

def get_chrome_driver():
  #chrome option setting
  chrome_options = webdriver.ChromeOptions()

  #create driver
  driver = webdriver.Chrome(
    service=Service(ChromeDriverManager().install()),
    options=chrome_options
  )

  return driver

driver = get_chrome_driver()

driver.get("https://www.naver.com/")

time.sleep(5)
driver.find_element(By.CSS_SELECTOR,'#query').send_keys("고양이")
driver.find_element(By.CSS_SELECTOR, ".btn_search").click()

time.sleep(5)


# driver.find_element(By.CSS_SELECTOR,'#nx_query').clear()
# driver.find_element(By.CSS_SELECTOR,'#nx_query').send_keys("냐옹이")


#window size
driver.set_window_size(800,800)

#infinite scroll
driver.execute_script('window.scrollTo(50,1600);')

#fetch html
page = driver.page_source
print(page)

time.sleep(5)
driver.quit()

