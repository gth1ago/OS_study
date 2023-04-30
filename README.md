## Sistema Operacional

### 1. Etapa
- Boot

O processo de boot do sistema operacional acontece, de maneira genérica inicialmente BIOS ao ser carregada chamar o Bootloader e então, ele direcionar para o carregamento do Sistema Operacional.\
Alguns SO modrnos utilizam drivers que interagem diretamente com o hardware, e a BIOS em si faria o processo de dianosticos iniciais, após entao passa o controle para o bootloader.

- Bootloader

O bootloader é o responsável para carregar o sistema operacional, comunicando diretamente com o hardware. Criamos então um [simples boot](./boot.asm) para inicio.
Para ter certeza que a BIOS encontre é colocado no primeiro setor do disco, chmado de boot sector. Tendo 512 bytes e os 2 ultimos sendo de confirmação/assinatura do boot sector.

### 2. Testando

**No linux:** \
Utilizamos o QMEU pela facilidade\
$ qemu-system-x86_64 boot.bin

**No Windows:** \
Utilize algum programa para criação de ISO a partir do .bin, e então utilize um hypervisor para criação da máquina virtual encima da ISO.


## Referencias
- https://aly.arriqaaq.com/wos1/
- https://docs.fedoraproject.org/en-US/quick-docs/uefi-with-qemu/