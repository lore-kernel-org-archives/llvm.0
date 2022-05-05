Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE58623
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651748302; x=1683284302;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bA3ih4sWxs6hrXc6wdHIx3LGyetgwfs7KSZlFQ4LrAU=;
  b=mny4Si5cO9EuBYwMln6EJBtukW6xSaY4+VXjRc1zmxxKuod4VisUeFem
   PRjT4z+MfgnQKK1NhigjbuT/awpoZ+LCXgPQYw2p34Q0FyblNpWCuh9mP
   XFBE5xj9HvkPtv7ELehWYQiSkAO+/NzE+doYjWgRYFUGgdptI1Y8ojsqK
   vO9eINw1ixF8f0EPYisHaHF8CbI6saMgqKwsD6dL0B1qu5xgGWtSqcBaN
   gmqQsolNRhTb3BIaPKwXvfCaXdDmPSKd3EcTAs78bQnVPO6d67jqS1hF+
   atDVPnY6NSTfk363PpdLHYnbxj2kmp7jF2rGJ0qxrsaL0dXe2P0QGpWw1
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="250058287"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="250058287"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2022 03:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; 
   d="scan'208";a="585264012"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 May 2022 03:58:19 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmZBb-000CJs-3P;
	Thu, 05 May 2022 10:58:19 +0000
Date: Thu, 5 May 2022 18:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4603/8600] drivers/usb/host/ehci-omap.c:64:19:
 warning: unused function 'ehci_read'
Message-ID: <202205051822.cnXJRnmL-lkp@intel.com>
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
head:   bb6ee10133faa3c4742ab8343b5e488cdb29445e
commit: 11e002924ddb6f12638532331195a8ab09bbbf7e [4603/8600] usb: omap: avo=
id mach/*.h headers
config: mips-randconfig-c004-20220505 (https://download.01.org/0day-ci/arch=
ive/20220505/202205051822.cnXJRnmL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
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
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/mfd/ drivers/usb/host/

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
-D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80100000 -DLINKER_LOAD_ADDR=
ESS=3D0x80100000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=
=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
no-format-security -std=3Dgnu11 --target=3Dmipsel-linux -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-=
check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-flo=
at -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-c=
heck -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/inclu=
de/asm/mach-malta -Iarch/mips/include/asm/mach-generic -fno-asynchronous-un=
wind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address=
-of-packed-member -Os -Wframe-larger-than=3D1024 -fstack-protector-strong -=
Wimplicit-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-con=
st-variable -ftrivial-auto-var-init=3Dzero -enable-trivial-auto-var-init-ze=
ro-knowing-it-will-be-removed-from-clang -fno-stack-clash-protection -pg -W=
declaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -f=
no-strict-overflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dincompati=
ble-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarat=
ions -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition=
 -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -=
Wno-missing-field-initializers -Wno-sign-compare -Wno-type-limits -Wno-shif=
t-negative-value -g -fno-var-tracking -DMODULE -mlong-calls -DKBUILD_BASENA=
ME=3D"ehci_omap" -DKBUILD_MODNAME=3D"ehci_omap" -D__KBUILD_MODNAME=3Dkmod_e=
hci_omap -c -o drivers/usb/host/ehci-omap.o drivers/usb/host/ehci-omap.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/usb/host/ehci=
-omap.c'.
   4. Running pass 'Mips Assembly Printer' on function '@ehci_hcd_omap_prob=
e'
   #0 0x000055682e3d0c6f Signals.cpp:0:0
   #1 0x000055682e3cea94 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-5e004fb787/bin/clang-15+0x34bba94)
   #2 0x000055682e30ddf7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-5e004fb787/bin/clang-15+0x33fadf7)
   #3 0x000055682e3c70ce llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-5e004fb787/bin/clang-15+0x34b40ce)
   #4 0x000055682bfd62db (/opt/cross/clang-5e004fb787/bin/clang-15+0x10c32d=
b)
   #5 0x000055682e31492c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x340192c)
   #6 0x000055682f05e5d0 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-5e004fb787/bin/clang-15+0x414b5d0)
   #7 0x000055682f05a4d2 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-5e004fb787/bin/clang-15+0x41474d2)
   #8 0x000055682ca71817 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x1b5e817)
   #9 0x000055682d75923d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000055682dba1ef7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8eef7)
   #11 0x000055682dba2071 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8f071)
   #12 0x000055682dba2bef llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8fbef)
   #13 0x000055682e70634f clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-5e004fb787/bin/clang-15+0x37f3=
34f)
   #14 0x000055682f388011 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x4475011)
   #15 0x000055682ff110c1 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-5e004fb787/bin/clang-15+0x4ffe0c1)
   #16 0x000055682f3876d5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-5e004fb787/bin/clang-15+0x44746d5)
   #17 0x000055682ed6d981 clang::FrontendAction::Execute() (/opt/cross/clan=
g-5e004fb787/bin/clang-15+0x3e5a981)
   #18 0x000055682ed01f0a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3deef0a)
   #19 0x000055682ee34f0b (/opt/cross/clang-5e004fb787/bin/clang-15+0x3f21f=
0b)
   #20 0x000055682bfd788c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-5e004fb787/bin/clang-15+0x10c488c)
   #21 0x000055682bfd455b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000055682eb90c95 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055682e30dcb3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-5e004fb787/bin/clang-15+0x33facb3)
   #24 0x000055682eb9158e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000055682eb63917 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-5e0=
04fb787/bin/clang-15+0x3c50917)
   #26 0x000055682eb642f7 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c512f7)
   #27 0x000055682eb6d7ea clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c5a7ea)
   #28 0x000055682bf2099f main (/opt/cross/clang-5e004fb787/bin/clang-15+0x=
100d99f)
   #29 0x00007fdc7b5f57fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #30 0x000055682bfd407a _start (/opt/cross/clang-5e004fb787/bin/clang-15+=
0x10c107a)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 5e004fb787698440a3877=
50db7f8028e7cb14cfc)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-5e004fb787/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers include kernel nr_bisected scripts source usr
--
>> drivers/mfd/omap-usb-tll.c:128:18: warning: unused function 'usbtll_read=
b'
   static inline u8 usbtll_readb(void __iomem u32 reg)
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
   0. Program arguments: clang -Wp,-MMD,drivers/mfd/.omap-usb-tll.o.d -nost=
dinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./incl=
ude -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude=
/uapi -I./include/generated/uapi -include include/linux/compiler-version.h =
-include include/linux/kconfig.h -include include/linux/compiler_types.h -D=
__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80100000 -DLINKER_LOAD_ADDRES=
S=3D0x80100000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D=
 -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimpli=
cit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-=
format-security -std=3Dgnu11 --target=3Dmipsel-linux -fintegrated-as -Werro=
r=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-che=
ck-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float =
-DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-chec=
k -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/=
asm/mach-malta -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwin=
d-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of=
-packed-member -Os -Wframe-larger-than=3D1024 -fstack-protector-strong -Wim=
plicit-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-=
variable -ftrivial-auto-var-init=3Dzero -enable-trivial-auto-var-init-zero-=
knowing-it-will-be-removed-from-clang -fno-stack-clash-protection -pg -Wdec=
laration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -fno-=
strict-overflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dincompatible=
-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-declaration=
s -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition -W=
missing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wno=
-missing-field-initializers -Wno-sign-compare -Wno-type-limits -Wno-shift-n=
egative-value -g -fno-var-tracking -I drivers/mfd -I ./drivers/mfd -DKBUILD=
_MODFILE=3D"drivers/mfd/omap-usb-tll" -DKBUILD_BASENAME=3D"omap_usb_tll" -D=
KBUILD_MODNAME=3D"omap_usb_tll" -D__KBUILD_MODNAME=3Dkmod_omap_usb_tll -c -=
o drivers/mfd/omap-usb-tll.o drivers/mfd/omap-usb-tll.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/mfd/omap-usb-=
tll.c'.
   4. Running pass 'Mips Assembly Printer' on function '@omap_tll_init'
   #0 0x0000560ab09c7c6f Signals.cpp:0:0
   #1 0x0000560ab09c5a94 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-5e004fb787/bin/clang-15+0x34bba94)
   #2 0x0000560ab0904df7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-5e004fb787/bin/clang-15+0x33fadf7)
   #3 0x0000560ab09be0ce llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-5e004fb787/bin/clang-15+0x34b40ce)
   #4 0x0000560aae5cd2db (/opt/cross/clang-5e004fb787/bin/clang-15+0x10c32d=
b)
   #5 0x0000560ab090b92c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x340192c)
   #6 0x0000560ab16555d0 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-5e004fb787/bin/clang-15+0x414b5d0)
   #7 0x0000560ab16514d2 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-5e004fb787/bin/clang-15+0x41474d2)
   #8 0x0000560aaf068817 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x1b5e817)
   #9 0x0000560aafd5023d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x0000560ab0198ef7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8eef7)
   #11 0x0000560ab0199071 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8f071)
   #12 0x0000560ab0199bef llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8fbef)
   #13 0x0000560ab0cfd34f clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-5e004fb787/bin/clang-15+0x37f3=
34f)
   #14 0x0000560ab197f011 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x4475011)
   #15 0x0000560ab25080c1 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-5e004fb787/bin/clang-15+0x4ffe0c1)
   #16 0x0000560ab197e6d5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-5e004fb787/bin/clang-15+0x44746d5)
   #17 0x0000560ab1364981 clang::FrontendAction::Execute() (/opt/cross/clan=
g-5e004fb787/bin/clang-15+0x3e5a981)
   #18 0x0000560ab12f8f0a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3deef0a)
   #19 0x0000560ab142bf0b (/opt/cross/clang-5e004fb787/bin/clang-15+0x3f21f=
0b)
   #20 0x0000560aae5ce88c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-5e004fb787/bin/clang-15+0x10c488c)
   #21 0x0000560aae5cb55b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x0000560ab1187c95 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000560ab0904cb3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-5e004fb787/bin/clang-15+0x33facb3)
   #24 0x0000560ab118858e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x0000560ab115a917 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-5e0=
04fb787/bin/clang-15+0x3c50917)
   #26 0x0000560ab115b2f7 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c512f7)
   #27 0x0000560ab11647ea clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c5a7ea)
   #28 0x0000560aae51799f main (/opt/cross/clang-5e004fb787/bin/clang-15+0x=
100d99f)
   #29 0x00007f6de8a7a7fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #30 0x0000560aae5cb07a _start (/opt/cross/clang-5e004fb787/bin/clang-15+=
0x10c107a)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 5e004fb787698440a3877=
50db7f8028e7cb14cfc)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-5e004fb787/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers include kernel nr_bisected scripts source usr
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
-D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80100000 -DLINKER_LOAD_ADDR=
ESS=3D0x80100000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=
=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
no-format-security -std=3Dgnu11 --target=3Dmipsel-linux -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-=
check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-flo=
at -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-c=
heck -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/inclu=
de/asm/mach-malta -Iarch/mips/include/asm/mach-generic -fno-asynchronous-un=
wind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address=
-of-packed-member -Os -Wframe-larger-than=3D1024 -fstack-protector-strong -=
Wimplicit-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-con=
st-variable -ftrivial-auto-var-init=3Dzero -enable-trivial-auto-var-init-ze=
ro-knowing-it-will-be-removed-from-clang -fno-stack-clash-protection -pg -W=
declaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -f=
no-strict-overflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dincompati=
ble-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarat=
ions -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition=
 -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -=
Wno-missing-field-initializers -Wno-sign-compare -Wno-type-limits -Wno-shif=
t-negative-value -g -fno-var-tracking -I drivers/usb/host -I ./drivers/usb/=
host -DMODULE -mlong-calls -DKBUILD_BASENAME=3D"ehci_omap" -DKBUILD_MODNAME=
=3D"ehci_omap" -D__KBUILD_MODNAME=3Dkmod_ehci_omap -c -o drivers/usb/host/e=
hci-omap.o drivers/usb/host/ehci-omap.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/usb/host/ehci=
-omap.c'.
   4. Running pass 'Mips Assembly Printer' on function '@ehci_hcd_omap_prob=
e'
   #0 0x000055d622a62c6f Signals.cpp:0:0
   #1 0x000055d622a60a94 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-5e004fb787/bin/clang-15+0x34bba94)
   #2 0x000055d62299fdf7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-5e004fb787/bin/clang-15+0x33fadf7)
   #3 0x000055d622a590ce llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-5e004fb787/bin/clang-15+0x34b40ce)
   #4 0x000055d6206682db (/opt/cross/clang-5e004fb787/bin/clang-15+0x10c32d=
b)
   #5 0x000055d6229a692c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x340192c)
   #6 0x000055d6236f05d0 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-5e004fb787/bin/clang-15+0x414b5d0)
   #7 0x000055d6236ec4d2 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-5e004fb787/bin/clang-15+0x41474d2)
   #8 0x000055d621103817 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x1b5e817)
   #9 0x000055d621deb23d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000055d622233ef7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8eef7)
   #11 0x000055d622234071 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8f071)
   #12 0x000055d622234bef llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8fbef)
   #13 0x000055d622d9834f clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-5e004fb787/bin/clang-15+0x37f3=
34f)
   #14 0x000055d623a1a011 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x4475011)
   #15 0x000055d6245a30c1 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-5e004fb787/bin/clang-15+0x4ffe0c1)
   #16 0x000055d623a196d5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-5e004fb787/bin/clang-15+0x44746d5)
   #17 0x000055d6233ff981 clang::FrontendAction::Execute() (/opt/cross/clan=
g-5e004fb787/bin/clang-15+0x3e5a981)
   #18 0x000055d623393f0a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3deef0a)
   #19 0x000055d6234c6f0b (/opt/cross/clang-5e004fb787/bin/clang-15+0x3f21f=
0b)
   #20 0x000055d62066988c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-5e004fb787/bin/clang-15+0x10c488c)
   #21 0x000055d62066655b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000055d623222c95 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055d62299fcb3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-5e004fb787/bin/clang-15+0x33facb3)
   #24 0x000055d62322358e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000055d6231f5917 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-5e0=
04fb787/bin/clang-15+0x3c50917)
   #26 0x000055d6231f62f7 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c512f7)
   #27 0x000055d6231ff7ea clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c5a7ea)
   #28 0x000055d6205b299f main (/opt/cross/clang-5e004fb787/bin/clang-15+0x=
100d99f)
   #29 0x00007fa1ad7ee7fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #30 0x000055d62066607a _start (/opt/cross/clang-5e004fb787/bin/clang-15+=
0x10c107a)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 5e004fb787698440a3877=
50db7f8028e7cb14cfc)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-5e004fb787/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers include kernel nr_bisected scripts source usr


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
