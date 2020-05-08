*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                     AND    Create A New Account    accountName=AccountForTest
Test Teardown    Run Keywords    Delete Account    NewAccountName
...                        AND    Close Application

*** Test Cases ***
FT-04 Modify the account name
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]//*[@text="AccountForTest"]
    Click Element After It Is Visible    //*[@text="編輯"]
    Clear Text After It Is Visible    //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.RelativeLayout[1]/android.widget.EditText[1]
    Input Text After It Is Visible    //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    NewAccountName
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    ${actualAccountName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Be Equal    ${actualAccountName}    NewAccountName

*** Keywords ***
Create A New Account
    [Arguments]    ${accountName}
    Click Element After It Is Visible    android:id/button1
    Click Element After It Is Visible   //*[@resource-id="ru.orangesoftware.financisto:id/bAdd"]
    Input Text After It Is Visible   //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    ${accountName}
    Wait Until Element Is Visible On Page    //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[2]/android.widget.RelativeLayout[1]/android.widget.EditText[1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/currency_add"]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/select_dialog_listview"]
    Click Element After It Is Visible    //*[@text="AED (United Arab Emirates dirham)"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    3000
    Input Text After It Is Visible    //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[5]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    This is a test
    Input Text After It Is Visible    //android.widget.ScrollView/android.widget.LinearLayout[1]/android.widget.LinearLayout[6]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    1
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
