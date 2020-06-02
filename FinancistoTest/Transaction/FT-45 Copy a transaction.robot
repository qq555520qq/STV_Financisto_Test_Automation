*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
Test Teardown    Run Keywords    Delete Transaction    起始金額
...                       AND    Delete Transaction    起始金額
...                       AND    Go To Account Page
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-45 Copy a transaction
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/right_center" and @text="+3,000.00 Dhs."]
    Click Element After It Is Visible    //*[@text="複製"]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="+3,000.00 Dhs."]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[2]//*[@text="+3,000.00 Dhs."]