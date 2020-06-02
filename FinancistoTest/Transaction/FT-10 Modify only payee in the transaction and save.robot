*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Create A New Transaction    accountName=AccountForTest
Test Teardown    Run Keywords    Delete Transaction    expenditure
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-10 Modify only payee in the transaction and save
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[2]
    Click Element After It Is Visible    //*[@text="編輯"]
    Transaction::Add Payee    payee
    Common::Click Save Button
    ${actualAccountName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/top"]
    Should Be Equal    ${actualAccountName}    AccountForTest
    ${actualTransactionInfo} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Contain Any     ${actualTransactionInfo}    expenditure    payee    Taipei    This is a test
    ${actualAccountMoney} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/right_center"]
    Should Be Equal    ${actualAccountMoney}    -3,000.00 Dhs.

*** Keywords ***
Create A New Transaction
    [Arguments]    ${accountName}
    Go To Detail Page
    Detail::Click Add Button
    Transaction::Select Account    ${accountName}
    Transaction::Add Payee    acceptor
    Transaction::Add Category    expenditure
    Transaction::Input Money    3000
    Transaction::Add Location    Taipei
    Transaction::Input Remark    This is a test
    Transaction::Add Project    stvProject
    Common::Click Save Button
    ${actualAccountName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/top"]
    Should Be Equal    ${actualAccountName}    AccountForTest
    ${actualTransactionInfo} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Contain Any     ${actualTransactionInfo}    expenditure    acceptor    Taipei    This is a test
    ${actualAccountMoney} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/right_center"]
    Should Be Equal    ${actualAccountMoney}    -3,000.00 Dhs.