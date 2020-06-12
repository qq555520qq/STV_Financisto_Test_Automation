*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application 
...                    AND    Create A Currency    currencyName=TWD (New Taiwan dollar)
Test Teardown    Run Keywords    Delete Currency    currencyName=TWD (New Taiwan dollar)
...                       AND    Close Application

*** Test Cases ***
FT-34 Modify TWD currency and save
    Long Press    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //android.widget.ListView/android.widget.LinearLayout[1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerDecimals"]
    Click Element After It Is Visible    //*[@text()="1"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerDecimalSeparators"]
    Click Element After It Is Visible    //*[@text()="\',\'"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerGroupSeparators"]
    Click Element After It Is Visible    //*[@text()="\'.\'"]