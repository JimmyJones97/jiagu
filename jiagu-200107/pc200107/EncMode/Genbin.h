#pragma once

#include <iostream>
#include <fstream>
#include <string>
#include "aescrypt.h"
#include "Ans_dex.h"
using namespace std;

#define textName "class.bin"		//Ĭ�����ɵ�bin�ļ�������	--zhr

#define type_SoSign		1
#define type_DexSign	2
#define type_Cipher		3

#define LenBase		4
#define LenHeader	28
#define LenEnd		12
#define LenSign		32
#define LenKey		16

#define head_name_header	0x64616548
#define head_name_sosign	0x00006F53
#define head_name_dexsign	0x6C656853
#define head_name_crypt		0x79636E45
#define head_name_end		0x6C696154

#define head_flag_header	0x00000091
#define head_flag_sign		0x00000009
#define head_flag_signfalse	0x00000009
#define head_flag_crypt		0x00000021
#define head_flag_end		0x00000019

#define size_head			0x0000001C
#define size_sign			0x00000020
#define size_end			0x0000000C

bool GenBinFlow(char* SoPath, char* SoX86Sign, char* DexPath, char* zipDexPath, char* fakeDexPath, char* KeyInput, char* KeySwitch, char* configPath);

class GenBin
{
public:
	GenBin();
	~GenBin();
	bool GenBinInit();						//���������µĿյ�bin�ļ�	--zhr
	bool HeadInplement(BYTE* keyInput);		//�������ͷ���֣��Լ���ӱ��任����Key	--zhr
	bool AddSoSign(int lenSoSign, const char* SoSign);		//�������So���Macֵ	--zhr
	bool AddDexSign(int lenDexSign, const char* DexSign);	//�������Dex��Macֵ	--zhr
	bool AddCipher(int lenOrigin, int lenCipher, char* CipherFile);		//���������Կֵ		--zhr

	bool GetTextbyType(const char* BinFile, char* pOutput, int type, int _length);	//���ڸ������ͻ��bin�ļ�������	--zhr



private:
	char testName[20];
	bool flagSoSign;
	bool flagDexSign;
	bool flagCipher;
	ofstream fileBin;

	bool EndInplement();	//������������ļ�β�����	--zhr
	bool checkFlag();		//����Ƿ������ֶ�������		--zhr
};

