codeunit 10040300 "WLD Test Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        BASETestInstall: Codeunit "WLD Test Install";
    begin
        BASETestInstall.SetupTestSuite();
    end;
}