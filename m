Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A70F7B
	for <llvm@lists.linux.dev>; Wed,  9 Mar 2022 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646840957; x=1678376957;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lHmim/t1mNWqeBmeWIUCTJKiVvrd9JTET7i8LSirLEk=;
  b=ipjBsdtzWTm4IY0zv63AlbGjFOwR7AlEiYI3XkV9bF0mizaY0B90DNLy
   LVxFYAj4tI+jRbCZu14TdH+3GeQSAqvo5XRxMhGXtEV3jYLzY5/UM+4jt
   iopVL/4DQAGqF6aa47NegSwdpvn0qwjKG7GTbDEniR8XjsTbG7YvzFWgE
   wVsAfkXEL3lvlzdjvPejfuHExJA8Cs0x51MkgB+h/4fP5DPLyCr355MV2
   4YSJDttGYjcjufS3NDAaiBoWuaSwLQlhz3vYSIO3xBsRW4VeSqKlr6t65
   PqLRmSL5whprI8Ho0WUiX7V+d3Z2NLbdXUykAhD/TJL1mtMr+fc1j2Frz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242446373"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="242446373"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 07:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="495876047"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Mar 2022 07:49:14 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nRyYs-0003Tk-0X; Wed, 09 Mar 2022 15:49:14 +0000
Date: Wed, 9 Mar 2022 23:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pavel Machek <pavel@ucw.cz>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: [linux-next:master 9327/11713] drivers/leds/leds-pca955x.c:149:19:
 warning: unused function 'pca95xx_num_led_regs'
Message-ID: <202203092319.4Bkj9Bnn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4e7a74a6856f8613dab9794da4b5cfb8fd54fb8c
commit: ca386253ff6fb86128a7c61e1c38ca91de38048d [9327/11713] leds: pca955x=
: Make the gpiochip always expose all pins
config: mips-randconfig-c004-20220309 (https://download.01.org/0day-ci/arch=
ive/20220309/202203092319.4Bkj9Bnn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dca386253ff6fb86128a7c61e1c38ca91de38048d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout ca386253ff6fb86128a7c61e1c38ca91de38048d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/leds/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/leds/leds-pca955x.c:149:19: warning: unused function 'pca95xx_nu=
m_led_regs'
   static inline int pca95xx_num_led_regs(int bits)
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set mips64r2
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/bitops.h", .line =3D 103, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .s=
et push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $0, $1
   or $0, $2
   sc $0, $1
   beqz $0, 1b
   .set pop
   '
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,drivers/leds/.leds-pca955x.o.d -nos=
tdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./inc=
lude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80101000 -DLINKER_LOAD_ADDRE=
SS=3D0x80101000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=
=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
no-format-security -std=3Dgnu89 --target=3Dmipsel-linux -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-=
check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-flo=
at -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-c=
heck -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/inclu=
de/asm/mach-rc32434 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-=
unwind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-addre=
ss-of-packed-member -O2 -Wframe-larger-than=3D1024 -fno-stack-protector -Wi=
mplicit-fallthrough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable=
 -Wno-unused-const-variable -ftrivial-auto-var-init=3Dzero -enable-trivial-=
auto-var-init-zero-knowing-it-will-be-removed-from-clang -fno-stack-clash-p=
rotection -pg -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-=
function-type -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werr=
or=3Ddate-time -Werror=3Dincompatible-pointer-types -Wextra -Wunused -Wno-u=
nused-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmissing=
-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-but-set-=
variable -Wunused-const-variable -Wno-missing-field-initializers -Wno-sign-=
compare -Wno-type-limits -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsan=
itize=3Dbool -fsanitize=3Denum -I drivers/leds -I ./drivers/leds -DMODULE -=
mlong-calls -DKBUILD_BASENAME=3D"leds_pca955x" -DKBUILD_MODNAME=3D"leds_pca=
955x" -D__KBUILD_MODNAME=3Dkmod_leds_pca955x -c -o drivers/leds/leds-pca955=
x.o drivers/leds/leds-pca955x.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/leds/leds-pca=
955x.c'.
   4. Running pass 'Mips Assembly Printer' on function '@pca955x_probe'
   #0 0x00005606c72f860f Signals.cpp:0:0
   #1 0x00005606c72f64ec llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-276ca87382/bin/clang-15+0x34914ec)
   #2 0x00005606c7236ac7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-276ca87382/bin/clang-15+0x33d1ac7)
   #3 0x00005606c72eeb9e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-276ca87382/bin/clang-15+0x3489b9e)
   #4 0x00005606c4efd62b (/opt/cross/clang-276ca87382/bin/clang-15+0x109862=
b)
   #5 0x00005606c723d5ec llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-276ca87382/bin/clang-15+0x33d85ec)
   #6 0x00005606c7f52900 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-276ca87382/bin/clang-15+0x40ed900)
   #7 0x00005606c7f4e834 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-276ca87382/bin/clang-15+0x40e9834)
   #8 0x00005606c5975df7 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-276ca87382/bin/clang-15+0x1b10df7)
   #9 0x00005606c663db4d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x00005606c6a861b7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-276ca87382/bin/clang-15+0x2c211b7)
   #11 0x00005606c6a86331 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-276ca87382/bin/clang-15+0x2c21331)
   #12 0x00005606c6a86eaf llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-276ca87382/bin/clang-15+0x2c21eaf)
   #13 0x00005606c7615797 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-276ca87382/bin/clang-15+0x37b0=
797)
   #14 0x00005606c826ed33 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-276ca87382/bin/clang-15+0x4409d33)
   #15 0x00005606c8d5b291 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-276ca87382/bin/clang-15+0x4ef6291)
   #16 0x00005606c826db6f clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-276ca87382/bin/clang-15+0x4408b6f)
   #17 0x00005606c7c6cb01 clang::FrontendAction::Execute() (/opt/cross/clan=
g-276ca87382/bin/clang-15+0x3e07b01)
   #18 0x00005606c7c0295a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-276ca87382/bin/clang-15+0x3d9d95a)
   #19 0x00005606c7d31f3b (/opt/cross/clang-276ca87382/bin/clang-15+0x3eccf=
3b)
   #20 0x00005606c4efebdc cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-276ca87382/bin/clang-15+0x1099bdc)
   #21 0x00005606c4efb8ab ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x00005606c7a9a4a5 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x00005606c7236983 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-276ca87382/bin/clang-15+0x33d1983)
   #24 0x00005606c7a9ad9e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x00005606c7a6f4b7 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-276=
ca87382/bin/clang-15+0x3c0a4b7)
   #26 0x00005606c7a6fe97 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-276ca87382/bin/clang-15+0x3c0ae97)
   #27 0x00005606c7a793ea clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-276ca87382/bin/clang-15+0x3c143ea)
   #28 0x00005606c4e487cf main (/opt/cross/clang-276ca87382/bin/clang-15+0x=
fe37cf)
   #29 0x00007f23d2855d0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x00005606c4efb3ca _start (/opt/cross/clang-276ca87382/bin/clang-15+=
0x10963ca)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 276ca87382b8f16a65bdd=
ac700202924228982f6)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-276ca87382/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers fs include kernel nr_bisected scripts source usr
--
>> drivers/leds/leds-pca955x.c:149:19: warning: unused function 'pca95xx_nu=
m_led_regs'
   static inline int pca95xx_num_led_regs(int bits)
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set mips64r2
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/bitops.h", .line =3D 103, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .s=
et push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $0, $1
   or $0, $2
   sc $0, $1
   beqz $0, 1b
   .set pop
   '
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,drivers/leds/.leds-pca955x.o.d -nos=
tdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./inc=
lude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclud=
e/uapi -I./include/generated/uapi -include include/linux/compiler-version.h=
 -include include/linux/kconfig.h -include include/linux/compiler_types.h -=
D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80101000 -DLINKER_LOAD_ADDRE=
SS=3D0x80101000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=
=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
no-format-security -std=3Dgnu89 --target=3Dmipsel-linux -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-=
check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-flo=
at -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-c=
heck -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/inclu=
de/asm/mach-rc32434 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-=
unwind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-addre=
ss-of-packed-member -O2 -Wframe-larger-than=3D1024 -fno-stack-protector -Wi=
mplicit-fallthrough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable=
 -Wno-unused-const-variable -ftrivial-auto-var-init=3Dzero -enable-trivial-=
auto-var-init-zero-knowing-it-will-be-removed-from-clang -fno-stack-clash-p=
rotection -pg -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-=
function-type -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werr=
or=3Ddate-time -Werror=3Dincompatible-pointer-types -Wextra -Wunused -Wno-u=
nused-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmissing=
-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-but-set-=
variable -Wunused-const-variable -Wno-missing-field-initializers -Wno-sign-=
compare -Wno-type-limits -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsan=
itize=3Dbool -fsanitize=3Denum -DMODULE -mlong-calls -DKBUILD_BASENAME=3D"l=
eds_pca955x" -DKBUILD_MODNAME=3D"leds_pca955x" -D__KBUILD_MODNAME=3Dkmod_le=
ds_pca955x -c -o drivers/leds/leds-pca955x.o drivers/leds/leds-pca955x.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/leds/leds-pca=
955x.c'.
   4. Running pass 'Mips Assembly Printer' on function '@pca955x_probe'
   #0 0x000055fd91ce560f Signals.cpp:0:0
   #1 0x000055fd91ce34ec llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-276ca87382/bin/clang-15+0x34914ec)
   #2 0x000055fd91c23ac7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-276ca87382/bin/clang-15+0x33d1ac7)
   #3 0x000055fd91cdbb9e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-276ca87382/bin/clang-15+0x3489b9e)
   #4 0x000055fd8f8ea62b (/opt/cross/clang-276ca87382/bin/clang-15+0x109862=
b)
   #5 0x000055fd91c2a5ec llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-276ca87382/bin/clang-15+0x33d85ec)
   #6 0x000055fd9293f900 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-276ca87382/bin/clang-15+0x40ed900)
   #7 0x000055fd9293b834 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-276ca87382/bin/clang-15+0x40e9834)
   #8 0x000055fd90362df7 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-276ca87382/bin/clang-15+0x1b10df7)
   #9 0x000055fd9102ab4d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000055fd914731b7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-276ca87382/bin/clang-15+0x2c211b7)
   #11 0x000055fd91473331 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-276ca87382/bin/clang-15+0x2c21331)
   #12 0x000055fd91473eaf llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-276ca87382/bin/clang-15+0x2c21eaf)
   #13 0x000055fd92002797 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-276ca87382/bin/clang-15+0x37b0=
797)
   #14 0x000055fd92c5bd33 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-276ca87382/bin/clang-15+0x4409d33)
   #15 0x000055fd93748291 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-276ca87382/bin/clang-15+0x4ef6291)
   #16 0x000055fd92c5ab6f clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-276ca87382/bin/clang-15+0x4408b6f)
   #17 0x000055fd92659b01 clang::FrontendAction::Execute() (/opt/cross/clan=
g-276ca87382/bin/clang-15+0x3e07b01)
   #18 0x000055fd925ef95a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-276ca87382/bin/clang-15+0x3d9d95a)
   #19 0x000055fd9271ef3b (/opt/cross/clang-276ca87382/bin/clang-15+0x3eccf=
3b)
   #20 0x000055fd8f8ebbdc cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-276ca87382/bin/clang-15+0x1099bdc)
   #21 0x000055fd8f8e88ab ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000055fd924874a5 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055fd91c23983 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-276ca87382/bin/clang-15+0x33d1983)
   #24 0x000055fd92487d9e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000055fd9245c4b7 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-276=
ca87382/bin/clang-15+0x3c0a4b7)
   #26 0x000055fd9245ce97 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-276ca87382/bin/clang-15+0x3c0ae97)
   #27 0x000055fd924663ea clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-276ca87382/bin/clang-15+0x3c143ea)
   #28 0x000055fd8f8357cf main (/opt/cross/clang-276ca87382/bin/clang-15+0x=
fe37cf)
   #29 0x00007fe4d637bd0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x000055fd8f8e83ca _start (/opt/cross/clang-276ca87382/bin/clang-15+=
0x10963ca)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 276ca87382b8f16a65bdd=
ac700202924228982f6)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-276ca87382/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers fs include kernel nr_bisected scripts source usr


vim +/pca95xx_num_led_regs +149 drivers/leds/leds-pca955x.c

f46e9203d9a100 Nate Case 2008-07-16  147 =20
f46e9203d9a100 Nate Case 2008-07-16  148  /* 4 bits per LED selector regist=
er */
f46e9203d9a100 Nate Case 2008-07-16 @149  static inline int pca95xx_num_led=
_regs(int bits)
f46e9203d9a100 Nate Case 2008-07-16  150  {
f46e9203d9a100 Nate Case 2008-07-16  151  	return (bits + 3)  / 4;
f46e9203d9a100 Nate Case 2008-07-16  152  }
f46e9203d9a100 Nate Case 2008-07-16  153 =20

:::::: The code at line 149 was first introduced by commit
:::::: f46e9203d9a100bae216cc06e17f2e77351aa8d8 leds: Add support for Phili=
ps PCA955x I2C LED drivers

:::::: TO: Nate Case <ncase@xes-inc.com>
:::::: CC: Richard Purdie <rpurdie@rpsys.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
