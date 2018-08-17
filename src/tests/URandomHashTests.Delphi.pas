unit URandomHashTests.Delphi;

interface

uses
  Classes, SysUtils, {$IFDEF FPC}fpcunit,testregistry {$ELSE}TestFramework {$ENDIF FPC},
  UUnitTests, HlpIHash;

type

  { TRandomHashTest }

  TRandomHashTest = class(TPascalCoinUnitTest)
  published
    procedure TestRandomHash_Standard;
  end;

implementation

uses variants, UCommon, UMemory, URandomHash, HlpHashFactory, HlpBitConverter, strutils;

const

  { RandomHash Official Values }

  DATA_RANDOMHASH_STANDARD_INPUT : array[1..3] of String = (
    '0x0',
    'The quick brown fox jumps over the lazy dog',
    '0x000102030405060708090a0b0c0d0e0f'
  );

  DATA_RANDOMHASH_STANDARD_EXPECTED : array[1..3] of String = (
    '0x291ef6d7f9babe3d2d4fd6560c7eefc7a9937126fd13d5af6fd0474b6dfac215',
    '0xf0803f016666d6a236701ade96fdc48a23d9eaa8c03097e5e9f690b5142b2537',
    '0x3cc5de8f601ce1ec7adbd765884d6c0f486de4c3a535a36a8658253edb2a80f3'
  );


{ TRandomHashTest }

procedure TRandomHashTest.TestRandomHash_Standard;
var
  i : integer;
begin
  for i := Low(DATA_RANDOMHASH_STANDARD_INPUT) to High(DATA_RANDOMHASH_STANDARD_INPUT) do
    AssertEquals(ParseBytes(DATA_RANDOMHASH_STANDARD_EXPECTED[i]), TRandomHash.Compute(ParseBytes(DATA_RANDOMHASH_STANDARD_INPUT[i])));
    //WriteLn(Format('%s', [Bytes2Hex(TRandomHash.Compute(ParseBytes(LCase.Input)), True)]));
end;


initialization

  RegisterTest(TRandomHashTest.Suite);

end.
