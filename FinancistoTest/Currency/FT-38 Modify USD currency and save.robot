*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application 
...                    AND    Create A Currency    currencyName=USD (United States dollar)
Test Teardown    Run Keywords    Delete Currency    currencyName=USD (United States dollar)
...                       AND    Close Application

*** Test Cases ***
FT-38 Modify USD currency and save
    Long Press    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //android.widget.ListView/android.widget.LinearLayout[1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerDecimals"]
    Click Element After It Is Visible    //*[@text()="1"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerDecimalSeparators"]
    Click Element After It Is Visible    //*[@text()="\',\'"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerGroupSeparators"]
    Click Element After It Is Visible    //*[@text()="\'.\'"]