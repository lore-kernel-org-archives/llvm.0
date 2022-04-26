Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCC62560
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 16:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650989109; x=1682525109;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Aq9hDg8hkI8yQ/JXe1P1gJPpgAiSUSjS1n34YZafbMQ=;
  b=T0TE10GRpSTxLehdGhO5OsWrlDe+xeXyanx/smCcKouulNwaxJKoMcZH
   rsWHd9PvCY5YxIuBUkm9WR3d6I/2TRSu6dpkZAtEGSHh2mxhRPym/X2+k
   Oj36T+B/gE3Eh3sgwtak8n5EEDExH4MzklCXw0cwd4IyvTPP/s57DBU9E
   qdBWmr31TIDOPD7qB+ThpwKgH5K5aoAvJDSwRCxsBcEZ1Yvxp9CG6eWvx
   n+Mt3oRi54XoKHWTBBQqClJHHr/g9Y/gyUeoTOVjkpt787ejJYh1B8e1X
   pc1u77bs16mrkCpSOYLXKuhme6jFUclmEIvKANm4h6TNaj4Al4ffOoXyZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265148607"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; 
   d="scan'208";a="265148607"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 09:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; 
   d="scan'208";a="579998498"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Apr 2022 09:03:47 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njNfC-0003mm-6O;
	Tue, 26 Apr 2022 16:03:42 +0000
Date: Wed, 27 Apr 2022 00:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4800/6873] drivers/usb/host/ehci-omap.c:64:19:
 warning: unused function 'ehci_read'
Message-ID: <202204262345.EXnHaFKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   088fb7eff3496e0f61fdf68bda89b81a4d0a4434
commit: 11e002924ddb6f12638532331195a8ab09bbbf7e [4800/6873] usb: omap: avo=
id mach/*.h headers
config: mips-randconfig-r003-20220426 (https://download.01.org/0day-ci/arch=
ive/20220426/202204262345.EXnHaFKI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D11e002924ddb6f12638532331195a8ab09bbbf7e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 11e002924ddb6f12638532331195a8ab09bbbf7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/usb/host/ fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/host/ehci-omap.c:64:19: warning: unused function 'ehci_read'
   static inline u32 ehci_read(void __iomem u32 reg)
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: '.if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_bran=
ch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace=
_branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/incl=
ude/asm/barrier.h", .line =3D 16, $); 0x00 ) !=3D -1)) : $))) ) && ( (1 << =
0) ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else;=
 ; .endif'
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,drivers/usb/host/.ehci-omap.o.d -no=
stdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./in=
clude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclu=
de/uapi -I./include/generated/uapi -include include/linux/compiler-version.=
h -include include/linux/kconfig.h -include include/linux/compiler_types.h =
-D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80060000 -DLINKER_LOAD_ADDR=
ESS=3D0x80060000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=
=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
no-format-security -std=3Dgnu11 --target=3Dmips-linux -fintegrated-as -Werr=
or=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-ch=
eck-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float=
 -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EB -fno-stack-che=
ck -march=3Dmips32r2 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/inclu=
de/asm/mach-ath79 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-un=
wind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address=
-of-packed-member -O2 -Wframe-larger-than=3D1024 -fstack-protector -Wimplic=
it-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-vari=
able -fno-stack-clash-protection -pg -Wdeclaration-after-statement -Wvla -W=
no-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check =
-Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wextra -Wunused -=
Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmi=
ssing-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-but=
-set-variable -Wunused-const-variable -Wno-missing-field-initializers -Wno-=
sign-compare -Wno-type-limits -Wno-shift-negative-value -I drivers/usb/host=
 -I ./drivers/usb/host -DMODULE -mlong-calls -DKBUILD_BASENAME=3D"ehci_omap=
" -DKBUILD_MODNAME=3D"ehci_omap" -D__KBUILD_MODNAME=3Dkmod_ehci_omap -c -o =
drivers/usb/host/ehci-omap.o drivers/usb/host/ehci-omap.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/usb/host/ehci=
-omap.c'.
   4. Running pass 'Mips Assembly Printer' on function '@ehci_hcd_omap_prob=
e'
   #0 0x000056015b6d9a2f Signals.cpp:0:0
   #1 0x000056015b6d7854 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-1cddcfdc3c/bin/clang-15+0x34bf854)
   #2 0x000056015b616cf7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-1cddcfdc3c/bin/clang-15+0x33fecf7)
   #3 0x000056015b6cfe8e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-1cddcfdc3c/bin/clang-15+0x34b7e8e)
   #4 0x00005601592d95db (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x10c15d=
b)
   #5 0x000056015b61d81c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x340581c)
   #6 0x000056015c353a30 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x413ba30)
   #7 0x000056015c34f932 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-1cddcfdc3c/bin/clang-15+0x4137932)
   #8 0x0000560159d67f77 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x1b4ff77)
   #9 0x000056015aa49f8d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000056015ae90597 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x2c78597)
   #11 0x000056015ae90711 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x2c78711)
   #12 0x000056015ae9128f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x2c7928f)
   #13 0x000056015ba0434f clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x37ec=
34f)
   #14 0x000056015c678e11 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x4460e11)
   #15 0x000056015d1e76b1 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-1cddcfdc3c/bin/clang-15+0x4fcf6b1)
   #16 0x000056015c6784d5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-1cddcfdc3c/bin/clang-15+0x44604d5)
   #17 0x000056015c067be1 clang::FrontendAction::Execute() (/opt/cross/clan=
g-1cddcfdc3c/bin/clang-15+0x3e4fbe1)
   #18 0x000056015bffc5aa clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x3de45aa)
   #19 0x000056015c12f2db (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x3f172=
db)
   #20 0x00005601592dab8c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-1cddcfdc3c/bin/clang-15+0x10c2b8c)
   #21 0x00005601592d785b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000056015be8d5e5 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000056015b616bb3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x33febb3)
   #24 0x000056015be8dede clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000056015be61757 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-1cd=
dcfdc3c/bin/clang-15+0x3c49757)
   #26 0x000056015be62137 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x3c4a137)
   #27 0x000056015be6bc59 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x3c53c59)
   #28 0x0000560159223a0f main (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x=
100ba0f)
   #29 0x00007f54c39607fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #30 0x00005601592d737a _start (/opt/cross/clang-1cddcfdc3c/bin/clang-15+=
0x10bf37a)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 1cddcfdc3c683b393df1a=
5c9063252eb60e52818)
   Target: mips-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-1cddcfdc3c/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers fs include kernel nr_bisected scripts source usr
--
>> drivers/usb/host/ehci-omap.c:64:19: warning: unused function 'ehci_read'
   static inline u32 ehci_read(void __iomem u32 reg)
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: '.if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_bran=
ch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace=
_branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/incl=
ude/asm/barrier.h", .line =3D 16, $); 0x00 ) !=3D -1)) : $))) ) && ( (1 << =
0) ); .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else;=
 ; .endif'
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,drivers/usb/host/.ehci-omap.o.d -no=
stdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./in=
clude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclu=
de/uapi -I./include/generated/uapi -include include/linux/compiler-version.=
h -include include/linux/kconfig.h -include include/linux/compiler_types.h =
-D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80060000 -DLINKER_LOAD_ADDR=
ESS=3D0x80060000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=
=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
no-format-security -std=3Dgnu11 --target=3Dmips-linux -fintegrated-as -Werr=
or=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-ch=
eck-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float=
 -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EB -fno-stack-che=
ck -march=3Dmips32r2 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/inclu=
de/asm/mach-ath79 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-un=
wind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address=
-of-packed-member -O2 -Wframe-larger-than=3D1024 -fstack-protector -Wimplic=
it-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-vari=
able -fno-stack-clash-protection -pg -Wdeclaration-after-statement -Wvla -W=
no-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check =
-Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wextra -Wunused -=
Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmi=
ssing-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-but=
-set-variable -Wunused-const-variable -Wno-missing-field-initializers -Wno-=
sign-compare -Wno-type-limits -Wno-shift-negative-value -DMODULE -mlong-cal=
ls -DKBUILD_BASENAME=3D"ehci_omap" -DKBUILD_MODNAME=3D"ehci_omap" -D__KBUIL=
D_MODNAME=3Dkmod_ehci_omap -c -o drivers/usb/host/ehci-omap.o drivers/usb/h=
ost/ehci-omap.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/usb/host/ehci=
-omap.c'.
   4. Running pass 'Mips Assembly Printer' on function '@ehci_hcd_omap_prob=
e'
   #0 0x0000558707de5a2f Signals.cpp:0:0
   #1 0x0000558707de3854 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-1cddcfdc3c/bin/clang-15+0x34bf854)
   #2 0x0000558707d22cf7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-1cddcfdc3c/bin/clang-15+0x33fecf7)
   #3 0x0000558707ddbe8e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-1cddcfdc3c/bin/clang-15+0x34b7e8e)
   #4 0x00005587059e55db (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x10c15d=
b)
   #5 0x0000558707d2981c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x340581c)
   #6 0x0000558708a5fa30 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x413ba30)
   #7 0x0000558708a5b932 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-1cddcfdc3c/bin/clang-15+0x4137932)
   #8 0x0000558706473f77 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x1b4ff77)
   #9 0x0000558707155f8d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000055870759c597 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x2c78597)
   #11 0x000055870759c711 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x2c78711)
   #12 0x000055870759d28f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x2c7928f)
   #13 0x000055870811034f clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x37ec=
34f)
   #14 0x0000558708d84e11 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x4460e11)
   #15 0x00005587098f36b1 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-1cddcfdc3c/bin/clang-15+0x4fcf6b1)
   #16 0x0000558708d844d5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-1cddcfdc3c/bin/clang-15+0x44604d5)
   #17 0x0000558708773be1 clang::FrontendAction::Execute() (/opt/cross/clan=
g-1cddcfdc3c/bin/clang-15+0x3e4fbe1)
   #18 0x00005587087085aa clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x3de45aa)
   #19 0x000055870883b2db (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x3f172=
db)
   #20 0x00005587059e6b8c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-1cddcfdc3c/bin/clang-15+0x10c2b8c)
   #21 0x00005587059e385b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x00005587085995e5 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000558707d22bb3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x33febb3)
   #24 0x0000558708599ede clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000055870856d757 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-1cd=
dcfdc3c/bin/clang-15+0x3c49757)
   #26 0x000055870856e137 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x3c4a137)
   #27 0x0000558708577c59 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x3c53c59)
   #28 0x000055870592fa0f main (/opt/cross/clang-1cddcfdc3c/bin/clang-15+0x=
100ba0f)
   #29 0x00007f337b9677fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #30 0x00005587059e337a _start (/opt/cross/clang-1cddcfdc3c/bin/clang-15+=
0x10bf37a)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 1cddcfdc3c683b393df1a=
5c9063252eb60e52818)
   Target: mips-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-1cddcfdc3c/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers fs include kernel nr_bisected scripts source usr


vim +/ehci_read +64 drivers/usb/host/ehci-omap.c

54ab2b02ef6a45 Felipe Balbi      2009-10-14  63 =20
19403165c272cc Keshava Munegowda 2011-03-01 @64  static inline u32 ehci_rea=
d(void __iomem *base, u32 reg)
54ab2b02ef6a45 Felipe Balbi      2009-10-14  65  {
54ab2b02ef6a45 Felipe Balbi      2009-10-14  66  	return __raw_readl(base +=
 reg);
54ab2b02ef6a45 Felipe Balbi      2009-10-14  67  }
54ab2b02ef6a45 Felipe Balbi      2009-10-14  68 =20

:::::: The code at line 64 was first introduced by commit
:::::: 19403165c272cc4ed00c97973e7271714b009708 usb: host: omap: ehci and o=
hci simplification

:::::: TO: Keshava Munegowda <keshava_mgowda@ti.com>
:::::: CC: Felipe Balbi <balbi@ti.com>

--=20
0-DAY CI Kernel Test Service
https://01.org/lkp
