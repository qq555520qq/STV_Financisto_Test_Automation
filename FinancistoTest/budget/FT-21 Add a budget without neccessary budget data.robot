*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    account=AccountForTest    payee=accepter    category=expenditure    money=3000    location=Taipei    remark=This is a test    project=stvProject
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[2]//*[@text="明細"]
...                       AND    Delete Transaction    expenditure
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-21 Add a budget without neccessary budget data
    Go to Budget Page
    Budget::Click Add Button
    Common::Click Cancel Button
