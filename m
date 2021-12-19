Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D078B2CA0
	for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 05:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639891524; x=1671427524;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3teEiinEGV41x7D3YbYlJ9bGE87JQUHO/nhOoO+S8+w=;
  b=Na/oNWlHJXr6WLA+I7C53po8Nx3pAaQApDBreju9S3bZVFxRiyHJD/MT
   nCMbJo/Y2flc8oYfcuqzvRQU4nk5qgua7fxARTYzMuGy09xm+BpS0z2dL
   d2n2BkzNM8sD5nKl7Rwx9BCNj6RnQez+gZLS7lVam8Tzg0QJsg/dIzreF
   dfOL1xEHCo6MAinsZJBMPWLVmBH54dVsFHpfG9Li0qNouAN4R5vGjBU98
   fx2YTI7sr4s+/E4RHmqxvG5IyKk0DaSfbEzRu1A0/8FYsLK7zV0NFFURV
   59QANXHazmJcIGwQ2FQdGQ6w2QSESQfUuQHa2cWQbP6YFAUJMj+EB7T6d
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="326274793"
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; 
   d="scan'208";a="326274793"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2021 21:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; 
   d="scan'208";a="507272091"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Dec 2021 21:25:21 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myohF-0006k2-7f; Sun, 19 Dec 2021 05:25:21 +0000
Date: Sun, 19 Dec 2021 13:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Czerner <lczerner@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Carlos Maiolino <cmaiolino@redhat.com>
Subject: [linux-next:master 5750/8462] fs/ext4/super.c:2295:1: warning:
 unused function 'ctx_test_flags'
Message-ID: <202112191335.snZPYBOx-lkp@intel.com>
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
head:   c122052c3cb861b3e61a01d2c2ab9069e470663e
commit: 6e47a3cc68fc525428297a00524833361ebbb0e9 [5750/8462] ext4: get rid =
of super block and sbi from handle_mount_ops()
config: mips-randconfig-r025-20211219 (https://download.01.org/0day-ci/arch=
ive/20211219/202112191335.snZPYBOx-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 683cbc=
12b33e5c8dc8d29bf5ed79fbf45763aadd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6e47a3cc68fc525428297a00524833361ebbb0e9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6e47a3cc68fc525428297a00524833361ebbb0e9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash fs/ext4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/ext4/super.c:2295:1: warning: unused function 'ctx_test_flags'
   EXT4_SET_CTX(flags);
   ^
   fs/ext4/super.c:2290:20: note: expanded from macro 'EXT4_SET_CTX'
   static inline bool ctx_test_##name(struct ext4_fs_context int flag) ^
   <scratch space>:101:1: note: expanded from here
   ctx_test_flags
   ^
>> fs/ext4/super.c:2298:1: warning: unused function 'ctx_clear_mount_flags'
   EXT4_SET_CTX(mount_flags);
   ^
   fs/ext4/super.c:2285:20: note: expanded from macro 'EXT4_SET_CTX'
   static inline void ctx_clear_##name(struct ext4_fs_context int flag) ^
   <scratch space>:122:1: note: expanded from here
   ctx_clear_mount_flags
   ^
>> fs/ext4/super.c:2298:1: warning: unused function 'ctx_test_mount_flags'
   fs/ext4/super.c:2290:20: note: expanded from macro 'EXT4_SET_CTX'
   static inline bool ctx_test_##name(struct ext4_fs_context int flag) ^
   <scratch space>:125:1: note: expanded from here
   ctx_test_mount_flags
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set mips64r2
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/bitops.h", .line =3D 129, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .s=
et push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $0, $1
   ins $0, $$0, $2, 1
   sc $0, $1
   beqz $0, 1b
   .set pop
   '
   PLEASE submit a bug report to https://bugs.llvm.org/ and include the cra=
sh backtrace, preprocessed source, and associated run script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,fs/ext4/.super.o.d -nostdinc -Iarch=
/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/=
mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./i=
nclude/generated/uapi -include include/linux/compiler-version.h -include in=
clude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ =
-DVMLINUX_LOAD_ADDRESS=3D0xffffffff88000000 -DLINKER_LOAD_ADDRESS=3D0x88000=
000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-secu=
rity -std=3Dgnu89 --target=3Dmipsel-linux -fintegrated-as -Werror=3Dunknown=
-warning-option -Werror=3Dignored-optimization-argument -mno-check-zero-div=
ision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -DGAS_HAS_S=
ET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=3D=
mips32r2 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-=
pic32 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables =
-fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packed-m=
ember -O2 -Wframe-larger-than=3D1024 -fno-stack-protector -Wimplicit-fallth=
rough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable -Wno-unused-c=
onst-variable -ftrivial-auto-var-init=3Dzero -enable-trivial-auto-var-init-=
zero-knowing-it-will-be-removed-from-clang -fno-stack-clash-protection -pg =
-Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -fn=
o-strict-overflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dincompatib=
le-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarati=
ons -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition =
-Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -W=
no-missing-field-initializers -Wno-sign-compare -Wno-type-limits -fsanitize=
=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dinteger-divide-by-zero -fsa=
nitize=3Dobject-size -fsanitize=3Dbool -fsanitize-coverage=3Dtrace-pc -fsan=
itize-coverage=3Dtrace-cmp -I fs/ext4 -I ./fs/ext4 -DMODULE -mlong-calls -D=
KBUILD_BASENAME=3D"super" -DKBUILD_MODNAME=3D"ext4" -D__KBUILD_MODNAME=3Dkm=
od_ext4 -c -o fs/ext4/super.o fs/ext4/super.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'fs/ext4/super.c'.
   4. Running pass 'Mips Assembly Printer' on function '@ext4_read_bh_nowai=
t'
   #0 0x00005632070aef1f Signals.cpp:0:0
   #1 0x00005632070ace6c llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-683cbc12b3/bin/clang-14+0x33dde6c)
   #2 0x0000563206ff0917 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-683cbc12b3/bin/clang-14+0x3321917)
   #3 0x00005632070a551e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-683cbc12b3/bin/clang-14+0x33d651e)
   #4 0x0000563204d376cb (/opt/cross/clang-683cbc12b3/bin/clang-14+0x10686c=
b)
   #5 0x0000563206ff73bc llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-683cbc12b3/bin/clang-14+0x33283bc)
   #6 0x0000563207ccfdf8 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-683cbc12b3/bin/clang-14+0x4000df8)
   #7 0x0000563207ccbb99 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-683cbc12b3/bin/clang-14+0x3ffcb99)
   #8 0x000056320578d14e llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x1abe14e)
   #9 0x000056320642055d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x0000563206858a27 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x2b89a27)
   #11 0x0000563206858ba1 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-683cbc12b3/bin/clang-14+0x2b89ba1)
   #12 0x0000563206859e7f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-683cbc12b3/bin/clang-14+0x2b8ae7f)
   #13 0x00005632073bbfea clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x36ec=
fea)
   #14 0x0000563207fe3d53 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x4314d53)
   #15 0x0000563208ae6719 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-683cbc12b3/bin/clang-14+0x4e17719)
   #16 0x0000563207fe2baf clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-683cbc12b3/bin/clang-14+0x4313baf)
   #17 0x00005632079dfa91 clang::FrontendAction::Execute() (/opt/cross/clan=
g-683cbc12b3/bin/clang-14+0x3d10a91)
   #18 0x0000563207977eca clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x3ca8eca)
   #19 0x0000563207aa8c1b (/opt/cross/clang-683cbc12b3/bin/clang-14+0x3dd9c=
1b)
   #20 0x0000563204d38414 cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-683cbc12b3/bin/clang-14+0x1069414)
   #21 0x0000563204d3595b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000056320781ab35 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000563206ff07d3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x33217d3)
   #24 0x000056320781b437 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x00005632077f24d7 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-683=
cbc12b3/bin/clang-14+0x3b234d7)
   #26 0x00005632077f2eb7 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-683cbc12b3/bin/clang-14+0x3b23eb7)
   #27 0x00005632077fc389 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x3b2d389)
   #28 0x0000563204c6213f main (/opt/cross/clang-683cbc12b3/bin/clang-14+0x=
f9313f)
   #29 0x00007f36f8b28d0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x0000563204d3547a _start (/opt/cross/clang-683cbc12b3/bin/clang-14+=
0x106647a)
   clang-14: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 14.0.0 (git://gitmirror/llvm_project 683cbc12b33e5c8dc8d29=
bf5ed79fbf45763aadd)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-683cbc12b3/bin
   clang-14: note: diagnostic msg:
   Makefile arch drivers fs include kernel nr_bisected scripts source usr
--
>> fs/ext4/super.c:2295:1: warning: unused function 'ctx_test_flags'
   EXT4_SET_CTX(flags);
   ^
   fs/ext4/super.c:2290:20: note: expanded from macro 'EXT4_SET_CTX'
   static inline bool ctx_test_##name(struct ext4_fs_context int flag) ^
   <scratch space>:101:1: note: expanded from here
   ctx_test_flags
   ^
>> fs/ext4/super.c:2298:1: warning: unused function 'ctx_clear_mount_flags'
   EXT4_SET_CTX(mount_flags);
   ^
   fs/ext4/super.c:2285:20: note: expanded from macro 'EXT4_SET_CTX'
   static inline void ctx_clear_##name(struct ext4_fs_context int flag) ^
   <scratch space>:122:1: note: expanded from here
   ctx_clear_mount_flags
   ^
>> fs/ext4/super.c:2298:1: warning: unused function 'ctx_test_mount_flags'
   fs/ext4/super.c:2290:20: note: expanded from macro 'EXT4_SET_CTX'
   static inline bool ctx_test_##name(struct ext4_fs_context int flag) ^
   <scratch space>:125:1: note: expanded from here
   ctx_test_mount_flags
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set mips64r2
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/bitops.h", .line =3D 129, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .s=
et push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $0, $1
   ins $0, $$0, $2, 1
   sc $0, $1
   beqz $0, 1b
   .set pop
   '
   PLEASE submit a bug report to https://bugs.llvm.org/ and include the cra=
sh backtrace, preprocessed source, and associated run script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,fs/ext4/.super.o.d -nostdinc -Iarch=
/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iarch/=
mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I./i=
nclude/generated/uapi -include include/linux/compiler-version.h -include in=
clude/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ =
-DVMLINUX_LOAD_ADDRESS=3D0xffffffff88000000 -DLINKER_LOAD_ADDRESS=3D0x88000=
000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D -DKBUILD_E=
XTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-secu=
rity -std=3Dgnu89 --target=3Dmipsel-linux -fintegrated-as -Werror=3Dunknown=
-warning-option -Werror=3Dignored-optimization-argument -mno-check-zero-div=
ision -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -DGAS_HAS_S=
ET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=3D=
mips32r2 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-=
pic32 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables =
-fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packed-m=
ember -O2 -Wframe-larger-than=3D1024 -fno-stack-protector -Wimplicit-fallth=
rough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable -Wno-unused-c=
onst-variable -ftrivial-auto-var-init=3Dzero -enable-trivial-auto-var-init-=
zero-knowing-it-will-be-removed-from-clang -fno-stack-clash-protection -pg =
-Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-array-bounds -fn=
o-strict-overflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dincompatib=
le-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-declarati=
ons -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-definition =
-Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-variable -W=
no-missing-field-initializers -Wno-sign-compare -Wno-type-limits -fsanitize=
=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dinteger-divide-by-zero -fsa=
nitize=3Dobject-size -fsanitize=3Dbool -fsanitize-coverage=3Dtrace-pc -fsan=
itize-coverage=3Dtrace-cmp -DMODULE -mlong-calls -DKBUILD_BASENAME=3D"super=
" -DKBUILD_MODNAME=3D"ext4" -D__KBUILD_MODNAME=3Dkmod_ext4 -c -o fs/ext4/su=
per.o fs/ext4/super.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'fs/ext4/super.c'.
   4. Running pass 'Mips Assembly Printer' on function '@ext4_read_bh_nowai=
t'
   #0 0x000055fee4cf8f1f Signals.cpp:0:0
   #1 0x000055fee4cf6e6c llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-683cbc12b3/bin/clang-14+0x33dde6c)
   #2 0x000055fee4c3a917 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-683cbc12b3/bin/clang-14+0x3321917)
   #3 0x000055fee4cef51e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-683cbc12b3/bin/clang-14+0x33d651e)
   #4 0x000055fee29816cb (/opt/cross/clang-683cbc12b3/bin/clang-14+0x10686c=
b)
   #5 0x000055fee4c413bc llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-683cbc12b3/bin/clang-14+0x33283bc)
   #6 0x000055fee5919df8 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-683cbc12b3/bin/clang-14+0x4000df8)
   #7 0x000055fee5915b99 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-683cbc12b3/bin/clang-14+0x3ffcb99)
   #8 0x000055fee33d714e llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x1abe14e)
   #9 0x000055fee406a55d llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000055fee44a2a27 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x2b89a27)
   #11 0x000055fee44a2ba1 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-683cbc12b3/bin/clang-14+0x2b89ba1)
   #12 0x000055fee44a3e7f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-683cbc12b3/bin/clang-14+0x2b8ae7f)
   #13 0x000055fee5005fea clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x36ec=
fea)
   #14 0x000055fee5c2dd53 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x4314d53)
   #15 0x000055fee6730719 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-683cbc12b3/bin/clang-14+0x4e17719)
   #16 0x000055fee5c2cbaf clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-683cbc12b3/bin/clang-14+0x4313baf)
   #17 0x000055fee5629a91 clang::FrontendAction::Execute() (/opt/cross/clan=
g-683cbc12b3/bin/clang-14+0x3d10a91)
   #18 0x000055fee55c1eca clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x3ca8eca)
   #19 0x000055fee56f2c1b (/opt/cross/clang-683cbc12b3/bin/clang-14+0x3dd9c=
1b)
   #20 0x000055fee2982414 cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-683cbc12b3/bin/clang-14+0x1069414)
   #21 0x000055fee297f95b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000055fee5464b35 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055fee4c3a7d3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x33217d3)
   #24 0x000055fee5465437 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000055fee543c4d7 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-683=
cbc12b3/bin/clang-14+0x3b234d7)
   #26 0x000055fee543ceb7 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-683cbc12b3/bin/clang-14+0x3b23eb7)
   #27 0x000055fee5446389 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-683cbc12b3/bin/clang-14+0x3b2d389)
   #28 0x000055fee28ac13f main (/opt/cross/clang-683cbc12b3/bin/clang-14+0x=
f9313f)
   #29 0x00007fb0dd584d0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x000055fee297f47a _start (/opt/cross/clang-683cbc12b3/bin/clang-14+=
0x106647a)
   clang-14: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 14.0.0 (git://gitmirror/llvm_project 683cbc12b33e5c8dc8d29=
bf5ed79fbf45763aadd)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-683cbc12b3/bin
   clang-14: note: diagnostic msg:
   Makefile arch drivers fs include kernel nr_bisected scripts source usr


vim +/ctx_test_flags +2295 fs/ext4/super.c

  2294=09
> 2295	EXT4_SET_CTX(flags);
  2296	EXT4_SET_CTX(mount_opt);
  2297	EXT4_SET_CTX(mount_opt2);
> 2298	EXT4_SET_CTX(mount_flags);
  2299=09

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
