Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BEB46AF
	for <llvm@lists.linux.dev>; Sat, 30 Apr 2022 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651305298; x=1682841298;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Uo/+1NXcFEcYdnzduxpEYF+uLCrCB9kEWLVTnGK8rg4=;
  b=blDjWS1EmloZFKrXFGkEDIC5wi3zVMDNYvQXZuUz8iuUsd+vIHVZgCSC
   3yoXrs2DRMlHUTZHPGJUN42U9K/4vzH+nHkFllzpouEM6cZqQz8US3Cwm
   95uXAN7HiJ7J85M769BboAIfubC9EQEBhzDeVVuOHTYD7tuZhdQd8lKO8
   PLT2Fkik4p116Azo5LpwqZmeJmXgm2a8DVKphg+KkMnXL1HY+ZtuyFYR1
   B+TGlmu/TFReSc95WU8sr3+k+hA+c/AFCscPVyzGp+khBL0vt36BqFu7h
   Ck9Qk3kSDodtTzkCcNnvOzYyh9ktcoJkGXOuhmpelAPBccAm4gLbA//Mc
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="327358719"
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600"; 
   d="scan'208";a="327358719"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2022 00:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,187,1647327600"; 
   d="scan'208";a="706904823"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2022 00:54:40 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkhw7-000711-Tr;
	Sat, 30 Apr 2022 07:54:39 +0000
Date: Sat, 30 Apr 2022 15:54:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: clang-15: error: clang frontend command failed with exit code 70
 (use -v to see invocation)
Message-ID: <202204301559.JgadYNO1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>
CC: Hector Martin <marcan@marcan.st>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8013d1d3d2e33236dee13a133fba49ad55045e79
commit: 5a6bbd1d18cabf5a680e726f0ef8f6dda0105fe8 dt-bindings: arm-pmu: Docu=
ment Apple PMU compatible strings
date:   3 months ago
config: riscv-randconfig-r002-20220429 (https://download.01.org/0day-ci/arc=
hive/20220430/202204301559.JgadYNO1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5a6bbd1d18cabf5a680e726f0ef8f6dda0105fe8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5a6bbd1d18cabf5a680e726f0ef8f6dda0105fe8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fatal error: error in backend: Frame offsets outside of the signed 32-bi=
t range not supported
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,fs/quota/.quota.o.d -nostdinc -Iarc=
h/riscv/include -I./arch/riscv/include/generated -Iinclude -I./include -Iar=
ch/riscv/include/uapi -I./arch/riscv/include/generated/uapi -Iinclude/uapi =
-I./include/generated/uapi -include include/linux/compiler-version.h -inclu=
de include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERN=
EL__ -Qunused-arguments -fmacro-prefix-map=3D=3D -DKBUILD_EXTRA_WARN1 -Wall=
 -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -f=
no-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -W=
error=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu8=
9 --target=3Driscv32-linux -fintegrated-as -Werror=3Dunknown-warning-option=
 -Werror=3Dignored-optimization-argument -mabi=3Dilp32 -mno-relax -march=3D=
rv32imac -mno-save-restore -DCONFIG_PAGE_OFFSET=3D0xC0000000 -mcmodel=3Dmed=
low -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-pack=
ed-member -O2 -Wframe-larger-than=3D1024 -fno-stack-protector -Wimplicit-fa=
llthrough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable -Wno-unus=
ed-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftri=
vial-auto-var-init=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-wil=
l-be-removed-from-clang -fno-stack-clash-protection -Wdeclaration-after-sta=
tement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-array-bounds -fno-=
strict-overflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dincompatible=
-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-declaration=
s -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition -W=
missing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -Wno=
-missing-field-initializers -Wno-sign-compare -Wno-type-limits -fsanitize=
=3Darray-bounds -fsanitize=3Dbool -fsanitize-coverage=3Dtrace-pc -I fs/quot=
a -I ./fs/quota -DKBUILD_MODFILE=3D"fs/quota/quota" -DKBUILD_BASENAME=3D"qu=
ota" -DKBUILD_MODNAME=3D"quota" -D__KBUILD_MODNAME=3Dkmod_quota -c -o fs/qu=
ota/quota.o fs/quota/quota.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'fs/quota/quota.c'.
   4. Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@quota_getinfo'
   #0 0x000055b370ec3cbf Signals.cpp:0:0
   #1 0x000055b370ec1ae4 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-4007756499/bin/clang-15+0x34b5ae4)
   #2 0x000055b370e00f77 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-4007756499/bin/clang-15+0x33f4f77)
   #3 0x000055b370eba11e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-4007756499/bin/clang-15+0x34ae11e)
   #4 0x000055b36eacda9b (/opt/cross/clang-4007756499/bin/clang-15+0x10c1a9=
b)
   #5 0x000055b370e07aac llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-4007756499/bin/clang-15+0x33fbaac)
   #6 0x000055b370e07c08 (/opt/cross/clang-4007756499/bin/clang-15+0x33fbc0=
8)
   #7 0x000055b36f85bffe llvm::RISCVRegisterInfo::eliminateFrameIndex(llvm:=
:MachineInstrBundleIterator<llvm::MachineInstr, false>, int, unsigned int, =
const (/opt/cross/clang-4007756499/bin/clang-15+0x1e4fffe)
   #8 0x000055b37032fdf0 (anonymous llvm::MachineFunction&, int&) (.isra.29=
0) PrologEpilogInserter.cpp:0:0
   #9 0x000055b3703387d0 (anonymous namespace)::PEI::runOnMachineFunction(l=
lvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
   #10 0x000055b37024742d llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.53) MachineFunctionPass.cpp:0:0
   #11 0x000055b37068e987 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-4007756499/bin/clang-15+0x2c82987)
   #12 0x000055b37068eb01 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-4007756499/bin/clang-15+0x2c82b01)
   #13 0x000055b37068f67f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-4007756499/bin/clang-15+0x2c8367f)
   #14 0x000055b3711eef9f clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-4007756499/bin/clang-15+0x37e2=
f9f)
   #15 0x000055b371e6bf81 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-4007756499/bin/clang-15+0x445ff81)
   #16 0x000055b3729f2471 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-4007756499/bin/clang-15+0x4fe6471)
   #17 0x000055b371e6b645 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-4007756499/bin/clang-15+0x445f645)
   #18 0x000055b371853d81 clang::FrontendAction::Execute() (/opt/cross/clan=
g-4007756499/bin/clang-15+0x3e47d81)
   #19 0x000055b3717e874a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-4007756499/bin/clang-15+0x3ddc74a)
   #20 0x000055b37191b25b (/opt/cross/clang-4007756499/bin/clang-15+0x3f0f2=
5b)
   #21 0x000055b36eacf04c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-4007756499/bin/clang-15+0x10c304c)
   #22 0x000055b36eacbd1b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #23 0x000055b371678b05 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #24 0x000055b370e00e33 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-4007756499/bin/clang-15+0x33f4e33)
   #25 0x000055b3716793fe clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #26 0x000055b37164cba7 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-400=
7756499/bin/clang-15+0x3c40ba7)
   #27 0x000055b37164d587 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-4007756499/bin/clang-15+0x3c41587)
   #28 0x000055b3716570b9 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-4007756499/bin/clang-15+0x3c4b0b9)
   #29 0x000055b36ea17a4f main (/opt/cross/clang-4007756499/bin/clang-15+0x=
100ba4f)
   #30 0x00007f0b03f267fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #31 0x000055b36eacb83a _start (/opt/cross/clang-4007756499/bin/clang-15+=
0x10bf83a)
>> clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 400775649969b9baf3bc2=
a510266e7912bb16ae9)
   Target: riscv32-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-4007756499/bin
   clang-15: note: diagnostic msg:
   Makefile arch fs include kernel nr_bisected scripts source usr

--=20
0-DAY CI Kernel Test Service
https://01.org/lkp
