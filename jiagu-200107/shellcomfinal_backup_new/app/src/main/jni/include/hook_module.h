/*===============================================================
*   Copyright (C) 2016 All rights reserved.
*
*   �ļ����ƣ�hook_module.h
*   �� �� �ߣ�genglei.cuan@godinsec.com
*   �������ڣ�2016��05��16��
*   ��    ������ELF�ļ��Ĳ���
*
*   ������־��
*
================================================================*/

#ifndef HOOKMODULE_H
#define HOOKMODULE_H

#include "godin_type.h"
#include <string>
#include <set>

using namespace std;
// Android uses RELA for aarch64 and x86_64. mips64 still uses REL.
#if defined(__aarch64__) || defined(__x86_64__)
#define USE_RELA 1
#endif

namespace GodinHook {

  /**
   * @brief The HookModule class
   * �Ե���hook������elf�ļ��ĳ���
   */
  class HookModule{


  public:
    HookModule(string name,size_t base_addr):module_name_(name),base_addr_(base_addr),
                                             bias_addr_(0),isRegistered(false),ehdr_(NULL),
                                             phdr_(NULL),shdr_(NULL),dyn_ptr_(NULL),dyn_size_(0),
                                             sym_ptr_(NULL),sym_size_(0),
                                             dyn_rela_(NULL),dyn_rela_count_(0),dyn_rel_(NULL),dyn_rel_count_(0),is_has_gnu_hash_(false){}

   bool initModule();

   ELFW(Addr) getBias(){ return this->bias_addr_;}

   /**
    * @brief findSymbolByName
    * ����symbol��Ӧ��Symbol table entry��ַ��
    * ����Symbol table�е�����
    * @param symbol(input)
    * �����ҵķ�������
    * @param sym(out)
    * symbol��Ӧ��Symbol table entry��ַ
    * @param symidx(out)
    * ��Symbol table�е�����
    * @return
    * ����true����ʾ���ҳɹ���
    * ����false,��ʾ����ʧ�ܣ�
    */
   bool findSymbolByName(const char *symbol,  ELFW(Sym) **sym, int *symidx);

   bool hook(const char *originalFunc, void *newFunc, void **backFunc);

   bool unhook(const char *originalFunc, void *backFunc);


   /**
    * @brief isSymbolAllreadyHooked
    * ���Ŷ�Ӧ�ķ����Ƿ��Ѿ���hook
    * @param symbol
    * ��������
    * @return
    * true,�Ѿ���hook��
    * false,û�б�hook;
    */
   bool isSymbolAllreadyHooked(string symbol);

   /**
    * @brief addHookedSymbol
    * ���ѱ�hook��symbol����set��
    * @param symbol
    * �ѱ�hook��sybol
    */
   void addHookedSymbol(string symbol);
   void removeHookedSymbol(string symbol);
   string getModuleName(){return this->module_name_;}
   bool getIsRegistered() const{return this->isRegistered;}
   void setIsRegistered(bool value){this->isRegistered = true;}

  private:

   /**
    * @brief gnuHash
    * Android 6.0֮�����gnuhash
    * @param s
    * @return
    * �����ַ�����Ӧ��gnu hash ֵ
    */
   static uint_fast32_t gnuHash (const char *name);

   /**
    * @brief elfHash
    * Android 6.0֮ǰ����elf hash
    * @param name
    * @return
    * �����ַ�����Ӧ��elf hash ֵ
    */
   static uint32_t elfHash(const char * name);

   /**
    * @brief gnuLookup
    * ����gnu hash ����symbol��Ӧ��Symbol table entry��ַ��
    * ����Symbol table�е�����
    * @param symbol(input)
    * �����ҵķ�������
    * @param sym(out)
    * symbol��Ӧ��Symbol table entry��ַ
    * @param symidx(out)
    * ��Symbol table�е�����
    * @return
    * ����true����ʾ���ҳɹ���
    * ����false,��ʾ����ʧ�ܣ�
    */
   bool gnuLookup(char const* symbol, ELFW(Sym) **sym, int *symidx);
   /**
    * @brief elfLookUp
    * ����elf hash ����symbol��Ӧ��Symbol table entry��ַ��
    * ����Symbol table�е�����
    * @param symbol(input)
    * �����ҵķ�������
    * @param sym(out)
    * symbol��Ӧ��Symbol table entry��ַ
    * @param symidx(out)
    * ��Symbol table�е�����
    * @return
    * ����true����ʾ���ҳɹ���
    * ����false,��ʾ����ʧ�ܣ�
    */
   bool elfLookUp(char const* symbol, ELFW(Sym) **sym, int *symidx);


   bool hookFunction(void* originalFunc, void *newFunc, void **backFunc);

   bool unhookFunction(void* originalFunc, void *backFunc);

  protected:

      typedef set<string> HookSymbol;
      HookSymbol hook_symbol_set_;

      ELFW(Addr)      base_addr_;    /// < elf ģ�����ڴ��еĻ���ַ
      ELFW(Addr)      bias_addr_;    /// < LOAD��ʵ�ʼ��صĵ�ַ��ͨ��elf��Ϣ��������ĵ�ַ�Ĳ�ֵ
      string          module_name_;  /// < elf ģ������֣�����·��+���֣�
      bool            isRegistered;   /// < �Ƿ�ע��
      bool            is_has_gnu_hash_; /// < 6.0֮����ô�hash



      /// ���__LP64__
      ELFW(Rela)* plt_rela_;      /// < elf �ļ� relocation(rela) headers ��ַ
      size_t plt_rela_count_;     /// < relocation(rela) headers entry����
      ELFW(Rela)* dyn_rela_;
      size_t dyn_rela_count_;


      /// ���32
      ELFW(Rel)* plt_rel_;        /// < elf �ļ� relocation(rela) headers ��ַ
      size_t plt_rel_count_;      /// < relocation(rel) headers entry����
      ELFW(Rel)* dyn_rel_;
      size_t dyn_rel_count_;

      uint8_t* android_relocs_;
      size_t android_relocs_size_;
  protected:

      ELFW(Ehdr)  *ehdr_;      /// < elf �ļ� headers ��ַ
      ELFW(Phdr)  *phdr_;      /// < elf �ļ� program headers ��ַ
      ELFW(Shdr)  *shdr_;      /// < elf �ļ� section headers ��ַ

      ELFW(Dyn)   *dyn_ptr_;   /// < elf �ļ� dynamic headers
      ELFW(Word)   dyn_size_;   /// < dynamic headers ��С

      ELFW(Sym)    *sym_ptr_;  /// < elf �ļ� symbol headers ��ַ
      ELFW(Word)   sym_size_;  /// < symbol headers ��С



      const char* strtab_; /// < elf �ļ��ַ������ַ
  protected:
      //for elf hash
       size_t nbucket_;
       size_t nchain_;
       uint32_t* bucket_;
       uint32_t* chain_;

      //for gnu hash
       size_t gnu_nbucket_;
       uint32_t* gnu_bucket_;
       uint32_t* gnu_chain_;
       uint32_t gnu_maskwords_;
       uint32_t gnu_shift2_;
       ELFW(Addr)* gnu_bloom_filter_;

  };

}
#endif // HOOKMODULE_H
