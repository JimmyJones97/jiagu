#ifndef NATIVE_HOOK_H
#define NATIVE_HOOK_H

#include <map>
#include <string>
#include <hookinfo.h>

using namespace std;

namespace  GodinHook {

  enum GODINHOOK_STATUS {
    GODINHOOK_ERROR_UNKNOWN = -1,
    GODINHOOK_OK = 0,
    GODINHOOK_ERROR_NOT_INITIALIZED,
    GODINHOOK_ERROR_NOT_EXECUTABLE,
    GODINHOOK_ERROR_NOT_REGISTERED,
    GODINHOOK_ERROR_NOT_HOOKED,
    GODINHOOK_ERROR_ALREADY_REGISTERED,
    GODINHOOK_ERROR_ALREADY_HOOKED,
    GODINHOOK_ERROR_SO_NOT_FOUND,
    GODINHOOK_ERROR_FUNCTION_NOT_FOUND,
    GODINHOOK_ERROR_MEMORY
  };

  class NativeHook{

  public:

    /**
     * @brief registeredHook
     *  ע��ɹ��󣬾Ͷ���ص�ָ��������������Լ������ûص�ԭ�����Ļ�������Ҫ��Ϊ���̰߳�ȫ��׼����
     *
     * @param originalFunAddress
     *  ԭ������ַ
     * @param newFunAddress
     *  �º�����ַ
     * @param callOriginal
     *  �洢�ص�ԭ�����ĵ�ַ
     *
     * @return
     *  ���� GODINHOOK_OK����ʾע��ɹ�;
     *  ���� GODINHOOK_ERROR_ALREADY_REGISTERED����ʾ�Ѿ�ע�᣻
     *  ���� GODINHOOK_ERROR_ALREADY_HOOKED����ʾ�Ѿ�hook.
     *  ��������,��ע��ʧ�ܡ�
     */
    static int registeredHook(size_t originalFunAddress,size_t newFunAddress,size_t ** callOriginal);

    /**
     * @brief hook
     *  �����ṩ��hook�����Ľӿڣ�ִ�гɹ��������hook��
     *
     *  �˷�����Ҫ�Ե�ǰ�����е��߳̽��м�飬�����������б�hook��
     *  �������̣߳����б�Ҫ��������
     *
     * @param originalFunAddress
     *  ԭ������ַ
     *
     * @return
     *  ���� GODINHOOK_OK����ʾhook�ɹ�;
     *  ���� GODINHOOK_ERROR_ALREADY_HOOKED����ʾ�Ѿ�hook.
     *  ������������hookʧ��
     */
    static int hook(size_t originalFunAddress);

    /**
     * @brief isAlreadyHooked
     * �жϸ÷����Ƿ�hook��
     * @param originalFunAddress
     * ������ַ
     * @return
     * NULL������δ��HOOK��
     * ���򷵻�hook�����ĵ�ַ��
     */
    static void* isAlreadyHooked(size_t originalFunAddress);

    /**
     * @brief getHookedCount
     * ��ǰ��hook�ķ���������
     * @return
     * ���ص�ǰ��hook�ķ���������
     */
    static int getHookedCount();

    /**
     * @brief unHook
     * ж��hook
     * @param originalFunAddress
     * ԭ������ַ
     * @return
     * true��ʾж�سɹ���
     * ��֮ж��ʧ�ܡ�
     */
    static bool unHook(size_t originalFunAddress);


    /**
     * @brief getAllHookInfo
     * �õ���ǰ���е�HookInfo,��Ҫ�ֶ��ͷŷ���ֵָ��Ŀռ�
     * @return
     * ���ش洢�е�ǰ����HookInfo��ַ������
     */
    static HookInfo ** getAllHookInfo();

    /**
     * @brief hookAllRegistered
     * ��ע������з�������hook����
     */
    static void hookAllRegistered();

    /**
     * @brief unHookAll
     * ж�����е�hook
     */
    static void unHookAll();



  private:
    /**
     * @brief getFunctionStatus
     *  ��ȡ������ǰ��״̬
     *
     * @param functionAddr
     *  ������һ�������ĵ�ַ
     *
     * @return
     * UNREGISTERED,REGISTERED,HOOKED or UNHOOK.
     */
    static HookStatus getFunctionStatus(size_t functionAddr);

    /**
     * @brief addHookInfo
     *  ��hook_map_������³�Ա
     * @param info
     *  Ҫ�����hook_map_��info
     */
    static void addHookInfo(HookInfo * info);

    /**
     * @brief registerAndHook
     * ע�Ტ����hook����
     * @param info
     * HookInfo���͵Ķ���ָ��
     * @return
     * �ɹ�����true;
     * ʧ�ܷ���false.
     */
    static bool Hook(HookInfo* info);

    static bool UnHook(HookInfo* info);


    static HookInfo * getHookInfo(size_t functionAddr);

  private:

    /// ��¼��Щ������hook,keyΪԭ�����ĵ�ַ
    typedef map<size_t,HookInfo*> hook_map;
    static hook_map hook_map_;
  };

}

#endif // NATIVE_HOOK_H
