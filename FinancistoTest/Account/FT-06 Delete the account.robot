*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                     AND    Create A New Account    accountName=AccountForTest
Test Teardown    Close Application

*** Test Cases ***
FT-06 Delete the account
    Delete Account    AccountForTest
