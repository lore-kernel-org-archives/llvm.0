Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C18D2CA7
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 22:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643063052; x=1674599052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=95KNnWzP7hx3G29bQkAe5xGATALqj/DMfGH1PnrFjfA=;
  b=CzBTpu/9rQfnNuwSG66wD8mvAsU6GfDqeu0fm0xotL71/O2zX5sFXutS
   Li21vZtX3b5dc6XnyZydysKbxRrtjsRk5mD5min2RH3oQ2oENFKIs+p48
   vUEvK1ZKWC9jDiTstud5He/qudx0Ay8RkLdtrLHIkz53um0+oKGNgG4CY
   zJDvKalvOIlEBl/Du9Ka65ec0/XlBI36goGTfBDsdA29yj1Gkot/Uue25
   VnzZW4beG2jt7LgcNYvKAF8FzN4kkzALBc87g3jR70HyOcZjgkqm+8/Bb
   shlE5fiNvUW0NgVafEZJnSNUoC5ICxTy2RaUGY6o0DyxCyESATylYlSn8
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="245942849"
X-IronPort-AV: E=Sophos;i="5.88,313,1635231600"; 
   d="scan'208";a="245942849"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 14:24:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,313,1635231600"; 
   d="scan'208";a="580539729"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2022 14:24:10 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nC7kv-000IzH-Lu; Mon, 24 Jan 2022 22:24:09 +0000
Date: Tue, 25 Jan 2022 06:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 3/3] v4l: ioctl: Set bus_info in v4l_querycap()
Message-ID: <202201250515.dkk038WS-lkp@intel.com>
References: <20220122163656.168440-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220122163656.168440-4-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sakari,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.17-rc1 next-20220124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Sakari-Ailus/Set-bus_info-=
field-in-framework/20220123-004134
base:   git://linuxtv.org/media_tree.git master
config: mips-randconfig-r036-20220124 (https://download.01.org/0day-ci/arch=
ive/20220125/202201250515.dkk038WS-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2e58a1=
8910867ba6795066e044293e6daf89edf5)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/512d690d3258afe250b666da9=
ee728ae54877083
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sakari-Ailus/Set-bus_info-field-in=
-framework/20220123-004134
        git checkout 512d690d3258afe250b666da9ee728ae54877083
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash drivers/media/platform/allegr=
o-dvt/ drivers/media/platform/exynos-gsc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/allegro-dvt/allegro-core.c:3253:22: warning: unus=
ed variable 'dev'
   struct allegro_dev =3D video_get_drvdata(vdev);
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set noat
   .set push
   .set arch=3Dr4000
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/cmpxchg.h", .line =3D 163, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .=
set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .end=
if
   1: ll $0, $2 # __cmpxchg_asm
   bne $0, ${3:z}, 2f
   .set pop
   move $$1, ${4:z}
   .set arch=3Dr4000
   sc $$1, $1
   beqz $$1, 1b
   .set pop
   2: .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_br=
anch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftra=
ce_branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/in=
clude/asm/cmpxchg.h", .line =3D 163, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 )=
; .set push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .=
endif
   '
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,drivers/media/platform/allegro-dvt/=
=2Eallegro-core.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/gen=
erated -Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include=
/generated/uapi -Iinclude/uapi -I./include/generated/uapi -include include/=
linux/compiler-version.h -include include/linux/kconfig.h -include include/=
linux/compiler_types.h -D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff8010=
0000 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOFFSET=3D0 -Qunused-arguments=
 -fmacro-prefix-map=3D=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstri=
ct-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar=
 -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -W=
error=3Dreturn-type -Wno-format-security -std=3Dgnu89 --target=3Dmipsel-lin=
ux -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optim=
ization-argument -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fn=
o-pic -pipe -msoft-float -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreesta=
nding -EL -fno-stack-check -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_=
VIRT -Iarch/mips/include/asm/mach-generic -Iarch/mips/include/asm/mach-gene=
ric -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -Wno-fr=
ame-address -Wno-address-of-packed-member -O2 -Wframe-larger-than=3D1024 -f=
no-stack-protector -Wimplicit-fallthrough -Wno-gnu -mno-global-merge -Wno-u=
nused-but-set-variable -Wno-unused-const-variable -ftrivial-auto-var-init=
=3Dpattern -fno-stack-clash-protection -pg -Wdeclaration-after-statement -W=
vla -Wno-pointer-sign -Wno-array-bounds -fno-strict-overflow -fno-stack-che=
ck -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wextra -Wunuse=
d -Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attribute -=
Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-=
but-set-variable -Wunused-const-variable -Wno-missing-field-initializers -W=
no-sign-compare -Wno-type-limits -I drivers/media/platform/allegro-dvt -I .=
/drivers/media/platform/allegro-dvt -DKBUILD_MODFILE=3D"drivers/media/platf=
orm/allegro-dvt/allegro" -DKBUILD_BASENAME=3D"allegro_core" -DKBUILD_MODNAM=
E=3D"allegro" -D__KBUILD_MODNAME=3Dkmod_allegro -c -o drivers/media/platfor=
m/allegro-dvt/allegro-core.o drivers/media/platform/allegro-dvt/allegro-cor=
e.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/media/platfor=
m/allegro-dvt/allegro-core.c'.
   4. Running pass 'Mips Assembly Printer' on function '@pm_runtime_resume_=
and_get'
   #0 0x000055cb759f39ef Signals.cpp:0:0
   #1 0x000055cb759f18cc llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-2e58a18910/bin/clang-14+0x34288cc)
   #2 0x000055cb759317d7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-2e58a18910/bin/clang-14+0x33687d7)
   #3 0x000055cb759e9f7e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-2e58a18910/bin/clang-14+0x3420f7e)
   #4 0x000055cb73653dcb (/opt/cross/clang-2e58a18910/bin/clang-14+0x108adc=
b)
   #5 0x000055cb7593828c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-2e58a18910/bin/clang-14+0x336f28c)
   #6 0x000055cb7661bd77 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-2e58a18910/bin/clang-14+0x4052d77)
   #7 0x000055cb76617cd4 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-2e58a18910/bin/clang-14+0x404ecd4)
   #8 0x000055cb740b6d07 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x1aedd07)
   #9 0x000055cb74d5bbfd llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x000055cb751947b7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x2bcb7b7)
   #11 0x000055cb75194931 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-2e58a18910/bin/clang-14+0x2bcb931)
   #12 0x000055cb75195c0f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-2e58a18910/bin/clang-14+0x2bccc0f)
   #13 0x000055cb75d03607 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-2e58a18910/bin/clang-14+0x373a=
607)
   #14 0x000055cb76933c03 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x436ac03)
   #15 0x000055cb7743e539 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-2e58a18910/bin/clang-14+0x4e75539)
   #16 0x000055cb76932a4f clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-2e58a18910/bin/clang-14+0x4369a4f)
   #17 0x000055cb76332591 clang::FrontendAction::Execute() (/opt/cross/clan=
g-2e58a18910/bin/clang-14+0x3d69591)
   #18 0x000055cb762c9c1a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x3d00c1a)
   #19 0x000055cb763f66fb (/opt/cross/clang-2e58a18910/bin/clang-14+0x3e2d6=
fb)
   #20 0x000055cb73654b14 cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-2e58a18910/bin/clang-14+0x108bb14)
   #21 0x000055cb7365205b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x000055cb76165195 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x000055cb75931693 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-2e58a18910/bin/clang-14+0x3368693)
   #24 0x000055cb76165a8e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x000055cb7613c167 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-2e5=
8a18910/bin/clang-14+0x3b73167)
   #26 0x000055cb7613cb47 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-2e58a18910/bin/clang-14+0x3b73b47)
   #27 0x000055cb761464b9 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x3b7d4b9)
   #28 0x000055cb7357c45f main (/opt/cross/clang-2e58a18910/bin/clang-14+0x=
fb345f)
   #29 0x00007f8bd5928d0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x000055cb73651b7a _start (/opt/cross/clang-2e58a18910/bin/clang-14+=
0x1088b7a)
   clang-14: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 14.0.0 (git://gitmirror/llvm_project 2e58a18910867ba679506=
6e044293e6daf89edf5)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-2e58a18910/bin
   clang-14: note: diagnostic msg:
   Makefile arch drivers include kernel nr_bisected scripts source usr
--
>> drivers/media/platform/exynos-gsc/gsc-m2m.c:289:18: warning: unused vari=
able 'gsc'
   struct gsc_dev =3D ctx->gsc_dev;
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set mips64r2
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/bitops.h", .line =3D 105, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .s=
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
   0. Program arguments: clang -Wp,-MMD,drivers/media/platform/exynos-gsc/.=
gsc-m2m.o.d -nostdinc -Iarch/mips/include -I./arch/mips/include/generated -=
Iinclude -I./include -Iarch/mips/include/uapi -I./arch/mips/include/generat=
ed/uapi -Iinclude/uapi -I./include/generated/uapi -include include/linux/co=
mpiler-version.h -include include/linux/kconfig.h -include include/linux/co=
mpiler_types.h -D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80100000 -DL=
INKER_LOAD_ADDRESS=3D0x80100000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro=
-prefix-map=3D=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-proto=
types -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PI=
E -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3D=
return-type -Wno-format-security -std=3Dgnu89 --target=3Dmipsel-linux -fint=
egrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-=
argument -mno-check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -p=
ipe -msoft-float -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -E=
L -fno-stack-check -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Ia=
rch/mips/include/asm/mach-generic -Iarch/mips/include/asm/mach-generic -fno=
-asynchronous-unwind-tables -fno-delete-null-pointer-checks -Wno-frame-addr=
ess -Wno-address-of-packed-member -O2 -Wframe-larger-than=3D1024 -fno-stack=
-protector -Wimplicit-fallthrough -Wno-gnu -mno-global-merge -Wno-unused-bu=
t-set-variable -Wno-unused-const-variable -ftrivial-auto-var-init=3Dpattern=
 -fno-stack-clash-protection -pg -Wdeclaration-after-statement -Wvla -Wno-p=
ointer-sign -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Wextra -Wunused -Wno-unu=
sed-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmissing-p=
rototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-but-set-va=
riable -Wunused-const-variable -Wno-missing-field-initializers -Wno-sign-co=
mpare -Wno-type-limits -I drivers/media/platform/exynos-gsc -I ./drivers/me=
dia/platform/exynos-gsc -DKBUILD_MODFILE=3D"drivers/media/platform/exynos-g=
sc/exynos-gsc" -DKBUILD_BASENAME=3D"gsc_m2m" -DKBUILD_MODNAME=3D"exynos_gsc=
" -D__KBUILD_MODNAME=3Dkmod_exynos_gsc -c -o drivers/media/platform/exynos-=
gsc/gsc-m2m.o drivers/media/platform/exynos-gsc/gsc-m2m.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/media/platfor=
m/exynos-gsc/gsc-m2m.c'.
   4. Running pass 'Mips Assembly Printer' on function '@gsc_m2m_open'
   #0 0x0000560afb7049ef Signals.cpp:0:0
   #1 0x0000560afb7028cc llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-2e58a18910/bin/clang-14+0x34288cc)
   #2 0x0000560afb6427d7 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-2e58a18910/bin/clang-14+0x33687d7)
   #3 0x0000560afb6faf7e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-2e58a18910/bin/clang-14+0x3420f7e)
   #4 0x0000560af9364dcb (/opt/cross/clang-2e58a18910/bin/clang-14+0x108adc=
b)
   #5 0x0000560afb64928c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-2e58a18910/bin/clang-14+0x336f28c)
   #6 0x0000560afc32cd77 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-2e58a18910/bin/clang-14+0x4052d77)
   #7 0x0000560afc328cd4 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-2e58a18910/bin/clang-14+0x404ecd4)
   #8 0x0000560af9dc7d07 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x1aedd07)
   #9 0x0000560afaa6cbfd llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x0000560afaea57b7 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x2bcb7b7)
   #11 0x0000560afaea5931 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-2e58a18910/bin/clang-14+0x2bcb931)
   #12 0x0000560afaea6c0f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-2e58a18910/bin/clang-14+0x2bccc0f)
   #13 0x0000560afba14607 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-2e58a18910/bin/clang-14+0x373a=
607)
   #14 0x0000560afc644c03 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x436ac03)
   #15 0x0000560afd14f539 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-2e58a18910/bin/clang-14+0x4e75539)
   #16 0x0000560afc643a4f clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-2e58a18910/bin/clang-14+0x4369a4f)
   #17 0x0000560afc043591 clang::FrontendAction::Execute() (/opt/cross/clan=
g-2e58a18910/bin/clang-14+0x3d69591)
   #18 0x0000560afbfdac1a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x3d00c1a)
   #19 0x0000560afc1076fb (/opt/cross/clang-2e58a18910/bin/clang-14+0x3e2d6=
fb)
   #20 0x0000560af9365b14 cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-2e58a18910/bin/clang-14+0x108bb14)
   #21 0x0000560af936305b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x0000560afbe76195 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000560afb642693 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-2e58a18910/bin/clang-14+0x3368693)
   #24 0x0000560afbe76a8e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x0000560afbe4d167 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-2e5=
8a18910/bin/clang-14+0x3b73167)
   #26 0x0000560afbe4db47 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-2e58a18910/bin/clang-14+0x3b73b47)
   #27 0x0000560afbe574b9 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-2e58a18910/bin/clang-14+0x3b7d4b9)
   #28 0x0000560af928d45f main (/opt/cross/clang-2e58a18910/bin/clang-14+0x=
fb345f)
   #29 0x00007f5f10baed0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x0000560af9362b7a _start (/opt/cross/clang-2e58a18910/bin/clang-14+=
0x1088b7a)
   clang-14: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 14.0.0 (git://gitmirror/llvm_project 2e58a18910867ba679506=
6e044293e6daf89edf5)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-2e58a18910/bin
   clang-14: note: diagnostic msg:
   Makefile arch drivers include kernel nr_bisected scripts source usr


vim +/dev +3253 drivers/media/platform/allegro-dvt/allegro-core.c

f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3248 =20
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3249  static int allegro_querycap(struct file *file, void =
*fh,
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3250  			    struct v4l2_capability *cap)
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3251  {
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3252  	struct video_device *vdev =3D video_devdata(file);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28 @3253  	struct allegro_dev *dev =3D video_get_drvdata(vdev);
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3254 =20
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3255  	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->dr=
iver));
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3256  	strscpy(cap->card, "Allegro DVT Video Encoder", siz=
eof(cap->card));
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3257 =20
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3258  	return 0;
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3259  }
f20387dfd06569 drivers/staging/media/allegro-dvt/allegro-core.c Michael Tre=
tter 2019-05-28  3260 =20

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
