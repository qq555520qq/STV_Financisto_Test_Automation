*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Open Financisto Application
Test Teardown    Close Application
# 未寫完
*** Test Cases ***
FT-40 Transfer account with complete data
    Create A New Account    AccountForTest
    Create A New Account    AccountForTransfer
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="AccountForTest"]
    Click Element After It Is Visible    //*[@text="移轉"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/account_to"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //*[@text="AccountForTransfer"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    500
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/category_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    Test
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/scroll"]/android.widget.LinearLayout[1]/android.widget.LinearLayout[3]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.ImageView[2]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/sms_number"]    1
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/sms_template"]    2
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/add_attribute"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/name"]    test
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/list"]/android.widget.LinearLayout[4]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    123
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/location_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    北科
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bOK"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/list"]/android.widget.LinearLayout[6]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    test
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/bSave"]
    