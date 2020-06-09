*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    AccountForTest    accepter    expenditure    2000    Taipei    Test    stvProject
Test Teardown    Run Keywords    Go To Account Page
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-68 Delete all transactions
    Go To Account Page
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center" and @text="AccountForTest"]
    Click Element After It Is Visible    //*[@text="刪除舊交易"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/date"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/mdtp_date_picker_year"]
    Click Element After It Is Visible    //*[@text="2020"]
    Click Element After It Is Visible    //*[contains(@content-desc,"30")]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/mdtp_ok"]
    Common::Click Ok Button
    Transaction::Filter::Click Ok Button
    Go To Detail Page
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="+1,000.00 Dhs."]