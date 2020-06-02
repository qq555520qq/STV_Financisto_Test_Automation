*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    AccountForTest
...                    AND    Create A New Account    AccountForTransfer
Test Teardown    Run Keywords    Delete Account    AccountForTest
...                       AND    Delete Account    AccountForTransfer
...                       AND    Close Application

*** Test Cases ***
FT-41 Transfer account with only account
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="AccountForTest"]
    Click Element After It Is Visible    //*[@text="移轉"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/account_to"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //*[@text="AccountForTransfer"]
    Wait Until Element Is Visible On Page    //*[@text="AccountForTransfer"]
    Common::Click Save Button
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="3,000.00 Dhs."]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[2]//*[@text="3,000.00 Dhs."]