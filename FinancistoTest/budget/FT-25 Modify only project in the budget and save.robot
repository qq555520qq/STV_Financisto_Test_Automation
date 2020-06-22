*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    account=AccountForTest    payee=accepter    category=expenditure    money=3000    location=Taipei    remark=This is a test    project=stvProject
...                    AND    Go To Budget Page
...                    AND    Create A New Budget    name=myBudget    account=AccountForTest    category=expenditure    project=stvProject    money=2000
Test Teardown    Run Keywords    Delete Budget    myBudget
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[2]//*[@text="明細"]
...                       AND    Delete Transaction    expenditure
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-25 Modify only project in the budget and save
    Long Press    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]
    Click Element After It Is Visible    //*[@text="編輯"]
    Click Element After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/project_clear"]
    Budget::Select Project    無專案
    Common::Click Ok Button
    ${actualBudgetName} =    Get Text After It Is Visible    //*[@resource-id="ru.orangesoftware.financisto:id/center"]
    Should Be Equal    ${actualBudgetName}    myBudget