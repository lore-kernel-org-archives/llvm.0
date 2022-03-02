Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB43FE3
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 17:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646241940; x=1677777940;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=BpGUmRvLcuuhQUmV5XKxn7HBljkiJiyMs4yD90rxIlQ=;
  b=DiGRsOXM4tbYphvTcTLF/xhUmnMcvtB8oEBOL4CSy/ismC+I5+Na9XI7
   dhFXHaQFJtP08Yfnf1wta4lRv/wQp5LZLeb1IfiQJs8Zdmbs153nb+aMm
   yM6YlPXpK7GX3p5f23Hn6wnpc5NxXQPvQSkXrFsGwViHAsIyCEtX2JAlX
   TpOCkZ70l7Ta/glsSpdo8H1dkzuL7yS4iEsiuClVzbWjzzdk+fosUDPDb
   r46GfoG29C5Yk8RrB9c4LkKLWkYkt4hWQnfKaXaEP5mk2YvPC59qBNMcw
   q/oyMjmz1cFB4nrSQc9e82OVxrB0Nti/UJOpxeLBvdihikdczUtl+G9Bv
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="240873996"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="240873996"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 09:25:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; 
   d="scan'208";a="535469636"
Received: from lkp-server02.sh.intel.com (HELO e9605edfa585) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Mar 2022 09:25:18 -0800
Received: from kbuild by e9605edfa585 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPSiz-0001ej-LF; Wed, 02 Mar 2022 17:25:17 +0000
Date: Thu, 3 Mar 2022 01:24:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 9641/10053] clang-15: error: clang frontend
 command failed with exit code 70 (use -v to see invocation)
Message-ID: <202203030117.MEHb12Te-lkp@intel.com>
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

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kees Cook <keescook@chromium.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   adaedcf826dccf01b69d9a1f1997c9446c6b2c54
commit: 200ed341b8646ea893d5466974d6e107c46237ba [9641/10053] mips: Impleme=
nt "current_stack_pointer"
config: mips-randconfig-c004-20220302 (https://download.01.org/0day-ci/arch=
ive/20220303/202203030117.MEHb12Te-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D200ed341b8646ea893d5466974d6e107c46237ba
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 200ed341b8646ea893d5466974d6e107c46237ba
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash arch/mips/lib/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fatal error: error in backend: Invalid register name global variable
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,arch/mips/lib/.uncached.o.d -nostdi=
nc -Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./includ=
e -Iarch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/u=
api -I./include/generated/uapi -include include/linux/compiler-version.h -i=
nclude include/linux/kconfig.h -include include/linux/compiler_types.h -D__=
KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=
=3D0x84000000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D =
-DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplic=
it-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-f=
ormat-security -std=3Dgnu89 --target=3Dmips-linux -fintegrated-as -Werror=
=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-chec=
k-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -=
DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EB -fno-stack-check=
 -march=3Dmips32r2 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include=
/asm/mach-ath79 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwi=
nd-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-o=
f-packed-member -Os -Wframe-larger-than=3D1024 -fno-stack-protector -Wimpli=
cit-fallthrough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable -Wn=
o-unused-const-variable -ftrivial-auto-var-init=3Dzero -enable-trivial-auto=
-var-init-zero-knowing-it-will-be-removed-from-clang -fno-stack-clash-prote=
ction -pg -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-func=
tion-type -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Wextra -Wunused -Wno-unu=
sed-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmissing-p=
rototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-but-set-va=
riable -Wunused-const-variable -Wno-missing-field-initializers -Wno-sign-co=
mpare -Wno-type-limits -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanit=
ize=3Dbool -fsanitize=3Denum -I arch/mips/lib -I ./arch/mips/lib -ffunction=
-sections -fdata-sections -DKBUILD_MODFILE=3D"arch/mips/lib/uncached" -DKBU=
ILD_BASENAME=3D"uncached" -DKBUILD_MODNAME=3D"uncached" -D__KBUILD_MODNAME=
=3Dkmod_uncached -c -o arch/mips/lib/uncached.o arch/mips/lib/uncached.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'arch/mips/lib/uncache=
d.c'.
   4. Running pass 'MIPS DAG->DAG Pattern Instruction Selection' on functio=
n '@run_uncached'
   #0 0x000056377073ad7f Signals.cpp:0:0
   #1 0x0000563770738c5c llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-d271fc04d5/bin/clang-15+0x348ec5c)
   #2 0x0000563770678fd7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-d271fc04d5/bin/clang-15+0x33cefd7)
   #3 0x000056377073130e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-d271fc04d5/bin/clang-15+0x348730e)
   #4 0x000056376e35cccb (/opt/cross/clang-d271fc04d5/bin/clang-15+0x10b2cc=
b)
   #5 0x000056377067fa8c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-d271fc04d5/bin/clang-15+0x33d5a8c)
   #6 0x000056377067fbe8 (/opt/cross/clang-d271fc04d5/bin/clang-15+0x33d5be=
8)
   #7 0x000056376ee0dfb8 llvm::MipsTargetLowering::getRegisterByName(char l=
lvm::LLT, llvm::MachineFunction const&) const (/opt/cross/clang-d271fc04d5/=
bin/clang-15+0x1b63fb8)
   #8 0x000056377158661a (/opt/cross/clang-d271fc04d5/bin/clang-15+0x42dc61=
a)
   #9 0x0000563771587edb unsigned char unsigned int) (/opt/cross/clang-d271=
fc04d5/bin/clang-15+0x42ddedb)
   #10 0x0000563771585d7c llvm::SelectionDAGISel::DoInstructionSelection() =
(/opt/cross/clang-d271fc04d5/bin/clang-15+0x42dbd7c)
   #11 0x000056377158dd76 llvm::SelectionDAGISel::CodeGenAndEmitDAG() (/opt=
/cross/clang-d271fc04d5/bin/clang-15+0x42e3d76)
   #12 0x00005637715910e6 llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm=
::Function const&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x42e70e6)
   #13 0x00005637715933b7 llvm::SelectionDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (.part.985) SelectionDAGISel.cpp:0:0
   #14 0x000056376ee0c80a llvm::MipsDAGToDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x1b6280a)
   #15 0x000056376fa8354d llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.53) MachineFunctionPass.cpp:0:0
   #16 0x000056376feca807 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x2c20807)
   #17 0x000056376feca981 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-d271fc04d5/bin/clang-15+0x2c20981)
   #18 0x000056376fecb4ff llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-d271fc04d5/bin/clang-15+0x2c214ff)
   #19 0x0000563770a55147 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x37ab=
147)
   #20 0x00005637716a3693 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x43f9693)
   #21 0x000056377217e6e9 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-d271fc04d5/bin/clang-15+0x4ed46e9)
   #22 0x00005637716a24cf clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-d271fc04d5/bin/clang-15+0x43f84cf)
   #23 0x00005637710a5561 clang::FrontendAction::Execute() (/opt/cross/clan=
g-d271fc04d5/bin/clang-15+0x3dfb561)
   #24 0x000056377103bfaa clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x3d91faa)
   #25 0x0000563771169cbb (/opt/cross/clang-d271fc04d5/bin/clang-15+0x3ebfc=
bb)
   #26 0x000056376e35e27c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-d271fc04d5/bin/clang-15+0x10b427c)
   #27 0x000056376e35af4b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #28 0x0000563770ed4d95 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #29 0x0000563770678e93 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x33cee93)
   #30 0x0000563770ed568e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #31 0x0000563770eaa267 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-d27=
1fc04d5/bin/clang-15+0x3c00267)
   #32 0x0000563770eaac47 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-d271fc04d5/bin/clang-15+0x3c00c47)
   #33 0x0000563770eb42f9 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-d271fc04d5/bin/clang-15+0x3c0a2f9)
   #34 0x000056376e28363f main (/opt/cross/clang-d271fc04d5/bin/clang-15+0x=
fd963f)
   #35 0x00007f164095bd0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #36 0x000056376e35aa6a _start (/opt/cross/clang-d271fc04d5/bin/clang-15+=
0x10b0a6a)
>> clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project d271fc04d5b97b12e6b79=
7c6067d3c96a8d7470e)
   Target: mips-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-d271fc04d5/bin
   clang-15: note: diagnostic msg:
   Makefile arch include kernel nr_bisected scripts source usr

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
