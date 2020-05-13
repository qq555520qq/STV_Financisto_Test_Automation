*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Open Financisto Application
Test Teardown    Close Application

*** Test Cases ***
FT-03 Add an account without neccessary account data
    Click Element After It Is Visible   //*[@resource-id="ru.orangesoftware.financisto:id/bAdd"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //*[contains(@text,請選擇貨幣)]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/currency_add"]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/select_dialog_listview"]
    Click Element After It Is Visible    //*[@text="AED (United Arab Emirates dirham)"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Wait Until Element Is Visible On Page    //android.widget.TextView[@text="名稱"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bCancel"]