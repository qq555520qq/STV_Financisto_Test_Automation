*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application 
...                    AND    Create A Currency    currencyName=CNY (Chinese yuan)
Test Teardown    Run Keywords    Delete Currency    currencyName=CNY (Chinese yuan)
...                       AND    Close Application

*** Test Cases ***
FT-36 Modify CNY currency and save
    Long Press    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //android.widget.ListView/android.widget.LinearLayout[1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerDecimals"]
    Click Element After It Is Visible    //*[@resource-id="android:id/text1"][2]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerDecimalSeparators"]
    Click Element After It Is Visible    //*[@resource-id="android:id/text1"][1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/spinnerGroupSeparators"]
    Click Element After It Is Visible    //*[@resource-id="android:id/text1"][2]
    Common::Click Ok Button