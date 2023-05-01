## Sistema Operacional

### 1. Etapa
- Boot

O processo de boot do sistema operacional acontece, de maneira genérica inicialmente BIOS ao ser carregada chamar o Bootloader e então, ele direcionar para o carregamento do Sistema Operacional.\
Alguns SO modrnos utilizam drivers que interagem diretamente com o hardware, e a BIOS em si faria o processo de dianosticos iniciais, após entao passa o controle para o bootloader.

- Bootloader

O bootloader é o responsável para carregar o sistema operacional, comunicando diretamente com o hardware. Criamos então um [simples boot](./boot.asm) para inicio.
Para ter certeza que a BIOS encontre é colocado no primeiro setor do disco, chmado de boot sector. Tendo 512 bytes e os 2 ultimos sendo de confirmação/assinatura do boot sector.

   - Interrupt \
   Interrupts are a mechanism that allow the CPU temporarily to halt what it is doing and run some other, higher-priority instructions before returning to the original task.\
   Cada interruptor e representado por um unico numero que está indexado no interrupt vector, uma tabela inicialmente configurada pelo BIOS no inicio da memoria.\
   So, in a nutshell, BIOS adds some of its own ISRs to the interrupt vector that specialise in certain aspects of the computer, for example: interrupt 0x10 causes the screen-related ISR to be invoked; and interrupt 0x13, the disk-related I/O ISR.\
   However, it would be wasteful to allocate an interrupt per BIOS routine, so BIOS multiplexes the ISRs by what we could imagine as a big switch statement, based usually on the value set in one of the CPUs general purpose registers, ax, prior to raising the interrupt.



### 2. Testando

**Montando .bin** 
```shell
$ nasm boot.asm -f bin -o boot.bin
```

**Visualizacao dos bytes no arquivo**
```shell
$ od -t x1 -A n boot.bin
```

**No linux:** \
Utilizamos o QMEU pela facilidade
```shell
$ qemu-system-i386 boot.bin
$ qemu-system-i386 -drive file=boot.bin,format=raw
$ qemu-system-x86_64 -serial stdio -device loader,file=boot_sect_simple.bin,addr=0x60800000,cpu-num=0,force-raw=on
```

**No Windows:** \
Utilize algum programa para criação de ISO a partir do .bin, e então utilize um hypervisor para criação da máquina virtual encima da ISO.


## Referencias
- https://www.youtube.com/playlist?list=PLNbiC50CEvY8orStEuueUR8gBF9hxj98j
- https://aly.arriqaaq.com/wos1/
- https://docs.fedoraproject.org/en-US/quick-docs/uefi-with-qemu/
- Interrupt list: http://www.delorie.com/djgpp/doc/rbinter/
- INT 13H: https://en.wikipedia.org/wiki/INT_13H
- Doc AMD - https://www.amd.com/system/files/TechDocs/24592.pdf