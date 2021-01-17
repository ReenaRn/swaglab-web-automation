#!/usr/bin/env python
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.opera import OperaDriverManager
import os

def set_web_driver(browser):
    if browser == 'chrome':
        s = ChromeDriverManager().install()
        s = s.replace('chromedriver.exe', '')
        os.environ['PATH'] = os.environ['PATH'] + ';' + s
    elif browser == 'opera':
        s = OperaDriverManager().install()
        s = s.replace('operadriver.exe', '')
        os.environ['PATH'] = os.environ['PATH'] + ';' + s
