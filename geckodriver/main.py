import time
from selenium import webdriver

driver = webdriver.Firefox()
driver.get('http://www.google.com/xhtml')
time.sleep(5)
search_box = driver.find_element_by_name('q')
search_box.send_keys('GeckoDriver')
search_box.submit()
time.sleep(5)
driver.quit()
