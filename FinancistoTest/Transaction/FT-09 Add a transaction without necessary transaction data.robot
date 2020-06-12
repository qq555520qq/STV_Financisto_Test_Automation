*** Settings ***
Library    AppiumLibrary
# Library    ../../financialAppiumLibrary.py
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
Test Teardown    Run Keywords    Delete Transaction
...                       AND    Click Element After It Is Visible    //*[@resource-id="android:id/tabs"]/android.widget.RelativeLayout[1]//*[@text="帳戶"]
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-09 Add a transaction without neccessary transaction data
    Go To Detail Page
    Detail::Click Add Button
    Go Back
