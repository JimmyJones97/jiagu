#ifndef HOOKINFO_H
#define HOOKINFO_H

//#include <godin_type.h>
#include <stdint.h>
#include <iostream>
namespace GodinHook {


  enum HookStatus{
    ERRSTATUS = 0,    /*!< ����״̬ */
    REGISTERED,
    HOOKED,           /*!< �Ѿ���hook */
  };

  enum FunctionType{
    ERRTYEPE  = 0,    /*!< �������� */
    ARM,              /*!< ARMָ� */
    THUMB ,           /*!< thumbָ� */
    ARM64,            /*!< ARMV8ָ�*/
  };

class HookInfo{


public :

  /**
   * @brief HookInfo
   *  Ψһ�Ĺ��캯��
   * @param originalAddr
   *  ԭ������ַ
   * @param hookAddr
   *  �·�����ַ
   * @param callOriginalAddr
   *  �洢�ص�ԭ�����ĵ�ַ
   */
  HookInfo(size_t originalAddr,size_t hookAddr,size_t ** callOriginalAddr)
    :original_addr_(originalAddr),hook_addr_(hookAddr),call_original_addr_(callOriginalAddr),
    original_stub_back_(NULL),back_len_(0),call_original_ins_(NULL),hook_status_(ERRSTATUS),
    original_function_type_(ERRTYEPE),hook_function_type_(ERRTYEPE),count(0){}

private:
  /// ���캯���и����ʼ���������ֶ�
  size_t original_addr_;                    /*!< ԭ������ַ */
  size_t hook_addr_;                        /*!< �·�����ַ */
  size_t **call_original_addr_;             /*!< �ص�ԭ���� */

  /// registerAndHook��ʼ���������ֶ�,
  /// unhook������ԴʱҪ�õ�
  uint8_t *original_stub_back_;             /*!< �洢ԭ������stub���ǵĻ����� */
  int    back_len_;                         /*!< ԭ������stub���ǵĻ���ָ���С���༴stub��С */
  uint8_t *call_original_ins_;              /*!< �洢������������ԭ������stub���ǵĻ���ָ��Լ�׷����ת��ԭ����ʣ�����ָ�����תָ��*/

  HookStatus hook_status_;                  /*!< ��ǰhook״̬*/
  FunctionType original_function_type_;     /*!< ԭ����ָ�����*/
  FunctionType hook_function_type_;         /*!< �·���ָ�����*/

public:
  /// Ϊ�˱�֤�̰߳�ȫ
  int orig_boundaries[8];
  int trampoline_boundaries[32];
  int count;

public:

  void setOriginalAddr(size_t addr){
    this->original_addr_ = addr;
  }
  size_t getOriginalAddr(){
    return this->original_addr_;
  }

  void setHookAddr(size_t addr){
    this->hook_addr_ = addr;
  }
  size_t getHookAddr(){
    return this->hook_addr_;
  }

  void setCallOriginalAddr(size_t ** addr){
     this->call_original_addr_ = addr;
  }
  size_t ** getCallOriginalAddr(){
    return this->call_original_addr_;
  }



  void setOriginalStubBack(uint8_t* addr){
    this->original_stub_back_ = addr;
  }
 uint8_t* getOriginalStubBack(){
    return this->original_stub_back_;
  }

  void setBackLen(int len){
    this->back_len_ = len;
  }
  size_t getBackLen(){
    return this->back_len_;
  }

  void setCallOriginalIns(uint8_t* addr){
     this->call_original_ins_ = addr;
  }
  uint8_t* getCallOriginalIns(){
    return this->call_original_ins_;
  }


  void setHookStatus(HookStatus status){
    this->hook_status_ = status;
  }
  HookStatus getHookStatus(){
    return this->hook_status_;
  }

  void setOriginalFunctionType(FunctionType type){
    this->original_function_type_ = type;
  }
  FunctionType getOriginalFunctiontype(){
    return this->original_function_type_;
  }

  void setHookFunctionType(FunctionType type){
    this->hook_function_type_ = type;
  }
  FunctionType getHookFunctionType(){
    return this->hook_function_type_;
  }

};

}
#endif // HOOKINFO_H
