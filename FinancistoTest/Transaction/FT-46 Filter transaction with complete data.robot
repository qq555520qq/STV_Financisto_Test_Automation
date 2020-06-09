*** Settings ***
Library    AppiumLibrary
Resource    ../Keywords.txt
Test Setup    Run Keywords    Open Financisto Application
...                    AND    Create A New Account    accountName=AccountForTest
...                    AND    Go To Detail Page
...                    AND    Create A New Transaction    AccountForTest    accepter    expenditure    2000    Taipei    Test    stvProject
...                    AND    Create A New Transaction    AccountForTest    james    play    1000    Taiwan    suite    saProject
Test Teardown    Run Keywords    Delete Transaction    expenditure
...                       AND    Go To Account Page
...                       AND    Delete Account    AccountForTest
...                       AND    Close Application

*** Test Cases ***
FT-46 Filter transaction with complete data
    Click Element After It Is Visible    ru.orangesoftware.financisto:id/bFilter
    Click Element After It Is Visible    //*[@text="期間"]
    Common::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@text="今天"]
    Click Element After It Is Visible    //*[@text="帳戶"]
    Click Element After It Is Visible    android:id/select_dialog_listview
    Wait Until Element Is Visible On Page    //*[@text="AccountForTest"]
    Click Element After It Is Visible    //*[@text="貨幣"]
    Click Element After It Is Visible    android:id/select_dialog_listview
    Wait Until Element Is Visible On Page    //*[@text="United Arab Emirates dirham"]
    Click Element After It Is Visible    //*[@text="分類"]
    Click Element After It Is Visible    //*[@text="expenditure"]
    Wait Until Element Is Visible On Page    //*[@text="expenditure"]
    Click Element After It Is Visible    //*[@text="受款人"]
    Click Element After It Is Visible    //*[@text="accepter"]
    Transaction::Filter::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@text="accepter"]
    Click Element After It Is Visible    //*[@text="專案"]
    Click Element After It Is Visible    //*[@text="stvProject"]
    Transaction::Filter::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@text="stvProject"]
    Click Element After It Is Visible    //*[@text="地點"]
    Click Element After It Is Visible    //*[@text="Taipei"]
    Transaction::Filter::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@text="Taipei"]
    Click Element After It Is Visible    //*[@text="備註"]
    Input Text After It Is Visible    ru.orangesoftware.financisto:id/edNoteContaining    Test
    Common::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@text="備註內容包含「Test」"]
    Click Element After It Is Visible    //*[@text="狀態"]
    Click Element After It Is Visible    //*[@text="未出(入)帳"]
    Wait Until Element Is Visible On Page    //*[@text="未出(入)帳"]
    Click Element After It Is Visible    //*[@text="排序"]
    Click Element After It Is Visible    //*[@text="從新到舊"]
    Wait Until Element Is Visible On Page    //*[@text="從新到舊"]
    Common::Click Ok Button
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[1]//*[@text="-1,000.00 Dhs."]
    Wait Until Element Is Visible On Page    //*[@resource-id="android:id/list"]/android.widget.RelativeLayout[2]//*[@text="-2,000.00 Dhs."]