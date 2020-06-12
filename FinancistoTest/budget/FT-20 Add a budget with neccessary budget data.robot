*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    account=AccountForTest    payee=accepter    category=expenditure    money=3000    location=Taipei    remark=This is a test    project=stvProject
Test Teardown    Run Keywords    Delete Budget
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[2]//*[@text="明細"]
...                       AND    Delete Transaction    expenditure
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-20 Add a budget with neccessary budget data
    Go to Budget Page
    Budget::Click Add Button
    Budget::Select Account    AccountForTest
    Common::Click Ok Button
    ${actualBudgetName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Be Equal    ${actualBudgetName}    ${EMPTY}