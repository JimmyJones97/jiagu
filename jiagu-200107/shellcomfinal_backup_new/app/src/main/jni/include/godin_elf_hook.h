/*===============================================================
*   Copyright (C) 2016 All rights reserved.
*
*   �ļ����ƣ�godin_elf_hook.h
*   �� �� �ߣ�genglei.cuan@godinsec.com
*   �������ڣ�2016��05��16��
*   ��    ����hook��ܶ���API
*
*   ������־��
*
================================================================*/

#ifndef GODIN_ELF_HOOK_H
#define GODIN_ELF_HOOK_H

#include "godin_type.h"
#include <string>
#include <map>
#include "hook_module.h"

using namespace std;

namespace GodinHook {

  class GodinELfHook{


  public :

    enum RETINFO{
      GOIDINERR                                    = -1,
      REGISTERED                                   = 0,
      EFL_MODULE_ALLREADY_REGISTERED               = 1,
      HOOKED                                       = 2,
      NOT_ELF_FILE                                 = 3,
      MEM_ERR                                      = 4,
      ELF_MODULE_INIT_ERR                          = 5,
      GODIN_OK                                     = 6,
      ALLREADY_HOOKED                              = 7,
      EFL_MODULE_NOT_REGISTERRD                    = 8,
      HOOKED_ERR                                   = 9,
      NOT_HOOKED                                   = 10,
      UNHOOKED_ERR                                 = 11,
    };
    /**
     * @brief isRegisteredModule
     * �ж�ELF�ļ��Ƿ��Ѿ�ע��
     * @param name
     * ELF�ļ�����
     * @return
     * true,�Ѿ�ע�᣻
     * flase,û��ע�᣻
     */
    static bool isRegisteredModule(string name);

    /**
     * @brief registeredElfModule
     * ע��ELF Module��ע��Ĺ����а����˶Ը�elfģ��dynamic�Ľ���
     * @param name
     * ELF Mdule ����
     * @return
     * �ɹ�����GODIN_OK������EFL_MODULE_ALLREADY_REGISTERED;
     * ʧ�ܷ������� RETINFO
     */
    static RETINFO registeredElfModule(string name,pid_t pid=0);

    /**
     * @brief isHookedInModule
     * ��symbol�Ƿ��Ѿ��ڸ�ģ����hook
     * @param moduleName
     * elf module ģ��
     * @param hookSymbol
     * ����symbol
     * @return
     * true,�Ѿ���hook;
     * false,û�б�hook;
     */
    static bool isHookedInModule(string moduleName,string hookSymbol);


    /**
     * @brief hook
     * ��ָ����ELF Module�е�symbol����hook
     * @param moduleName
     * ELF Moduleģ��HOOKED
     * @param hookSymbol
     * function symbol
     * @param newFunc
     * �滻symbol��Ӧ�ķ���
     * @param backFunc
     * ����symbol��Ӧ��ԭ����
     * @return
     * RETINFO
     */
    static RETINFO hook(string moduleName,string hookSymbol, void *newFunc, void **backFunc);

    /**
     * @brief hookAllRegisteredModule
     * �������Ѿ�ע���ELF Module�е�symbol����hook
     * @param hookSymbol
     * function symbol
     * @param newFunc
     * �滻symbol��Ӧ�ķ���
     * @param backFunc
     * ����symbol��Ӧ��ԭ����
     * @return
     */
    static RETINFO hookAllRegisteredModule(string hookSymbol, void *newFunc, void **backFunc);

    /**
     * @brief unHook
     * ��ָ����ELF Module�е�symbol����unhook
     * @param moduleName
     * ELF Moduleģ��
     * @param hookSymbol
     * function symbol
     * @param backFunc
     * symbol��Ӧ��ԭ��������
     * @return
     * RETINFO
     */
    static RETINFO unHook(string moduleName,string hookSymbol,void *backFunc);

    static RETINFO unHookAllRegisteredModule(string hookSymbol,void *backFunc);

   // static int  hookedCount();


  private:

    static RETINFO hook(HookModule * module,string hookSymbol, void *newFunc, void **backFunc);
    static RETINFO unhook(HookModule * module,string hookSymbol,void *backFunc);

    /**
     * @brief isElfFile
     * �ж�ָ���ڴ��е������Ƿ���һ��elf�ļ�
     * @param baseAddress
     * ָ�����ڴ��ַ
     * @return
     * ����true����elf�ļ���
     * ����false������elf�ļ�
     */
    static bool isElfFile(size_t baseAddress);

    /**
     * @brief GetTargetElfMachine
     * ��ȡ��ǰELF Machine,��֤ELF�ļ�ʱ��Ҫ�õ�
     * @return
     * ���ص�ǰELF Machine
     */
    static int GetTargetElfMachine();

    /**
     * @brief getHookModule
     * ����HookModule
     * @param name
     * �Ѿ�ע��� ELF Module ����
     * @return
     * ����HookModule *
     */
    static HookModule * getHookModule(string name);

  private:
    typedef map<string,HookModule*> ModuleMap;
    static  ModuleMap module_map_;
  };

}
#endif // GODIN_ELF_HOOK_H
