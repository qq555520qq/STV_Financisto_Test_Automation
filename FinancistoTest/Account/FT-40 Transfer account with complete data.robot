*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    AccountForTest
...                    AND    Create A New Account    AccountForTransfer
Test Teardown    Close Application
# 未寫完
*** Test Cases ***
FT-40 Transfer account with complete data
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="AccountForTest"]
    Click Element After It Is Visible    //*[@text="移轉"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/account_to"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //*[@text="AccountForTransfer"]
    Wait Until Element Is Visible On Page    //*[@text="AccountForTransfer"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    500
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/rate"]    1
    # Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]//*[@text="500"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/location_add"]
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
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/location_add"]

    