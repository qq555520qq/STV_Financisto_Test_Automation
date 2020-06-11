*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    account=AccountForTest    payee=accepter    category=expenditure    money=3000    location=Taipei    remark=This is a test    project=stvProject
Test Teardown    Run Keywords    Delete Budget    AccountForTest
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[2]//*[@text="明細"]
...                       AND    Delete Transaction    expenditure
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-19 Add a budget with complete budget data
    Go to Budget Page
    Budget::Click Add Button
    Budget::Input Name    myBudget
    Budget::Select Account    AccountForTest
    Budget::Select Category    expenditure
    Budget::Select Project    stvProject
    Budget::Input Money    2000
    Common::Click Ok Button
    ${actualAccountName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Be Equal    ${actualAccountName}    myBudget