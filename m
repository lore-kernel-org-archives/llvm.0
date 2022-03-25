Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092737E
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 22:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648248972; x=1679784972;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t1raVwY3259/l+2akR+/Ki7+N7VF8iQmelxtOUfz+yw=;
  b=Q7oEXk/87slqgEN60DpFrCCTs38ARTbyx6GhHn82EprETbpGPem0QdqR
   PsYKQKNz0GleDmZf3xZmHa3SRgw+4ezEF49hDthZ08oPOX6g7jUiwV+Uc
   qY5i4WjowjFQCGNWbfIuqC/p1GWUdWBDUm2nypng36ephEEclrjpuvlKZ
   mf/kFXHq5brq6UsNyp94HfJCGU1AEBnzJ959zSAyaIkXJCWfuNR0S1NAu
   xiUw7nDBKNtYqncDHWbSz5ZIthKG0bd6aGQLcoCvjGMsvFAqhuFsybV36
   A91bml0+/Jp80SnQgdHVq7ieznZKx0j9hGOjSkuI/6eMv3J3Kz1H17McM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="246218666"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="246218666"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 15:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="693823141"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2022 15:56:09 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXsqm-000Mgr-HD; Fri, 25 Mar 2022 22:56:08 +0000
Date: Sat, 26 Mar 2022 06:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Pavel Machek <pavel@ucw.cz>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: [linux-next:master 9122/14381] drivers/leds/leds-pca955x.c:149:19:
 warning: unused function 'pca95xx_num_led_regs'
Message-ID: <202203260634.OFB2IPFf-lkp@intel.com>
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

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   fd4fbb998102ef7812d594121fbabd2b10dced1b
commit: ca386253ff6fb86128a7c61e1c38ca91de38048d [9122/14381] leds: pca955x=
: Make the gpiochip always expose all pins
config: mips-buildonly-randconfig-r002-20220324 (https://download.01.org/0d=
ay-ci/archive/20220326/202203260634.OFB2IPFf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
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
D__KERNEL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80001000 -DLINKER_LOAD_ADDRE=
SS=3D0x80001000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=
=3D -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tri=
graphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dim=
plicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -W=
no-format-security -std=3Dgnu89 --target=3Dmipsel-linux -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mno-=
check-zero-division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-flo=
at -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EL -fno-stack-c=
heck -march=3Dmips32 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/inclu=
de/asm/mach-bcm47xx -Iarch/mips/include/asm/mach-generic -fno-asynchronous-=
unwind-tables -fno-delete-null-pointer-checks -Wno-frame-address -Wno-addre=
ss-of-packed-member -Os -Wframe-larger-than=3D1024 -fno-stack-protector -Wi=
mplicit-fallthrough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable=
 -Wno-unused-const-variable -ftrivial-auto-var-init=3Dpattern -fno-stack-cl=
ash-protection -pg -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -W=
cast-function-type -Wno-array-bounds -fno-strict-overflow -fno-stack-check =
-Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wextra -Wunused -=
Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attribute -Wmi=
ssing-prototypes -Wold-style-definition -Wmissing-include-dirs -Wunused-but=
-set-variable -Wunused-const-variable -Wno-missing-field-initializers -Wno-=
sign-compare -Wno-type-limits -I drivers/leds -I ./drivers/leds -DKBUILD_MO=
DFILE=3D"drivers/leds/leds-pca955x" -DKBUILD_BASENAME=3D"leds_pca955x" -DKB=
UILD_MODNAME=3D"leds_pca955x" -D__KBUILD_MODNAME=3Dkmod_leds_pca955x -c -o =
drivers/leds/leds-pca955x.o drivers/leds/leds-pca955x.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'drivers/leds/leds-pca=
955x.c'.
   4. Running pass 'Mips Assembly Printer' on function '@pca955x_probe'
   #0 0x00005590818433af Signals.cpp:0:0
   #1 0x00005590818411d4 llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-0f6d9501cf/bin/clang-15+0x34aa1d4)
   #2 0x0000559081780b87 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-0f6d9501cf/bin/clang-15+0x33e9b87)
   #3 0x000055908183980e llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-0f6d9501cf/bin/clang-15+0x34a280e)
   #4 0x000055907f43640b (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x109f40=
b)
   #5 0x00005590817876ac llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x33f06ac)
   #6 0x00005590824a3780 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x410c780)
   #7 0x000055908249f6b4 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-0f6d9501cf/bin/clang-15+0x41086b4)
   #8 0x000055907feb17f7 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x1b1a7f7)
   #9 0x0000559080b823dd llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x0000559080fc9f67 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x2c32f67)
   #11 0x0000559080fca0e1 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-0f6d9501cf/bin/clang-15+0x2c330e1)
   #12 0x0000559080fcac5f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x2c33c5f)
   #13 0x0000559081b63777 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x37cc=
777)
   #14 0x00005590827c38d3 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x442c8d3)
   #15 0x00005590832e5aa1 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-0f6d9501cf/bin/clang-15+0x4f4eaa1)
   #16 0x00005590827c2fb5 clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-0f6d9501cf/bin/clang-15+0x442bfb5)
   #17 0x00005590821bcaa1 clang::FrontendAction::Execute() (/opt/cross/clan=
g-0f6d9501cf/bin/clang-15+0x3e25aa1)
   #18 0x000055908215233a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x3dbb33a)
   #19 0x00005590822826cb (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x3eeb6=
cb)
   #20 0x000055907f4379bc cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-0f6d9501cf/bin/clang-15+0x10a09bc)
   #21 0x000055907f43468b ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x0000559081fe8f45 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000559081780a43 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x33e9a43)
   #24 0x0000559081fe983e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x0000559081fbe037 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-0f6=
d9501cf/bin/clang-15+0x3c27037)
   #26 0x0000559081fbea17 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x3c27a17)
   #27 0x0000559081fc8069 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x3c31069)
   #28 0x000055907f38195f main (/opt/cross/clang-0f6d9501cf/bin/clang-15+0x=
fea95f)
   #29 0x00007ff3071bbd0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x000055907f4341aa _start (/opt/cross/clang-0f6d9501cf/bin/clang-15+=
0x109d1aa)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project 0f6d9501cf49ce0293709=
9350d08f20c4af86f3d)
   Target: mipsel-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-0f6d9501cf/bin
   clang-15: note: diagnostic msg:
   Makefile arch drivers include kernel nr_bisected scripts source usr

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SSB_EMBEDDED
   Depends on SSB && SSB_DRIVER_MIPS && SSB_PCICORE_HOSTMODE
   Selected by
   - BCM47XX_SSB && BCM47XX


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

--=20
0-DAY CI Kernel Test Service
https://01.org/lkp
