*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Open Financisto Application
Test Teardown    Run Keywords    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-01 Add an account with complete account data
    Click Element After It Is Visible    android:id/button1
    Click Element After It Is Visible   //*[@resource-id="ru.orangesoftware.financisto:id/bAdd"]
    Input Text After It Is Visible   //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    AccountForTest
    Wait Until Element Is Visible On Page    //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.RelativeLayout[1]/android.widget.EditText[1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/currency_add"]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/select_dialog_listview"]
    Click Element After It Is Visible    //*[@text="AED (United Arab Emirates dirham)"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    3000
    Input Text After It Is Visible    //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[5]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    This is a test
    Input Text After It Is Visible    //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[6]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    1
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    ${actualAccountName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Be Equal    ${actualAccountName}    AccountForTest
    ${actualAccountMoney} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/right_center"]
    Should Be Equal    ${actualAccountMoney}    3,000.00 Dhs.

*** Keywords ***
Delete Account
    [Arguments]    ${accountName}
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]//*[@text="${accountName}"]
    Click Element After It Is Visible    //*[@text="Delete account"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]
    Wait Until Page Does Not Contain Element    //*[@resource-id="android:id/list"]//*[@text="${accountName}"]