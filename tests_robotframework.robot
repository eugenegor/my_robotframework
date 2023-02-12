*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${SIGNINBUTTON}     xpath=//*[text()='Sign in']
${EMAILINPUT}     xpath=//*[@id='login']
${PASSWORDINPUT}     xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/header/div/h6
${ADDPLAYERPAGELOGO}  //div[2]/form/div[1]/div/span
${ADD BUTTON}    //*[text()='Add player']
${ADD A MATCH FORM URL}     https://scouts-test.futbolkolektyw.pl/en/players/add
${EMAIL FORM}       //*[@name='email']
${NAME FORM}        //input[@name='name']
${SURNAME FORM}     //input[@name='surname']
${AGE FORM}     //input[@name='age']
${MAIN POSITION FORM}       //input[@name='mainPosition']
${SUBMIT BUTTON ADD PAGE}       xpath=//div[3]/button[1]/span[1]
${WARRING TEXT LOGIN}       //span[contains(@class, 'MuiTypography-colorError')]
${LANGUAGE BUTTON}       //ul[2]/div[1]/div[2]/span
${RIGHT LEG CHOOSE BUTTON}      //*[@data-value='right']










*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser
Add a player page
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard

    Click on add button
    Assert add a player page
    [Teardown]    Close Browser
Fill the form
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard

    Click on add button
    Assert add a player page

    Type in forms
    Click Submit button add page
    [Teardown]    Close Browser
Negative test
    Open login page2
    Type in email2
    Type in password2
    Click on the Submit button2
    Assert warring message
    [Teardown]    Close Browser
Language button
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard

    Click on add button
    Assert add a player page
    Click on language button
    [Teardown]    Close Browser
Youtube fill and delete
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on add button
    Assert add a player page
    Fill and delete youtube form
    [Teardown]    Close Browser
Choose leg
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on add button
    Click leg and click rihgt leg
    [Teardown]    Close Browser
Sign out
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click on add button
    Click sign out button
    [Teardown]    Close Browser

                                             #Login to the system

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}    Test-1234
Click on the Submit button
    Click Element      xpath=//*[text()='Sign in']
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel

                                                 #Add a player page

*** Keywords ***
Click on add button
    Click Element    //*[text()='Add player']
Assert add a player page
    Wait Until Element Is Visible    ${ADDPLAYERPAGELOGO}
    Title Should Be     Add player
    Capture Page Screenshot    alert.png

                                                  #Fill the form

*** Keywords ***
Type in forms
    Input Text     ${EMAIL FORM}    qwe@gmail
    Input Text     ${NAME FORM}    Mihal
    Input Text     ${SURNAME FORM}    Zazeckii
    Input Text     ${AGEFORM}    07.05.1996
    Input Text     ${MAIN POSITION FORM}    goalkeeper
Click Submit button add page
    Click Element       xpath=//div[3]/button[1]/span[1]

*** Keywords ***

                                                     #Assert warring message
Open login page2
    Open Browser    ${LOGIN URL}    ${BROWSER}
Type in email2
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password2
    Input Text    ${PASSWORDINPUT}    Test-123
Click on the Submit button2
    Click Element      xpath=//*[text()='Sign in']
Assert warring message
    Wait Until Element Is Visible    ${WARRING TEXT LOGIN}
    Element Text Should Be    //span[contains(@class, 'MuiTypography-colorError')]     Identifier or password invalid.

*** Keywords ***
                                                  #Change language
Click on language button
    Click Element       //ul[2]/div[1]/div[2]/span

*** Keywords ***

                                                     #Youtube fill and delete

Fill and delete youtube form
    Click Element       //div[19]/button/span[1]
    Input Text      //input[@name='webYT[0]']       Youtubechannel
    Click Element       //div[19]/div/button/span[1]


*** Keywords ***

                                                     #Click leg and click rihgt leg

Click leg and click rihgt leg
    Click Element       //*[@id='mui-component-select-leg']
    Wait Until Element Is Visible       ${RIGHT LEG CHOOSE BUTTON}
    Click Element       //*[@data-value='right']

*** Keywords ***

                                                     #Click sign out button
Click sign out button
    Click Element       //ul[2]/div[2]/div[2]/span
