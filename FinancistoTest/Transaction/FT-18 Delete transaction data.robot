*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    account=AccountForTest    payee=accepter    category=expenditure    money=3000    location=Taipei    remark=This is a test    project=stvProject
Test Teardown    Run Keywords    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-18 Delete transaction data
    Click Element After It Is Visible    //*[@resource-id="android:id/list"]//*[contains(@text,"expenditure")]
    Click Element After It Is Visible    //*[@text="刪除"]
    Click Element After It Is Visible    //*[@resource-id="android:id/button1"]
    Wait Until Page Does Not Contain Element    //*[@resource-id="android:id/list"]//*[@text="expenditure"]