Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38B3D87
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 23:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651880879; x=1683416879;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Gqatz8ROaQyt0Z1C9xvBXMP5+roQfxbuUEfGH31v81U=;
  b=cZhRg+QWOCAui2VXVoX2rXUOzy7xFv80RlvYqoB/xEokp2BcKLgZaprB
   0pRiqh0DxFPry0tityHoqdNWYucfAXtvpfIWue2RLJYQg21jYTLcEVA+R
   w+y4VyyVV+lVgPvj1E7rLD+zHwWTQNEt0a3aOlM2jb4Mg6kZWTRv6uvFE
   qSOVGUKORBKaASNVqcjoQATecT3VF84LZSqtKc6BYzWwoHNvORWY4gcPG
   ylKlbHpUKMAU9KegZkKAz7/LVtRyb/AKsERJ9VkfJuovQH9j3ET20xkkN
   EV6UI7j6iTYfKLBWZXSKo6yy62rp57siAXOePJbfFou7bkmYb524KN6rs
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268745885"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="268745885"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 16:47:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="709686356"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 May 2022 16:47:56 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nn7fv-000E1Q-G3;
	Fri, 06 May 2022 23:47:55 +0000
Date: Sat, 7 May 2022 07:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnikant Bhojani <rajnikant.bhojani@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Hyun Kwon <hyun.kwon@xilinx.com>,
	Shubhrajyoti Datta <shubhraj@xilinx.com>,
	Jean-Francois Dagenais <jeff.dagenais@gmail.com>,
	Olivier Dugas <dugaso@sonatest.com>,
	Manish Narani <mnarani@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 541/1129]
 drivers/iio/adc/xilinx-ams.c:384:10: warning: signed shift result
 (0x446A60000) requires 36 bits to represent, but 'long' only has 32 bits
Message-ID: <202205070742.Oo5N1vbq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: d073b83d3f8f3ba83c59f7502371b1cf9eb35e92 [541/1129] iio: adc: Add X=
ilinx AMS driver
config: mips-buildonly-randconfig-r006-20220506 (https://download.01.org/0d=
ay-ci/archive/20220507/202205070742.Oo5N1vbq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/d073b83d3f8f3ba83c59f=
7502371b1cf9eb35e92
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout d073b83d3f8f3ba83c59f7502371b1cf9eb35e92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/xilinx-ams.c:384:10: warning: signed shift result (0x446=
A60000) requires 36 bits to represent, but 'long' only has 32 bits
   =3D AMS_TEMP_OFFSET;
   ^~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.h:134:47: note: expanded from macro 'AMS_TEMP=
_OFFSET'
   #define AMS_TEMP_OFFSET -((280230L << 16) / 509314)
   ~~~~~~~ ^ ~~
>> drivers/iio/adc/xilinx-ams.c:38:20: warning: unused function 'ams_update=
_reg'
   static inline void ams_update_reg(struct ams unsigned int offset,
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
   0. Program arguments: clang -Wp,-MMD,drivers/iio/adc/.xilinx-ams.o.d -no=
stdinc -isystem /opt/cross/clang-5e004fb787/lib/clang/15.0.0/include -Iarch=
/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/=
mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./i=
nclude/generated/uapi -include include/linux/compiler-version.h -include in=
clude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ =
-DVMLINUX_LOAD_ADDRESS=3D0xffffffff80000000 -DLINKER_LOAD_ADDRESS=3D0x80000=
000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-secu=
rity -std=3Dgnu89 --target=3Dmipsel-linux -fintegrated-as -Werror=3Dunknown=
-warning-option -Werror=3Dignored-optimization-argument -mno-check-zero-div=
ision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -DGAS_HAS_S=
ET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=3D=
mips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ra=
link -Iarch/mips/include/asm/mach-ralink/mt7620 -Iarch/mips/include/asm/mac=
h-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -=
Wno-frame-address -Wno-address-of-packed-member -Os -Wframe-larger-than=3D1=
024 -fstack-protector -Wno-gnu -mno-global-merge -Wno-unused-but-set-variab=
le -Wno-unused-const-variable -ftrivial-auto-var-init=3Dzero -enable-trivia=
l-auto-var-init-zero-knowing-it-will-be-removed-from-clang -fno-stack-clash=
-protection -pg -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-=
array-bounds -fno-strict-overflow -fno-stack-check -Werror=3Ddate-time -Wer=
ror=3Dincompatible-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-s=
tyle-definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-c=
onst-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-l=
imits -I drivers/iio/adc -I ./drivers/iio/adc -DMODULE -mlong-calls -DKBUIL=
D_BASENAME=3D"xilinx_ams" -DKBUILD_MODNAME=3D"xilinx_ams" -D__KBUILD_MODNAM=
E=3Dkmod_xilinx_ams -c -o drivers/iio/adc/xilinx-ams.o drivers/iio/adc/xili=
nx-ams.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/iio/adc/xilin=
x-ams.c'.
   4. Running pass 'Mips Assembly Printer' on function '@ams_apb_pl_read_re=
g'
   #0 0x000056341a75dc6f Signals.cpp:0:0
   #1 0x000056341a75ba94 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-5e004fb787/bin/clang-15+0x34bba94)
   #2 0x000056341a69adf7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-5e004fb787/bin/clang-15+0x33fadf7)
   #3 0x000056341a7540ce llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-5e004fb787/bin/clang-15+0x34b40ce)
   #4 0x00005634183632db (/opt/cross/clang-5e004fb787/bin/clang-15+0x10c32d=
b)
   #5 0x000056341a6a192c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x340192c)
   #6 0x000056341b3eb5d0 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-5e004fb787/bin/clang-15+0x414b5d0)
   #7 0x000056341b3e74d2 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-5e004fb787/bin/clang-15+0x41474d2)
   #8 0x0000563418dfe817 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x1b5e817)
   #9 0x0000563419ae623d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x0000563419f2eef7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8eef7)
   #11 0x0000563419f2f071 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8f071)
   #12 0x0000563419f2fbef llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8fbef)
   #13 0x000056341aa9334f clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-5e004fb787/bin/clang-15+0x37f3=
34f)
   #14 0x000056341b715011 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x4475011)
   #15 0x000056341c29e0c1 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-5e004fb787/bin/clang-15+0x4ffe0c1)
   #16 0x000056341b7146d5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-5e004fb787/bin/clang-15+0x44746d5)
   #17 0x000056341b0fa981 clang::FrontendAction::Execute() (/opt/cross/clan=
g-5e004fb787/bin/clang-15+0x3e5a981)
   #18 0x000056341b08ef0a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3deef0a)
   #19 0x000056341b1c1f0b (/opt/cross/clang-5e004fb787/bin/clang-15+0x3f21f=
0b)
   #20 0x000056341836488c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-5e004fb787/bin/clang-15+0x10c488c)
   #21 0x000056341836155b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000056341af1dc95 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000056341a69acb3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-5e004fb787/bin/clang-15+0x33facb3)
   #24 0x000056341af1e58e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000056341aef0917 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-5e0=
04fb787/bin/clang-15+0x3c50917)
   #26 0x000056341aef12f7 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c512f7)
   #27 0x000056341aefa7ea clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c5a7ea)
   #28 0x00005634182ad99f main (/opt/cross/clang-5e004fb787/bin/clang-15+0x=
100d99f)
   #29 0x00007f70439de7fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #30 0x000056341836107a _start (/opt/cross/clang-5e004fb787/bin/clang-15+=
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
>> drivers/iio/adc/xilinx-ams.c:384:10: warning: signed shift result (0x446=
A60000) requires 36 bits to represent, but 'long' only has 32 bits
   =3D AMS_TEMP_OFFSET;
   ^~~~~~~~~~~~~~~
   drivers/iio/adc/xilinx-ams.h:134:47: note: expanded from macro 'AMS_TEMP=
_OFFSET'
   #define AMS_TEMP_OFFSET -((280230L << 16) / 509314)
   ~~~~~~~ ^ ~~
>> drivers/iio/adc/xilinx-ams.c:38:20: warning: unused function 'ams_update=
_reg'
   static inline void ams_update_reg(struct ams unsigned int offset,
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
   0. Program arguments: clang -Wp,-MMD,drivers/iio/adc/.xilinx-ams.o.d -no=
stdinc -isystem /opt/cross/clang-5e004fb787/lib/clang/15.0.0/include -Iarch=
/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/=
mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./i=
nclude/generated/uapi -include include/linux/compiler-version.h -include in=
clude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ =
-DVMLINUX_LOAD_ADDRESS=3D0xffffffff80000000 -DLINKER_LOAD_ADDRESS=3D0x80000=
000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-secu=
rity -std=3Dgnu89 --target=3Dmipsel-linux -fintegrated-as -Werror=3Dunknown=
-warning-option -Werror=3Dignored-optimization-argument -mno-check-zero-div=
ision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -DGAS_HAS_S=
ET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=3D=
mips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-ra=
link -Iarch/mips/include/asm/mach-ralink/mt7620 -Iarch/mips/include/asm/mac=
h-generic -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -=
Wno-frame-address -Wno-address-of-packed-member -Os -Wframe-larger-than=3D1=
024 -fstack-protector -Wno-gnu -mno-global-merge -Wno-unused-but-set-variab=
le -Wno-unused-const-variable -ftrivial-auto-var-init=3Dzero -enable-trivia=
l-auto-var-init-zero-knowing-it-will-be-removed-from-clang -fno-stack-clash=
-protection -pg -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-=
array-bounds -fno-strict-overflow -fno-stack-check -Werror=3Ddate-time -Wer=
ror=3Dincompatible-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wm=
issing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-s=
tyle-definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-c=
onst-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-l=
imits -DMODULE -mlong-calls -DKBUILD_BASENAME=3D"xilinx_ams" -DKBUILD_MODNA=
ME=3D"xilinx_ams" -D__KBUILD_MODNAME=3Dkmod_xilinx_ams -c -o drivers/iio/ad=
c/xilinx-ams.o drivers/iio/adc/xilinx-ams.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/iio/adc/xilin=
x-ams.c'.
   4. Running pass 'Mips Assembly Printer' on function '@ams_apb_pl_read_re=
g'
   #0 0x0000561b339a2c6f Signals.cpp:0:0
   #1 0x0000561b339a0a94 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-5e004fb787/bin/clang-15+0x34bba94)
   #2 0x0000561b338dfdf7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-5e004fb787/bin/clang-15+0x33fadf7)
   #3 0x0000561b339990ce llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-5e004fb787/bin/clang-15+0x34b40ce)
   #4 0x0000561b315a82db (/opt/cross/clang-5e004fb787/bin/clang-15+0x10c32d=
b)
   #5 0x0000561b338e692c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x340192c)
   #6 0x0000561b346305d0 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-5e004fb787/bin/clang-15+0x414b5d0)
   #7 0x0000561b3462c4d2 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-5e004fb787/bin/clang-15+0x41474d2)
   #8 0x0000561b32043817 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x1b5e817)
   #9 0x0000561b32d2b23d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x0000561b33173ef7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8eef7)
   #11 0x0000561b33174071 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8f071)
   #12 0x0000561b33174bef llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-5e004fb787/bin/clang-15+0x2c8fbef)
   #13 0x0000561b33cd834f clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-5e004fb787/bin/clang-15+0x37f3=
34f)
   #14 0x0000561b3495a011 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x4475011)
   #15 0x0000561b354e30c1 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-5e004fb787/bin/clang-15+0x4ffe0c1)
   #16 0x0000561b349596d5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-5e004fb787/bin/clang-15+0x44746d5)
   #17 0x0000561b3433f981 clang::FrontendAction::Execute() (/opt/cross/clan=
g-5e004fb787/bin/clang-15+0x3e5a981)
   #18 0x0000561b342d3f0a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3deef0a)
   #19 0x0000561b34406f0b (/opt/cross/clang-5e004fb787/bin/clang-15+0x3f21f=
0b)
   #20 0x0000561b315a988c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-5e004fb787/bin/clang-15+0x10c488c)
   #21 0x0000561b315a655b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x0000561b34162c95 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000561b338dfcb3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-5e004fb787/bin/clang-15+0x33facb3)
   #24 0x0000561b3416358e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x0000561b34135917 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-5e0=
04fb787/bin/clang-15+0x3c50917)
   #26 0x0000561b341362f7 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c512f7)
   #27 0x0000561b3413f7ea clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-5e004fb787/bin/clang-15+0x3c5a7ea)
   #28 0x0000561b314f299f main (/opt/cross/clang-5e004fb787/bin/clang-15+0x=
100d99f)
   #29 0x00007fedb55967fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #30 0x0000561b315a607a _start (/opt/cross/clang-5e004fb787/bin/clang-15+=
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


vim +/long +384 drivers/iio/adc/xilinx-ams.c

   313=09
   314	static int ams_read_raw(struct iio_dev *indio_dev,
   315				struct iio_chan_spec const *chan,
   316				int *val, int *val2, long mask)
   317	{
   318		struct ams *ams =3D iio_priv(indio_dev);
   319=09
   320		switch (mask) {
   321		case IIO_CHAN_INFO_RAW:
   322			mutex_lock(&ams->mutex);
   323			if (chan->scan_index >=3D (PS_SEQ_MAX * 3))
   324				ams_read_vcc_reg(ams, chan->address, val);
   325			else if (chan->scan_index >=3D PS_SEQ_MAX)
   326				ams->pl_bus->read(ams, chan->address, val);
   327			else
   328				ams_ps_read_reg(ams, chan->address, val);
   329			mutex_unlock(&ams->mutex);
   330=09
   331			*val2 =3D 0;
   332			return IIO_VAL_INT;
   333		case IIO_CHAN_INFO_SCALE:
   334			switch (chan->type) {
   335			case IIO_VOLTAGE:
   336				switch (chan->address) {
   337				case AMS_SUPPLY1:
   338				case AMS_SUPPLY2:
   339				case AMS_SUPPLY3:
   340				case AMS_SUPPLY4:
   341					*val =3D AMS_SUPPLY_SCALE_3VOLT;
   342					break;
   343				case AMS_SUPPLY5:
   344				case AMS_SUPPLY6:
   345					if (chan->scan_index < PS_SEQ_MAX)
   346						*val =3D AMS_SUPPLY_SCALE_6VOLT;
   347					else
   348						*val =3D AMS_SUPPLY_SCALE_3VOLT;
   349					break;
   350				case AMS_SUPPLY7:
   351				case AMS_SUPPLY8:
   352					*val =3D AMS_SUPPLY_SCALE_6VOLT;
   353					break;
   354				case AMS_SUPPLY9:
   355				case AMS_SUPPLY10:
   356					if (chan->scan_index < PS_SEQ_MAX)
   357						*val =3D AMS_SUPPLY_SCALE_3VOLT;
   358					else
   359						*val =3D AMS_SUPPLY_SCALE_6VOLT;
   360					break;
   361				case AMS_VREFP:
   362				case AMS_VREFN:
   363						*val =3D AMS_SUPPLY_SCALE_3VOLT;
   364					break;
   365=09
   366				default:
   367					if (chan->scan_index >=3D (PS_SEQ_MAX * 3))
   368						*val =3D AMS_SUPPLY_SCALE_3VOLT;
   369					else
   370						*val =3D AMS_SUPPLY_SCALE_1VOLT;
   371					break;
   372				}
   373				*val2 =3D AMS_SUPPLY_SCALE_DIV_BIT;
   374				return IIO_VAL_FRACTIONAL_LOG2;
   375			case IIO_TEMP:
   376				*val =3D AMS_TEMP_SCALE;
   377				*val2 =3D AMS_TEMP_SCALE_DIV_BIT;
   378				return IIO_VAL_FRACTIONAL_LOG2;
   379			default:
   380				return -EINVAL;
   381			}
   382		case IIO_CHAN_INFO_OFFSET:
   383			/* Only the temperature channel has an offset */
 > 384			*val =3D AMS_TEMP_OFFSET;
   385			*val2 =3D 0;
   386			return IIO_VAL_INT;
   387		}
   388=09
   389		return -EINVAL;
   390	}
   391=09

--=20
0-DAY CI Kernel Test Service
https://01.org/lkp
