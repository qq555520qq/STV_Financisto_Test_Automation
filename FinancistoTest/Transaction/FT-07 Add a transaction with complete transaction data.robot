*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
Test Teardown    Run Keywords    Delete Transaction    expenditure
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-07 Add a transaction with complete transaction data
    Go To Detail Page
    Detail::Click Add Button
    Transaction::Select Account    AccountForTest
    Transaction::Add Payee    accpetor
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

*** Keywords ***
Transaction::Add Category
    [Arguments]    ${category}
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/category_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    ${category}
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/category"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="${category}"]

Transaction::Add Location
    [Arguments]    ${location}
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/location_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    ${location}
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/location"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="${location}"]

Transaction::Add Project
    [Arguments]    ${project}
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/project_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    ${project}
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/project"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="${project}"]

Transaction::Input Remark
    [Arguments]    ${text}
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/list"]/android.widget.LinearLayout[8]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    ${text}