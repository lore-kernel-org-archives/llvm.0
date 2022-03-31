Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645EC7C
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 11:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648726746; x=1680262746;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YdZDP2zOOxXu40DfkXpM7e32au68g0+ftVdxzB1nJPk=;
  b=YtYZQO4OQXA8aqug9vkbWmUYH6FGBTE5uinEwvVhAWYScWtPEsNrSH19
   OYjedi0zNXJY0PdIgjfADAzWObAO6D3LzwU7Gxo/ZY3Cdvfntp+hahsLk
   9nwikXD58eFXZZn6toYMRqCRqWrEXdxg9Wf1GFzyc6OVi01pV1OwFrypP
   wI34b3/CZN+tdgpeQP0hEma2/zfkGFdx1NDGWrQKb0rihYqIViI/kOQNw
   i+P8sgI0OnLVDm5z7YyPFr1IFPaRYzCenBgacbc5LVIo+6aMUyucw78ij
   dvpVYYZDuccQAGD/2MTvR+GwKEL7bKgp62fWcXGc+cWOmQrLadzjrqAPw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="247304548"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="247304548"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2022 04:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; 
   d="scan'208";a="720423325"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Mar 2022 04:39:02 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZt8n-0000DU-NH;
	Thu, 31 Mar 2022 11:39:01 +0000
Date: Thu, 31 Mar 2022 19:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [linux-next:master 14063/14948]
 drivers/dma-buf/st-dma-fence-unwrap.c:25:4: warning: unused function
 'to_mock_fence'
Message-ID: <202203311933.UhSJPTbf-lkp@intel.com>
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
head:   fdcbcd1348f4ef713668bae1b0fa9774e1811205
commit: 64a8f92fd783e750cdb81af75942dcd53bbf61bd [14063/14948] dma-buf: add=
 dma_fence_unwrap v2
config: mips-randconfig-r033-20220331 (https://download.01.org/0day-ci/arch=
ive/20220331/202203311933.UhSJPTbf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 881350=
a92d821d4f8e4fa648443ed1d17e251188)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D64a8f92fd783e750cdb81af75942dcd53bbf61bd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 64a8f92fd783e750cdb81af75942dcd53bbf61bd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/dma-buf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/dma-buf/st-dma-fence-unwrap.c:125:6: warning: variable 'err' set=
 but not used
   int err =3D 0;
   ^
   drivers/dma-buf/st-dma-fence-unwrap.c:167:6: warning: variable 'err' set=
 but not used
   int err =3D 0;
   ^
   drivers/dma-buf/st-dma-fence-unwrap.c:209:6: warning: variable 'err' set=
 but not used
   int err =3D 0;
   ^
>> drivers/dma-buf/st-dma-fence-unwrap.c:25:4: warning: unused function 'to=
_mock_fence'
   } dma_fence {
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set mips64r2
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/atomic.h", .line =3D 156, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .s=
et push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $1, $2 # atomic_fetch_sub
   subu $0, $1, $3
   sc $0, $2
   beqz $0, 1b
   .set pop
   move $0, $1
   '
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,drivers/dma-buf/.st-dma-fence-unwra=
p.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated -Iinclu=
de -I./include -Iarch/mips/include/uapi -I./arch/mips/include/generated/uap=
i -Iinclude/uapi -I./include/generated/uapi -include include/linux/compiler=
-version.h -include include/linux/kconfig.h -include include/linux/compiler=
_types.h -D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff94100000 -DLINKER_=
LOAD_ADDRESS=3D0x94100000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefi=
x-map=3D=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes =
-Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Wer=
ror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn=
-type -Wno-format-security -std=3Dgnu89 --target=3Dmipsel-linux -fintegrate=
d-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argume=
nt -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -m=
soft-float -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno=
-stack-check -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mi=
ps/include/asm/mach-ar7 -Iarch/mips/include/asm/mach-generic -fno-asynchron=
ous-unwind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-a=
ddress-of-packed-member -O2 -Wframe-larger-than=3D1024 -fstack-protector -W=
implicit-fallthrough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variabl=
e -Wno-unused-const-variable -fno-stack-clash-protection -pg -Wdeclaration-=
after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-array-bou=
nds -fno-strict-overflow -fno-stack-check -Werror=3Ddate-time -Werror=3Dinc=
ompatible-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmissing-de=
clarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-style-defi=
nition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-const-vari=
able -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-limits -I =
drivers/dma-buf -I ./drivers/dma-buf -DKBUILD_MODFILE=3D"drivers/dma-buf/dm=
abuf_selftests" -DKBUILD_BASENAME=3D"st_dma_fence_unwrap" -DKBUILD_MODNAME=
=3D"dmabuf_selftests" -D__KBUILD_MODNAME=3Dkmod_dmabuf_selftests -c -o driv=
ers/dma-buf/st-dma-fence-unwrap.o drivers/dma-buf/st-dma-fence-unwrap.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/dma-buf/st-dm=
a-fence-unwrap.c'.
   4. Running pass 'Mips Assembly Printer' on function '@sanitycheck'
   #0 0x000056545ac5406f Signals.cpp:0:0
   #1 0x000056545ac51e94 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-881350a92d/bin/clang-15+0x34bee94)
   #2 0x000056545ab91797 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-881350a92d/bin/clang-15+0x33fe797)
   #3 0x000056545ac4a4ce llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-881350a92d/bin/clang-15+0x34b74ce)
   #4 0x00005654588391eb (/opt/cross/clang-881350a92d/bin/clang-15+0x10a61e=
b)
   #5 0x000056545ab982bc llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-881350a92d/bin/clang-15+0x34052bc)
   #6 0x000056545b8b82b0 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-881350a92d/bin/clang-15+0x41252b0)
   #7 0x000056545b8b41e2 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-881350a92d/bin/clang-15+0x41211e2)
   #8 0x00005654592b9d47 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-881350a92d/bin/clang-15+0x1b26d47)
   #9 0x0000565459f8cbdd llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000056545a3d4c27 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-881350a92d/bin/clang-15+0x2c41c27)
   #11 0x000056545a3d4da1 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-881350a92d/bin/clang-15+0x2c41da1)
   #12 0x000056545a3d591f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-881350a92d/bin/clang-15+0x2c4291f)
   #13 0x000056545af751a7 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-881350a92d/bin/clang-15+0x37e2=
1a7)
   #14 0x000056545bbd8b03 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-881350a92d/bin/clang-15+0x4445b03)
   #15 0x000056545c709f31 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-881350a92d/bin/clang-15+0x4f76f31)
   #16 0x000056545bbd81e5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-881350a92d/bin/clang-15+0x44451e5)
   #17 0x000056545b5cfb31 clang::FrontendAction::Execute() (/opt/cross/clan=
g-881350a92d/bin/clang-15+0x3e3cb31)
   #18 0x000056545b5652da clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-881350a92d/bin/clang-15+0x3dd22da)
   #19 0x000056545b69686b (/opt/cross/clang-881350a92d/bin/clang-15+0x3f038=
6b)
   #20 0x000056545883a79c cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-881350a92d/bin/clang-15+0x10a779c)
   #21 0x000056545883745b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000056545b3fbd65 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000056545ab91653 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-881350a92d/bin/clang-15+0x33fe653)
   #24 0x000056545b3fc65e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000056545b3d0ed7 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-881=
350a92d/bin/clang-15+0x3c3ded7)
   #26 0x000056545b3d18b7 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-881350a92d/bin/clang-15+0x3c3e8b7)
   #27 0x000056545b3daf09 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-881350a92d/bin/clang-15+0x3c47f09)
   #28 0x00005654587849cf main (/opt/cross/clang-881350a92d/bin/clang-15+0x=
ff19cf)
   #29 0x00007f216760d7fd __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x237fd)
   #30 0x0000565458836f7a _start (/opt/cross/clang-881350a92d/bin/clang-15+=
0x10a3f7a)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 881350a92d821d4f8e4fa=
648443ed1d17e251188)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-881350a92d/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers include kernel mm nr_bisected scripts source usr


vim +/to_mock_fence +25 drivers/dma-buf/st-dma-fence-unwrap.c

    21=09
    22	static inline struct mock_fence {
    23		struct dma_fence base;
    24		spinlock_t lock;
  > 25	} *to_mock_fence(struct dma_fence *f) {
    26		return container_of(f, struct mock_fence, base);
    27	}
    28=09

--=20
0-DAY CI Kernel Test Service
https://01.org/lkp
