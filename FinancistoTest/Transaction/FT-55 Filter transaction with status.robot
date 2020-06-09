*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    AccountForTest    accepter    expenditure    2000    Taipei    Test    stvProject
...                    AND    Create A New Transaction    AccountForTest    james    play    1000    Taiwan    suite    saProject
Test Teardown    Run Keywords    Delete Transaction    expenditure
...                       AND    Go To Account Page
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-55 Filter transaction with status
    Click Element After It Is Visible    ru.orangesoftware.financisto:id/bFilter
    Click Element After It Is Visible    //*[@text="狀態"]
    Click Element After It Is Visible    //*[@text="未出(入)帳"]
    Wait Until Element Is Visible On Page    //*[@text="未出(入)帳"]
    Common::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="-1,000.00 Dhs."]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[2]//*[@text="-2,000.00 Dhs."]