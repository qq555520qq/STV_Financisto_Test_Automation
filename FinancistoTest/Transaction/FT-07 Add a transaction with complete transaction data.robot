*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
Test Teardown    Run Keywords    Delete Transaction    category (acceptor: Taipei: This is a test)
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-07 Add a transaction with complete transaction data
    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[2]//*[@text="明細"]
    Click Element After It Is Visible   //*[@resource-id="ru.orangesoftware.financisto:id/bAdd"]
    Click Element After It Is Visible    //*[@text="帳戶"]
    Click Element After It Is Visible    //*[@resource-id="android:id/select_dialog_listview"]//*[@text="AccountForTest"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/account"]/android.widget.RelativeLayout[1]//*[@text="AccountForTest"]
    
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/payee_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    acceptor
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/payee"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="acceptor"]
    
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/category_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    category
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/category"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="category"]
    
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    3000
    
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/location_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    Taipei
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/location"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="Taipei"]
    
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/list"]/android.widget.LinearLayout[8]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    This is a test
    
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/project_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    StvProject
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bSave"]
    
    ${actualAccountName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/top"]
    Should Be Equal    ${actualAccountName}    AccountForTest
    ${actualTransactionInfo} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Be Equal    ${actualTransactionInfo}    category (acceptor: Taipei: This is a test)
    ${actualAccountMoney} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/right_center"]
    Should Be Equal    ${actualAccountMoney}    -3,000.00 Dhs.

*** Keywords ***
Delete Transaction
    [Arguments]    ${transactionInfo}
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]//*[@text="${transactionInfo}"]
    Click Element After It Is Visible    //*[@text="刪除"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]
    Wait Until Page Does Not Contain Element    //*[@resource-id="android:id/list"]//*[@text="${transactionInfo}"]





