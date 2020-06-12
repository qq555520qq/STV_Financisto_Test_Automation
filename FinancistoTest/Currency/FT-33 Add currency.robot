*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application 
Test Teardown    Run Keywords    Delete Currency    currencyName=AED (United Arab Emirates dirham)
...                       AND    Close Application

*** Test Cases ***
FT-33 Add currency
    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[5]
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[2]
    Click Element After It Is Visible    //*[@resource-id="android:id/select_dialog_listview"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bAdd"]
    Click Element After It Is Visible    //*[@text="AED (United Arab Emirates dirham)"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]
    # Wait Until Element Is Visible On Page    //*[@text()="AED"]