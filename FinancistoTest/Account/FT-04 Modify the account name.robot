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