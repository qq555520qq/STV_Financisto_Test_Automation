*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
Test Teardown    Run Keywords    Delete Transaction    payee
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-07 Add a transaction with complete transaction data
    Go To Detail Page
    Detail::Click Add Button
    Transaction::Select Account    AccountForTest
    Transaction::Add Payee    payee
    Transaction::Input Money    300
    Common::Click Save Button
    ${actualAccountName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/top"]
    Should Be Equal    ${actualAccountName}    AccountForTest
    ${actualTransactionInfo} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Contain Any     ${actualTransactionInfo}    payee
    ${actualAccountMoney} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/right_center"]
    Should Be Equal    ${actualAccountMoney}    -3,00.00 Dhs.
