/*===============================================================
*   Copyright (C) 2016 All rights reserved.
*
*   �ļ����ƣ�elf_relocs.h
*   �� �� �ߣ�genglei.cuan@godinsec.com
*   �������ڣ�2016��05��16��
*   ��    ������ELF�ļ��Ĳ���
*
*   ������־��
*
================================================================*/

#ifndef ELF_RELOCS_H
#define ELF_RELOCS_H


#include <elf.h>


#define R_GENERIC_NONE 0 // R_*_NONE is always 0

#if defined (__aarch64__)

#define R_GENERIC_JUMP_SLOT R_AARCH64_JUMP_SLOT
#define R_GENERIC_GLOB_DAT  R_AARCH64_GLOB_DAT
#define R_GENERIC_RELATIVE  R_AARCH64_RELATIVE
#define R_GENERIC_IRELATIVE R_AARCH64_IRELATIVE
#define R_GENERIC_ABS       R_AARCH64_ABS64
#elif defined (__arm__)

#define R_GENERIC_JUMP_SLOT R_ARM_JUMP_SLOT
#define R_GENERIC_GLOB_DAT  R_ARM_GLOB_DAT
#define R_GENERIC_RELATIVE  R_ARM_RELATIVE
#define R_GENERIC_IRELATIVE R_ARM_IRELATIVE
#define R_GENERIC_ABS       R_ARM_ABS32
#elif defined (__i386__)

#define R_GENERIC_JUMP_SLOT R_386_JMP_SLOT
#define R_GENERIC_GLOB_DAT  R_386_GLOB_DAT
#define R_GENERIC_RELATIVE  R_386_RELATIVE
#define R_GENERIC_IRELATIVE R_386_IRELATIVE
//TODO ȱ��x86�������δ����
#define R_GENERIC_ABS       0
#elif defined (__x86_64__)

#define R_GENERIC_JUMP_SLOT R_X86_64_JUMP_SLOT
#define R_GENERIC_GLOB_DAT  R_X86_64_GLOB_DAT
#define R_GENERIC_RELATIVE  R_X86_64_RELATIVE
#define R_GENERIC_IRELATIVE R_X86_64_IRELATIVE
//TODO ȱ��x86�������δ����
#define R_GENERIC_ABS       0
#endif


#endif // ELF_RELOCS_H
