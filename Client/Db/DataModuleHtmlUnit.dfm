object DataModuleHtml: TDataModuleHtml
  OldCreateOrder = False
  Height = 332
  Width = 526
  object ConnDavanzam: TSQLConnection
    ConnectionName = 'DB2Connection'
    DriverName = 'DB2'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDb2'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXDb2MetaDataCommandFactory,DbxDb2Driver' +
        '250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXDb2MetaDataCommandFactor' +
        'y,Borland.Data.DbxDb2Driver,Version=24.0.0.0,Culture=neutral,Pub' +
        'licKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverDB2'
      'LibraryName=dbxdb2.dll'
      'VendorLib=db2cli.dll'
      'VendorLibWin64=db2cli64.dll'
      'MaxBlobSize=-1'
      'DriverName=DB2'
      'Database=sample'
      'User_Name=db2admin'
      'Password=ngatti345'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'Decimal Separator=.')
    Left = 296
    Top = 96
  end
  object DSTemp: TDataSource
    DataSet = Qtemp
    Left = 280
    Top = 168
  end
  object Qtemp: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConnDavanzam
    Left = 288
    Top = 248
  end
end
