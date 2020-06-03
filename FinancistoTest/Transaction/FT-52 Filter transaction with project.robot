*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    AccountForTest    accpetor    expenditure    2000    Taipei    Test    stvProject
...                    AND    Create A New Transaction    AccountForTest    accpetor    expenditure    1000    Taipei    Test    stvProject
Test Teardown    Run Keywords    Delete Transaction    expenditure
...                       AND    Go To Account Page
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-52 Filter transaction with project
    Click Element After It Is Visible    ru.orangesoftware.financisto:id/bFilter
    Click Element After It Is Visible    //*[@text="專案"]
    Click Element After It Is Visible    //*[@text="stvProject"]
    Transaction::Filter::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@text="stvProject"]
    Common::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="-2,000.00 Dhs."]