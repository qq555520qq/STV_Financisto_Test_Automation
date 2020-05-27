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
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/primary" and @text="500"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/category_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/primary"]    Test
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/scroll"]/android.widget.LinearLayout[1]/android.widget.LinearLayout[3]/android.widget.LinearLayout[1]/android.widget.LinearLayout[1]/android.widget.ImageView[2]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/sms_number"]    1
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/sms_template"]    2
    Common::Click Ok Button
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/add_attribute"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/name"]    test
    Common::Click Ok Button
    Common::Click Ok Button
    Swipe    24    1145    144    400
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/list"]/android.widget.LinearLayout[4]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]/android.widget.EditText[1]    test
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/location_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    Taipei
    Common::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/location"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="Taipei"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/project_add"]
    Input Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/title"]    project
    Common::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@resource-id="ru.orangesoftware.financisto:id/project"]/android.widget.LinearLayout[1]/android.widget.RelativeLayout[1]//*[@text="project"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/checkbox"]
    Common::Click Save Button
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="2,500.00 Dhs."]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[2]//*[@text="3,500.00 Dhs."]