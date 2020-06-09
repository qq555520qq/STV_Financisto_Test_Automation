*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Open Financisto Application
Test Teardown    Close Application

*** Test Cases ***
FT-67 Set password for app
    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[5]//*[@text="選單"]
    Click Element After It Is Visible    //*[@text="設定選項"]
    Swipe    24    1145    144    400
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.LinearLayout[6]/android.widget.LinearLayout[1]/android.widget.CheckBox[1]
    Click Element After It Is Visible    //*[@text="更改密碼"]
    Input App Password
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/alertTitle" and @text="確認密碼"]
    Input App Password
    Close Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=5.1.1    deviceName=emulator-5554    appPackage=ru.orangesoftware.financisto    appActivity=.activity.MainActivity    noReset=true
    Input App Password
    Wait Until Element Is Visible On Page    android:id/tabs

*** Keywords ***
Input App Password
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/b0"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/b0"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/b0"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/b0"]
    Click Element After It Is Visible    ru.orangesoftware.financisto:id/bClear