*** Settings ***
Library    AppiumLibrary
*** Test Cases ***
Unit test
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.0.0    deviceName=BH9032CN72    appPackage=ru.orangesoftware.financisto    appActivity=.activity.MainActivity
    Close Application