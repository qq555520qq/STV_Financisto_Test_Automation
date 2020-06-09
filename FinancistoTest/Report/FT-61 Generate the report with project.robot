*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    AccountForTest    accepter    expenditure    2000    Taipei    Test    stvProject
...                    AND    Create A New Transaction    AccountForTest    james    play    500    Taiwan    suite    saProject
Test Teardown    Run Keywords    Go Back
...                       AND    Go Back
...                       AND    Go To Detail Page
...                       AND    Delete Transaction    expenditure
...                       AND    Delete Transaction    play
...                       AND    Go To Account Page
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-61 Generate the report with project
    Go To Report Page
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]//*[@text="以專案統計"]
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.view.View[1]
    Wait Until Element Is Visible On Page    //*[@text="-2,000.00 Dhs."]
    Go Back
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]/android.view.View[2]
    Wait Until Element Is Visible On Page    //*[@text="-500.00 Dhs."]

