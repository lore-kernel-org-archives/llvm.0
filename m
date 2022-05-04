Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37952583
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 16:18:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 043D91042;
	Wed,  4 May 2022 09:18:01 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.1.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73B043FA27;
	Wed,  4 May 2022 09:17:58 -0700 (PDT)
Date: Wed, 4 May 2022 17:17:51 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 00/21] KCFI support
Message-ID: <YnKnLyyXPJl5Llc0@FVFF77S0Q05N>
References: <20220429203644.2868448-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>

Hi Sami,

On Fri, Apr 29, 2022 at 01:36:23PM -0700, Sami Tolvanen wrote:
> KCFI is a proposed forward-edge control-flow integrity scheme for
> Clang, which is more suitable for kernel use than the existing CFI
> scheme used by CONFIG_CFI_CLANG. KCFI doesn't require LTO, doesn't
> alter function references to point to a jump table, and won't break
> function address equality. The latest LLVM patches are here:
>=20
>   https://reviews.llvm.org/D119296
>   https://reviews.llvm.org/D124211

This is really exciting to see!

I wanted to give this a spin on arm64, but I'm seeing some very odd toolcha=
in
behaviour. I'm not sure if I've done something wrong, or if I'm just hittin=
g an
edge-case, but it looks like using -fsanitize=3Dkcfi causes the toolchain t=
o hit
out-of-memory errors and other issues which look like they could be memory
corruption.

Setup-wise:

* My build machine is a "Intel(R) Xeon(R) CPU E5-2660 v4" with 56 HW threads
  and 64GB of RAM, running x86_64 Debian 11.3.

* I applied D119296 atop LLVM commit 11d3e31c60bd (per the "Parents" part of
  the Revision Contents on https://reviews.llvm.org/D119296), and built that
  with:

  cmake -S llvm -B build -G Ninja -DCMAKE_BUILD_TYPE=3DRelease -DLLVM_ENABL=
E_PROJECTS=3D'clang;lld
  cmake --build build

  Aside: I'll go build a Debug release to compare this to.

* I applied this series atop v5.18-rc4.

* I normally build with -j50, and LLVM=3D1.

Aside from a single ifdef issue in compiler-clang.h, defconfig builds clean=
ly,
but defconfig + CONFIG_CFI_CLANG produces lots of out of memory errors and =
some
other errors which look erroneous. I see a bunch of errors even when I
significantly reduce my build parallelism (e.g. down to -j10, a reduction of
5x).

Some of these don't look right at all, e.g.

| make: *** [Makefile:1823: fs] Error 2
| ^[^[<inline asm>:5:1: error: unexpected token at start of statement
| 93825275602704
| ^
| 1 error generated.
| make[2]: *** [scripts/Makefile.build:289: arch/arm64/kernel/suspend.o] Er=
ror 1
| make[2]: *** Waiting for unfinished jobs....
| make[1]: *** [scripts/Makefile.build:551: arch/arm64/kernel] Error 2
                                             =20
| <inline asm>:5:1: error: unexpected token at start of statement
| @<U+001D><U+001A>8DV
| ^
| 1 error generated.
| make[3]: *** [scripts/Makefile.build:289: drivers/phy/amlogic/phy-meson8b=
-usb2.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| make[2]: *** [scripts/Makefile.build:551: drivers/phy/amlogic] Error 2
| make[2]: *** Waiting for unfinished jobs....
| make[1]: *** [scripts/Makefile.build:551: kernel/sched] Error 2
| make: *** [Makefile:1823: kernel] Error 2
| make: *** Waiting for unfinished jobs....

=2E.. maybe those are due to memory corruption / bad out-of-memory handling?


Some are out-of-memory errors:

| LLVM ERROR: out of memory
| Allocation failed
| PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues=
/ and include the crash backtrace, preprocessed source, and associated run =
script.
| Stack dump:
| 0.      Program arguments: clang -Wp,-MMD,kernel/dma/.pool.o.d -nostdinc =
-I./arch/arm64/include -I./arch/arm64/include/generated -I./include -I./arc=
h/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I./include/uapi=
 -I./include/generated/uapi -include ./include/linux/compiler-version.h -in=
clude ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -=
D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3D -Qunused-argument=
s -fmacro-prefix-map=3D./=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno=
-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=
=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-ty=
pe -Wno-format-security -std=3Dgnu11 --target=3Daarch64-linux-gnu -fintegra=
ted-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argu=
ment -mgeneral-regs-only -DCONFIG_CC_HAS_K_CONSTRAINT=3D1 -Wno-psabi -fno-a=
synchronous-unwind-tables -fno-unwind-tables -mbranch-protection=3Dpac-ret+=
leaf+bti -Wa,-march=3Darmv8.5-a -DARM64_ASM_ARCH=3D\"armv8.5-a\" -DKASAN_SH=
ADOW_SCALE_SHIFT=3D -fno-delete-null-pointer-checks -Wno-frame-address -Wno=
-address-of-packed-member -O2 -Wframe-larger-than=3D2048 -fstack-protector-=
strong -Wimplicit-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-un=
used-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -ft=
rivial-auto-var-init=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-w=
ill-be-removed-from-clang -fno-stack-clash-protection -fsanitize=3Dkcfi -fn=
o-sanitize-blacklist -Wdeclaration-after-statement -Wvla -Wno-pointer-sign =
-Wcast-function-type -fno-strict-overflow -fno-stack-check -Werror=3Ddate-t=
ime -Werror=3Dincompatible-pointer-types -Wno-initializer-overrides -Wno-fo=
rmat -Wno-sign-compare -Wno-format-zero-length -Wno-pointer-to-enum-cast -W=
no-tautological-constant-out-of-range-compare -Wno-unaligned-access -mstack=
-protector-guard=3Dsysreg -mstack-protector-guard-reg=3Dsp_el0 -mstack-prot=
ector-guard-offset=3D1184 -DKBUILD_MODFILE=3D\"kernel/dma/pool\" -DKBUILD_B=
ASENAME=3D\"pool\" -DKBUILD_MODNAME=3D\"pool\" -D__KBUILD_MODNAME=3Dkmod_po=
ol -c -o kernel/dma/pool.o kernel/dma/pool.c
| 1.      <eof> parser at end of file
| 2.      Per-file LLVM IR generation
|  #0 0x00005559ef670830 PrintStackTraceSignalHandler(void*) Signals.cpp:0:0
|  #1 0x00005559ef66e6e4 llvm::sys::CleanupOnSignal(unsigned long) (/home/m=
ark/src/llvm-project/build/bin/clang-15+0x36136e4)
|  #2 0x00005559ef5ab3f8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
|  #3 0x00007f5ac3547140 __restore_rt (/lib/x86_64-linux-gnu/libpthread.so.=
0+0x14140)
|  #4 0x00007f5ac302ace1 raise (/lib/x86_64-linux-gnu/libc.so.6+0x3bce1)
|  #5 0x00007f5ac3014537 abort (/lib/x86_64-linux-gnu/libc.so.6+0x25537)
|  #6 0x00005559ef5b2389 (/home/mark/src/llvm-project/build/bin/clang-15+0x=
3557389)
|  #7 0x00005559ef5e00f7 (/home/mark/src/llvm-project/build/bin/clang-15+0x=
35850f7)
|  #8 0x00005559ef641191 llvm::raw_svector_ostream::write_impl(char const*,=
 unsigned long) (/home/mark/src/llvm-project/build/bin/clang-15+0x35e6191)
|  #9 0x00005559ef64325e llvm::raw_ostream::write(char const*, unsigned lon=
g) (/home/mark/src/llvm-project/build/bin/clang-15+0x35e825e)
| #10 0x00005559ef611dae llvm::Twine::str[abi:cxx11]() const (/home/mark/sr=
c/llvm-project/build/bin/clang-15+0x35b6dae)
| #11 0x00005559efac97be clang::CodeGen::CodeGenModule::FinalizeKCFITypePre=
fixes() (/home/mark/src/llvm-project/build/bin/clang-15+0x3a6e7be)
| #12 0x00005559efafd53c clang::CodeGen::CodeGenModule::Release() (/home/ma=
rk/src/llvm-project/build/bin/clang-15+0x3aa253c)
| #13 0x00005559f07564aa (anonymous namespace)::CodeGeneratorImpl::HandleTr=
anslationUnit(clang::ASTContext&) ModuleBuilder.cpp:0:0
| #14 0x00005559f07543e5 clang::BackendConsumer::HandleTranslationUnit(clan=
g::ASTContext&) (/home/mark/src/llvm-project/build/bin/clang-15+0x46f93e5)
| #15 0x00005559f11b85a9 clang::ParseAST(clang::Sema&, bool, bool) (/home/m=
ark/src/llvm-project/build/bin/clang-15+0x515d5a9)
| #16 0x00005559f00cf419 clang::FrontendAction::Execute() (/home/mark/src/l=
lvm-project/build/bin/clang-15+0x4074419)
| #17 0x00005559f005a85b clang::CompilerInstance::ExecuteAction(clang::Fron=
tendAction&) (/home/mark/src/llvm-project/build/bin/clang-15+0x3fff85b)
| #18 0x00005559f0183860 clang::ExecuteCompilerInvocation(clang::CompilerIn=
stance*) (/home/mark/src/llvm-project/build/bin/clang-15+0x4128860)
| #19 0x00005559ed0f051c cc1_main(llvm::ArrayRef<char const*>, char const*,=
 void*) (/home/mark/src/llvm-project/build/bin/clang-15+0x109551c)
| #20 0x00005559ed0ed3f9 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>&=
) driver.cpp:0:0
| #21 0x00005559efed5fa5 void llvm::function_ref<void ()>::callback_fn<clan=
g::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringRe=
f> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocat=
or<char> >*, bool*) const::'lambda'()>(long) Job.cpp:0:0
| #22 0x00005559ef5ab4f3 llvm::CrashRecoveryContext::RunSafely(llvm::functi=
on_ref<void ()>) (/home/mark/src/llvm-project/build/bin/clang-15+0x35504f3)
| #23 0x00005559efed6304 clang::driver::CC1Command::Execute(llvm::ArrayRef<=
llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::ch=
ar_traits<char>, std::allocator<char> >*, bool*) const (.part.0) Job.cpp:0:0
| #24 0x00005559efea7b36 clang::driver::Compilation::ExecuteCommand(clang::=
driver::Command const&, clang::driver::Command const*&) const (/home/mark/s=
rc/llvm-project/build/bin/clang-15+0x3e4cb36)
| #25 0x00005559efea84e9 clang::driver::Compilation::ExecuteJobs(clang::dri=
ver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::Co=
mmand const*> >&) const (/home/mark/src/llvm-project/build/bin/clang-15+0x3=
e4d4e9)
| #26 0x00005559efeb6619 clang::driver::Driver::ExecuteCompilation(clang::d=
river::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::Co=
mmand const*> >&) (/home/mark/src/llvm-project/build/bin/clang-15+0x3e5b619)
| #27 0x00005559ed033793 main (/home/mark/src/llvm-project/build/bin/clang-=
15+0xfd8793)
| #28 0x00007f5ac3015d0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6=
+0x26d0a)
| #29 0x00005559ed0ecdaa _start (/home/mark/src/llvm-project/build/bin/clan=
g-15+0x1091daa)
| clang-15: error: clang frontend command failed with exit code 134 (use -v=
 to see invocation)
| clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e3994ce3c=
d7b217678edd589392c3c3c1575880)
| Target: aarch64-unknown-linux-gnu
| Thread model: posix
| InstalledDir: /home/mark/src/llvm-project/build/bin
| clang-15: note: diagnostic msg:
| ********************
|=20
| PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
| Preprocessed source(s) and associated run script(s) are located at:
| clang-15: note: diagnostic msg: /tmp/pool-b4bab3.c
| clang-15: note: diagnostic msg: /tmp/pool-b4bab3.sh
| clang-15: note: diagnostic msg:
|=20
| ********************
| make[2]: *** [scripts/Makefile.build:289: kernel/dma/pool.o] Error 134
| make[1]: *** [scripts/Makefile.build:551: kernel/dma] Error 2
| make[1]: *** Waiting for unfinished jobs....

Note: I've kept those files, but as the c file is 3.9M I have not included =
that here.


There appar to be other failures too:

| [mark@lakrids:~/src/linux]% PATH=3D/home/mark/src/llvm-project/build/bin/=
:$PATH make LLVM=3D1 ARCH=3Darm64 -j10 Image -s
| PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues=
/ and include the crash backtrace, preprocessed source, and associated run =
script.
| Stack dump:
| 0.      Program arguments: clang -Wp,-MMD,mm/.util.o.d -nostdinc -I./arch=
/arm64/include -I./arch/arm64/include/generated -I./include -I./arch/arm64/=
include/uapi -I./arch/arm64/include/generated/uapi -I./i
| nclude/uapi -I./include/generated/uapi -include ./include/linux/compiler-=
version.h -include ./include/linux/kconfig.h -include ./include/linux/compi=
ler_types.h -D__KERNEL__ -mlittle-endian -DKASAN_SHADOW_SCALE_SHIFT=3D -Qun=
used-arguments -fmacro-prefix-map=3D./=3D -Wall -Wundef -Werror=3Dstrict-pr=
ototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno=
-PIE -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=
=3Dreturn-type -Wno-format-security -std=3Dgnu11 --target=3Daarch64-linux-g=
nu -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optim=
ization-argument -mgeneral-regs-only -DCONFIG_CC_HAS_K_CONSTRAINT=3D1 -Wno-=
psabi -fno-asynchronous-unwind-tables -fno-unwind-tables -mbranch-protectio=
n=3Dpac-ret+leaf+bti -Wa,-march=3Darmv8.5-a -DARM64_ASM_ARCH=3D\"armv8.5-a\=
" -DKASAN_SHADOW_SCALE_SHIFT=3D -fno-delete-null-pointer-checks -Wno-frame-=
address -Wno-address-of-packed-member -O2 -Wframe-larger-than=3D2048 -fstac=
k-protector-strong -Wimplicit-fallthrough -Wno-gnu -Wno-unused-but-set-vari=
able -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibli=
ng-calls -ftrivial-auto-var-init=3Dzero -enable-trivial-auto-var-init-zero-=
knowing-it-will-be-removed-from-clang -fno-stack-clash-protection -fsanitiz=
e=3Dkcfi -fno-sanitize-blacklist -Wdeclaration-after-statement -Wvla -Wno-p=
ointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check -Wer=
ror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initializer-overr=
ides -Wno-format -Wno-sign-compare -Wno-format-zero-length -Wno-pointer-to-=
enum-cast -Wno-tautological-constant-out-of-range-compare -Wno-unaligned-ac=
cess -mstack-protector-guard=3Dsysreg -mstack-protector-guard-reg=3Dsp_el0 =
-mstack-protector-guard-offset=3D1184 -DKBUILD_MODFILE=3D\"mm/util\" -DKBUI=
LD_BASENAME=3D\"util\" -DKBUILD_MODNAME=3D\"util\" -D__KBUILD_MODNAME=3Dkmo=
d_util -c -o mm/util.o mm/util.c
| 1.      <eof> parser at end of file
| 2.      Per-file LLVM IR generation
|  #0 0x0000559484667830 PrintStackTraceSignalHandler(void*) Signals.cpp:0:0
|  #1 0x00005594846656e4 llvm::sys::CleanupOnSignal(unsigned long) (/home/m=
ark/src/llvm-project/build/bin/clang-15+0x36136e4)
|  #2 0x00005594845a23f8 CrashRecoverySignalHandler(int) CrashRecoveryConte=
xt.cpp:0:0
|  #3 0x00007f490bbd1140 __restore_rt (/lib/x86_64-linux-gnu/libpthread.so.=
0+0x14140)
|  #4 0x0000559484608ca8 llvm::Twine::printOneChild(llvm::raw_ostream&, llv=
m::Twine::Child, llvm::Twine::NodeKind) const (/home/mark/src/llvm-project/=
build/bin/clang-15+0x35b6ca8)
|  #5 0x0000559484608dae llvm::Twine::str[abi:cxx11]() const (/home/mark/sr=
c/llvm-project/build/bin/clang-15+0x35b6dae)
|  #6 0x0000559484ac07be clang::CodeGen::CodeGenModule::FinalizeKCFITypePre=
fixes() (/home/mark/src/llvm-project/build/bin/clang-15+0x3a6e7be)
|  #7 0x0000559484af453c clang::CodeGen::CodeGenModule::Release() (/home/ma=
rk/src/llvm-project/build/bin/clang-15+0x3aa253c)
|  #8 0x000055948574d4aa (anonymous namespace)::CodeGeneratorImpl::HandleTr=
anslationUnit(clang::ASTContext&) ModuleBuilder.cpp:0:0
|  #9 0x000055948574b3e5 clang::BackendConsumer::HandleTranslationUnit(clan=
g::ASTContext&) (/home/mark/src/llvm-project/build/bin/clang-15+0x46f93e5)
| #10 0x00005594861af5a9 clang::ParseAST(clang::Sema&, bool, bool) (/home/m=
ark/src/llvm-project/build/bin/clang-15+0x515d5a9)
| #11 0x00005594850c6419 clang::FrontendAction::Execute() (/home/mark/src/l=
lvm-project/build/bin/clang-15+0x4074419)
| #12 0x000055948505185b clang::CompilerInstance::ExecuteAction(clang::Fron=
tendAction&) (/home/mark/src/llvm-project/build/bin/clang-15+0x3fff85b)
| #13 0x000055948517a860 clang::ExecuteCompilerInvocation(clang::CompilerIn=
stance*) (/home/mark/src/llvm-project/build/bin/clang-15+0x4128860)
| #14 0x00005594820e751c cc1_main(llvm::ArrayRef<char const*>, char const*,=
 void*) (/home/mark/src/llvm-project/build/bin/clang-15+0x109551c)
| #15 0x00005594820e43f9 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>&=
) driver.cpp:0:0
| #16 0x0000559484eccfa5 void llvm::function_ref<void ()>::callback_fn<clan=
g::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringRe=
f> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocat=
or<char> >*, bool*) const::'lambda'()>(long) Job.cpp:0:0
| #17 0x00005594845a24f3 llvm::CrashRecoveryContext::RunSafely(llvm::functi=
on_ref<void ()>) (/home/mark/src/llvm-project/build/bin/clang-15+0x35504f3)
| #18 0x0000559484ecd304 clang::driver::CC1Command::Execute(llvm::ArrayRef<=
llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::ch=
ar_traits<char>, std::allocator<char> >*, bool*) const (.part.0) Job.cpp:0:0
| #19 0x0000559484e9eb36 clang::driver::Compilation::ExecuteCommand(clang::=
driver::Command const&, clang::driver::Command const*&) const (/home/mark/s=
rc/llvm-project/build/bin/clang-15+0x3e4cb36)
| #20 0x0000559484e9f4e9 clang::driver::Compilation::ExecuteJobs(clang::dri=
ver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::Co=
mmand const*> >&) const (/home/mark/src/llvm-project/build/bin/clang-15+0x3=
e4d4e9)
| #21 0x0000559484ead619 clang::driver::Driver::ExecuteCompilation(clang::d=
river::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::Co=
mmand const*> >&) (/home/mark/src/llvm-project/build/bin/clang-15+0x3e5b619)
| #22 0x000055948202a793 main (/home/mark/src/llvm-project/build/bin/clang-=
15+0xfd8793)
| #23 0x00007f490b69fd0a __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6=
+0x26d0a)
| #24 0x00005594820e3daa _start (/home/mark/src/llvm-project/build/bin/clan=
g-15+0x1091daa)
| clang-15: error: clang frontend command failed with exit code 135 (use -v=
 to see invocation)
| clang version 15.0.0 (https://github.com/llvm/llvm-project.git 1e3994ce3c=
d7b217678edd589392c3c3c1575880)
| Target: aarch64-unknown-linux-gnu
| Thread model: posix
| InstalledDir: /home/mark/src/llvm-project/build/bin
| clang-15: note: diagnostic msg:
| ********************
|=20
| PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
| Preprocessed source(s) and associated run script(s) are located at:
| clang-15: note: diagnostic msg: /tmp/util-30a0f2.c
| clang-15: note: diagnostic msg: /tmp/util-30a0f2.sh
| clang-15: note: diagnostic msg:
|=20
| ********************

Note: I've saved those files for now, but the c file is 4.8M, so I haven't =
included it
inline or attached it here.=20

Thanks,
Mark.
