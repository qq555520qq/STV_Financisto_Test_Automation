*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                     AND    Create A New Account    accountName=AccountForTest
# Test Teardown    Run Keywords    Delete Account    AccountForTest
# ...                        AND    Close Application

*** Test Cases ***
FT-07 Add a transaction with complete transaction data
    Click Element After It Is Visible    //*[@text="明細"]
    Click Element After It Is Visible   //*[@resource-id="ru.orangesoftware.financisto:id/bAdd"]
    Click Element After It Is Visible    //*[@text="帳戶"]
    Click Element After It Is Visible    //*[@resource-id="android:id/select_dialog_listview"]//*[@text="AccountForTest"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/account"]/android.widget.RelativeLayout[1]//*[@text="AccountForTest"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/payee_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    acceptor
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/payee"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="acceptor"]