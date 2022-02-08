Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2640E2F21
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644337253; x=1675873253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yyiBjBtXgNZf0Oc9W6Yq2fFjUWBphFH/z4JDcmQQNeE=;
  b=TSGD+QIovrevoUXqqJ0JaFXD3MZYpPNFaECalQBReNAKZfivE8SwKHnh
   Qr7kwpwDX4gy6ODo1sFpeovvNbBYmLYHfW4hJyd01amgHTMR/UDEBFWbh
   tv5VFQso5HIc/1zuFl0MdBGjPlltdDzA5uuQb9G1w1hlE+5XNPXDODziw
   bTqmS/4+flzOytMkAfSBAKJuvkVMvOV1sD27jHtL9H4TYFXGcynIfjftY
   2CIa5D3Xwa5XdLzNC/S7r/O3Ggf4u+k3DG55d4XC147JTYJ1RKRHqRYso
   egsxJctzc5gCV7BYymz3po2ZEelCfOsEupPRmavoCO7xu5j5ork2v/p33
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="335386510"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="335386510"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 08:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="621950003"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2022 08:20:50 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHTEY-0000Qs-7r; Tue, 08 Feb 2022 16:20:50 +0000
Date: Wed, 9 Feb 2022 00:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next 1/5] bpf: Extend sys_bpf commands for
 bpf_syscall programs.
Message-ID: <202202090005.4wGpcCXF-lkp@intel.com>
References: <20220204231710.25139-2-alexei.starovoitov@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220204231710.25139-2-alexei.starovoitov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alexei,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Alexei-Starovoitov/bpf-Lig=
ht-skeleton-for-the-kernel/20220205-071811
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
config: mips-buildonly-randconfig-r001-20220208 (https://download.01.org/0d=
ay-ci/archive/20220209/202202090005.4wGpcCXF-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/cf2c9222692d0cb93d17ab3ff=
9f972b40a0b7864
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexei-Starovoitov/bpf-Light-skele=
ton-for-the-kernel/20220205-071811
        git checkout cf2c9222692d0cb93d17ab3ff9f972b40a0b7864
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/syscall.c:4762:19: warning: unused variable 'prog'
   struct bpf_prog
   ^
   fatal error: error in backend: Nested variants found in inline asm strin=
g: ' .set push
   .set mips64r2
   .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_branc=
h_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftrace_=
branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/inclu=
de/asm/atomic.h", .line =3D 156, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 ); .s=
et push; .set mips64r2; .rept 1; sync 0x00; .endr; .set pop; .else; ; .endif
   1: ll $1, $2 # atomic_sub_return
   subu $0, $1, $3
   sc $0, $2
   beqz $0, 1b
   subu $0, $1, $3
   .set pop
   '
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0. Program arguments: clang -Wp,-MMD,kernel/bpf/.syscall.o.d -nostdinc -=
Iarch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -I=
arch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi =
-I./include/generated/uapi -include include/linux/compiler-version.h -inclu=
de include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERN=
EL__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80060000 -DLINKER_LOAD_ADDRESS=3D0x=
80060000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D -DKBU=
ILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -f=
no-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fu=
nction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format=
-security -std=3Dgnu89 --target=3Dmips-linux -fintegrated-as -Werror=3Dunkn=
own-warning-option -Werror=3Dignored-optimization-argument -mno-check-zero-=
division -mabi=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -DGAS_HA=
S_SET_HARDFLOAT -Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=
=3Dmips32r2 -Wa,--trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/ma=
ch-ath79 -Iarch/mips/include/asm/mach-generic -fno-asynchronous-unwind-tabl=
es -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packe=
d-member -O2 -Wframe-larger-than=3D1024 -fno-stack-protector -Wimplicit-fal=
lthrough -Wno-gnu -mno-global-merge -Wno-unused-but-set-variable -Wno-unuse=
d-const-variable -ftrivial-auto-var-init=3Dzero -enable-trivial-auto-var-in=
it-zero-knowing-it-will-be-removed-from-clang -fno-stack-clash-protection -=
pg -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-ty=
pe -Wno-array-bounds -fno-strict-overflow -fno-stack-check -Werror=3Ddate-t=
ime -Werror=3Dincompatible-pointer-types -Wextra -Wunused -Wno-unused-param=
eter -Wmissing-declarations -Wmissing-format-attribute -Wmissing-prototypes=
 -Wold-style-definition -Wmissing-include-dirs -Wunused-but-set-variable -W=
unused-const-variable -Wno-missing-field-initializers -Wno-sign-compare -Wn=
o-type-limits -I kernel/bpf -I ./kernel/bpf -ffunction-sections -fdata-sect=
ions -DKBUILD_MODFILE=3D"kernel/bpf/syscall" -DKBUILD_BASENAME=3D"syscall" =
-DKBUILD_MODNAME=3D"syscall" -D__KBUILD_MODNAME=3Dkmod_syscall -c -o kernel=
/bpf/syscall.o kernel/bpf/syscall.c
   1. <eof> parser at end of file
   2. Code generation
   3. Running pass 'Function Pass Manager' on module 'kernel/bpf/syscall.c'.
   4. Running pass 'Mips Assembly Printer' on function '@bpf_map_free_defer=
red'
   #0 0x0000564a3997132f Signals.cpp:0:0
   #1 0x0000564a3996f20c llvm::sys::CleanupOnSignal(unsigned long) (/opt/cr=
oss/clang-e8bff9ae54/bin/clang-15+0x346420c)
   #2 0x0000564a398af687 llvm::CrashRecoveryContext::HandleExit(int) (/opt/=
cross/clang-e8bff9ae54/bin/clang-15+0x33a4687)
   #3 0x0000564a399678be llvm::sys::Process::Exit(int, bool) (/opt/cross/cl=
ang-e8bff9ae54/bin/clang-15+0x345c8be)
   #4 0x0000564a375aee3b (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x10a3e3=
b)
   #5 0x0000564a398b613c llvm::report_fatal_error(llvm::Twine const&, bool)=
 (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x33ab13c)
   #6 0x0000564a3a5a55a0 llvm::AsmPrinter::emitInlineAsm(llvm::MachineInstr=
 const (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x409a5a0)
   #7 0x0000564a3a5a14d4 llvm::AsmPrinter::emitFunctionBody() (/opt/cross/c=
lang-e8bff9ae54/bin/clang-15+0x40964d4)
   #8 0x0000564a38016b57 llvm::MipsAsmPrinter::runOnMachineFunction(llvm::M=
achineFunction&) (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x1b0bb57)
   #9 0x0000564a38cc85dd llvm::MachineFunctionPass::runOnFunction(llvm::Fun=
ction&) (.part.53) MachineFunctionPass.cpp:0:0
   #10 0x0000564a39103d97 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x2bf8d97)
   #11 0x0000564a39103f11 llvm::FPPassManager::runOnModule(llvm::Module&) (=
/opt/cross/clang-e8bff9ae54/bin/clang-15+0x2bf8f11)
   #12 0x0000564a39104a8f llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x2bf9a8f)
   #13 0x0000564a39c88ef7 clang::EmitBackendOutput(clang::DiagnosticsEngine=
&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::=
TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang::Ba=
ckendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<l=
lvm::raw_pwrite_stream> >) (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x377d=
ef7)
   #14 0x0000564a3a8bdb63 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x43b2b63)
   #15 0x0000564a3b392e29 clang::ParseAST(clang::Sema&, bool, bool) (/opt/c=
ross/clang-e8bff9ae54/bin/clang-15+0x4e87e29)
   #16 0x0000564a3a8bc99f clang::CodeGenAction::ExecuteAction() (/opt/cross=
/clang-e8bff9ae54/bin/clang-15+0x43b199f)
   #17 0x0000564a3a2bb1e1 clang::FrontendAction::Execute() (/opt/cross/clan=
g-e8bff9ae54/bin/clang-15+0x3db01e1)
   #18 0x0000564a3a25211a clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x3d4711a)
   #19 0x0000564a3a37f85b (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x3e748=
5b)
   #20 0x0000564a375b03ec cc1_main(llvm::ArrayRef<char char (/opt/cross/cla=
ng-e8bff9ae54/bin/clang-15+0x10a53ec)
   #21 0x0000564a375ad0bb ExecuteCC1Tool(llvm::SmallVectorImpl<char driver.=
cpp:0:0
   #22 0x0000564a3a0e9c85 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringR=
ef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::alloca=
tor<char> const::'lambda'()>(long) Job.cpp:0:0
   #23 0x0000564a398af543 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x33a4543)
   #24 0x0000564a3a0ea57e clang::driver::CC1Command::Execute(llvm::ArrayRef=
<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::c=
har_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
   #25 0x0000564a3a0bf177 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const (/opt/cross/clang-e8b=
ff9ae54/bin/clang-15+0x3bb4177)
   #26 0x0000564a3a0bfb57 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) const (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x3bb4b57)
   #27 0x0000564a3a0c91e9 clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand >&) (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x3bbe1e9)
   #28 0x0000564a374d626f main (/opt/cross/clang-e8bff9ae54/bin/clang-15+0x=
fcb26f)
   #29 0x00007fa3ac551d0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x26d0a)
   #30 0x0000564a375acbda _start (/opt/cross/clang-e8bff9ae54/bin/clang-15+=
0x10a1bda)
   clang-15: error: clang frontend command failed with exit code 70 (use -v=
 to see invocation)
   clang version 15.0.0 (git://gitmirror/llvm_project e8bff9ae54a55b4dbfeb6=
ba55f723abbd81bf494)
   Target: mips-unknown-linux
   Thread model: posix
   InstalledDir: /opt/cross/clang-e8bff9ae54/bin
   clang-15: note: diagnostic msg:
   Makefile arch include kernel nr_bisected scripts source usr


vim +/prog +4762 kernel/bpf/syscall.c

  4759=09
  4760	BPF_CALL_3(bpf_sys_bpf, int, cmd, union bpf_attr *, attr, u32, attr_=
size)
  4761	{
> 4762		struct bpf_prog *prog;
  4763=09
  4764		switch (cmd) {
  4765		case BPF_MAP_CREATE:
  4766		case BPF_MAP_UPDATE_ELEM:
  4767		case BPF_MAP_FREEZE:
  4768		case BPF_PROG_LOAD:
  4769		case BPF_BTF_LOAD:
  4770		case BPF_LINK_CREATE:
  4771		case BPF_RAW_TRACEPOINT_OPEN:
  4772			break;
  4773	#ifdef CONFIG_BPF_JIT /* __bpf_prog_enter_sleepable used by trampoli=
ne and JIT */
  4774		case BPF_PROG_TEST_RUN:
  4775			if (attr->test.data_in || attr->test.data_out ||
  4776			    attr->test.ctx_out || attr->test.duration ||
  4777			    attr->test.repeat || attr->test.flags)
  4778				return -EINVAL;
  4779=09
  4780			prog =3D bpf_prog_get_type(attr->test.prog_fd, BPF_PROG_TYPE_SYSCA=
LL);
  4781			if (IS_ERR(prog))
  4782				return PTR_ERR(prog);
  4783=09
  4784			if (attr->test.ctx_size_in < prog->aux->max_ctx_offset ||
  4785			    attr->test.ctx_size_in > U16_MAX) {
  4786				bpf_prog_put(prog);
  4787				return -EINVAL;
  4788			}
  4789=09
  4790			if (!__bpf_prog_enter_sleepable(prog)) {
  4791				/* recursion detected */
  4792				bpf_prog_put(prog);
  4793				return -EBUSY;
  4794			}
  4795			attr->test.retval =3D bpf_prog_run(prog, (void *) (long) attr->tes=
t.ctx_in);
  4796			__bpf_prog_exit_sleepable(prog, 0 /* bpf_prog_run does runtime sta=
ts */);
  4797			bpf_prog_put(prog);
  4798			return 0;
  4799	#endif
  4800		default:
  4801			return -EINVAL;
  4802		}
  4803		return __sys_bpf(cmd, KERNEL_BPFPTR(attr), attr_size);
  4804	}
  4805	EXPORT_SYMBOL(bpf_sys_bpf);
  4806=09

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
