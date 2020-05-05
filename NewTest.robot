*** Settings ***
Library    AppiumLibrary
*** Test Cases ***
Unit test
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=8.0.0    deviceName=BH9032CN72    appPackage=ru.orangesoftware.financisto    appActivity=.activity.MainActivity
    Click Element After Visible    android:id/button1
    Wait Until Element Is Visible    xpath=//*[@resource-id="android:id/tabs"]//android.widget.RelativeLayout//*[@text="預算"]    timeout=3s
    # Close Application

*** Keywords ***
Click Element After Visible
    [Arguments]    ${locator}
    Wait Until Page Contains Element    ${locator}    timeout=3
    Wait Until Element Is Visible    ${locator}    timeout=3
    Click Element    ${locator}
