*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application 
...                    AND    Create A Currency    currencyName=AED (United Arab Emirates dirham)
Test Teardown    Close Application

*** Test Cases ***
FT-39 Delete currency
    Long Press    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //android.widget.ListView/android.widget.LinearLayout[2]/android.widget.RelativeLayout[1]
    Wait Until Page Does Not Contain Element    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text()="AED"]    timeout=3s    error=AED currency should not be visible.

*** Keywords ***
Create A Currency 
    [Arguments]    ${currencyName}
    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[5]
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[2]
    Click Element After It Is Visible    //*[@resource-id="android:id/select_dialog_listview"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bAdd"]
    Click Element After It Is Visible    //*[@text="${currencyName}"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]