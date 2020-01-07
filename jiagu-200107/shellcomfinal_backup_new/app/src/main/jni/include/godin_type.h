#ifndef GODIN_TYPE_H
#define GODIN_TYPE_H

#include <elf.h>
#include <unistd.h>

/// �ο�AOSP linker.h
/// ��Ҫ��Ϊ��֧��32/64ƽ̨
#if defined(__LP64__)
#define ELFW(what) Elf64_ ## what
#else
#define ELFW(what) Elf32_ ## what
#endif


#endif // GODIN_TYPE_H
