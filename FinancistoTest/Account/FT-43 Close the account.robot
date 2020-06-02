*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    AccountForTest
Test Teardown    Run Keywords    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-43 Close the account
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="AccountForTest"]
    Click Element After It Is Visible    //*[@text="關閉帳戶"]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/message" and @text="Close account?"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]//*[@resource-id="ru.orangesoftware.financisto:id/active_icon"]

