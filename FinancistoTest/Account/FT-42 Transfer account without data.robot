*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    AccountForTest
...                    AND    Create A New Account    AccountForTransfer
Test Teardown    Run Keywords    Go Back
...                       AND    Delete Account    AccountForTest
...                       AND    Delete Account    AccountForTransfer
...                       AND    Close Application

*** Test Cases ***
FT-42 Transfer account without data
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="AccountForTest"]
    Click Element After It Is Visible    //*[@text="移轉"]
    Common::Click Save Button
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/bSave"]

