Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942A36A
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 03:40:09 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2d6d0cb5da4so41251497b3.10
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 19:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=LJLBf6Sps7Gk443aqNH8Gj/fzOvyL0dYGrp3GLRDxhY=;
        b=MBMIBOC5k2ObktIlzUPERoun6v0NS4RoZa5puakNmZJvs+aJt/9IQBW7XACHP3NHy6
         9Wysv36GVm8tN7kfhS9URrdABI3eHF7Q1W0zxoBFEDh1ncTuGQwUdr9ID3u7oQ7214AA
         /8lCUoENK9IKRg7kQuWYr0BV0N2LMfuLsh6DvqVthkTyNhUgCkdL/f4N3+8d6YJl/L1g
         veKBGyoTDsmn34G04dJaM5DytAWGV23op8w7E6iR+nNKSI/jrUj45Bp9wxwP+jvSAgFm
         y3an9OORIzz5zu2XxlrjIacHEzrS6/LGr9yNhUROhO/AaWchRxXUJYS+a8N5Iu1YTS8K
         8u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=LJLBf6Sps7Gk443aqNH8Gj/fzOvyL0dYGrp3GLRDxhY=;
        b=QkEEfpz8S0TZ2vF0teTIk/C8A+ya8olUlN7qXQzq3aR5twHKChh7EJ5xR+4rjSCtjb
         MKd0W4ASHMD2U6c3z1gqsYHSlwga4tTRKebSffwCPJNaOZmlurI5qAXR2ZL9IFQUBxHk
         HfXdjpAKHc/wM/BvuExxQ/bzXQrKaLIRE4UjsfPprjpCQ2IXywLiCoAn4etsXJsVNGZO
         qjfvAEngZfAt+oV0JHJC7BkIweS2lYfH9NnJEpPr4IVMnw6gv7tqcZ5PVkSbZnbrOBWJ
         t6mQgKt2bWbtvidSJifpIjKWKZV/3ODgYqPNoq9i2v13byGeeiL1nqNhDRmhLyIkvzVE
         9Mxg==
X-Gm-Message-State: AOAM5326PNdo+3S+7+Z0hnag1VVKQTEbCFccuokEUuN39uGz9sIeOOKo
	/IiSzz/PnK8bUFsSJy0kOw0G6S3BRwHpgxE9B25WInk6zGhWFHcy
X-Google-Smtp-Source: ABdhPJyM3PIKex6v33T9DERM96HneAjXUw1okabZ9NtIBk1OF5dAU1Ogr3IonIPpwl80R13KNwRujVaNQVacw+vpak4=
X-Received: by 2002:a81:4ed5:0:b0:2dc:e57:e5f2 with SMTP id
 c204-20020a814ed5000000b002dc0e57e5f2mr5649996ywb.199.1646278807526; Wed, 02
 Mar 2022 19:40:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 3 Mar 2022 09:09:56 +0530
Message-ID: <CA+G9fYs3GavpYh6V_yTUGNbAU70mygVxBKvqoq=xh20pw1Wvow@mail.gmail.com>
Subject: [next] mips: clang-14-defconfig build regression
To: llvm@lists.linux.dev, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

[Please ignore this email if it is already reported]

Linux next-20220302 mips builds failed [1] & [2].

Regressions found on mips:

  - mips-clang-12-defconfig
  - mips-clang-13-allnoconfig
  - mips-clang-12-allnoconfig
  - mips-clang-12-tinyconfig
  - mips-clang-13-defconfig
  - mips-clang-11-tinyconfig
  - mips-clang-11-defconfig
  - mips-clang-nightly-allnoconfig
  - mips-clang-14-tinyconfig
  - mips-clang-14-defconfig
  - mips-clang-11-allnoconfig
  - mips-clang-nightly-tinyconfig
  - mips-clang-13-tinyconfig
  - mips-clang-nightly-defconfig
  - mips-clang-14-allnoconfig

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=mips CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang' defconfig
Using /builds/linux/arch/mips/configs/generic_defconfig as base
Merging /builds/linux/arch/mips/configs/generic/32r2.config
Merging /builds/linux/arch/mips/configs/generic/el.config
Merging /builds/linux/arch/mips/configs/generic/board-boston.config
Merging /builds/linux/arch/mips/configs/generic/board-marduk.config
Merging /builds/linux/arch/mips/configs/generic/board-ni169445.config
Merging /builds/linux/arch/mips/configs/generic/board-ocelot.config
Merging /builds/linux/arch/mips/configs/generic/board-ranchu.config
Merging /builds/linux/arch/mips/configs/generic/board-sead-3.config
Merging /builds/linux/arch/mips/configs/generic/board-xilfpga.config
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=mips CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'
/builds/linux/arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning
(pci_device_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address
format error, expected "0,0"
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:48:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_enable reg=$8
 ^
/builds/linux/arch/mips/include/asm/asmmacro.h:53:2: warning: macro
defined with named parameters which are not used in macro body,
possible positional parameter found in body which will have no effect
 .macro local_irq_disable reg=$8
 ^
fatal error: error in backend: Invalid register name global variable
PLEASE submit a bug report to https://bugs.llvm.org/ and include the
crash backtrace, preprocessed source, and associated run script.
Stack dump:
0.Program arguments: /usr/local/bin/clang -x c -c
/builds/linux/arch/mips/lib/uncached.c -o arch/mips/lib/uncached.o
-nostdinc -I/builds/linux/arch/mips/include
-I./arch/mips/include/generated -I/builds/linux/include -I./include
-I/builds/linux/arch/mips/include/uapi
-I./arch/mips/include/generated/uapi -I/builds/linux/include/uapi
-I./include/generated/uapi -include
/builds/linux/include/linux/compiler-version.h -include
/builds/linux/include/linux/kconfig.h -include
/builds/linux/include/linux/compiler_types.h -D__KERNEL__
-DVMLINUX_LOAD_ADDRESS=0xffffffff80100000
-DLINKER_LOAD_ADDRESS=0x80100000 -DDATAOFFSET=0
-DGAS_HAS_SET_HARDFLOAT -DTOOLCHAIN_SUPPORTS_VIRT
-I/builds/linux/arch/mips/include/asm/mach-generic
-I/builds/linux/arch/mips/include/asm/mach-generic
-I/builds/linux/arch/mips/lib -I./arch/mips/lib
-DKBUILD_MODFILE=\"arch/mips/lib/uncached\"
-DKBUILD_BASENAME=\"uncached\" -DKBUILD_MODNAME=\"uncached\"
-D__KBUILD_MODNAME=kmod_uncached -Wp,-MMD,arch/mips/lib/.uncached.o.d
-Qunused-arguments -fmacro-prefix-map=/builds/linux/= -Wall -Wundef
-Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing
-fno-common -fshort-wchar -fno-PIE
-Werror=implicit-function-declaration -Werror=implicit-int
-Werror=return-type -Wno-format-security -std=gnu89
--target=mips-linux-gnu -fintegrated-as -Werror=unknown-warning-option
-Werror=ignored-optimization-argument -mno-check-zero-division
-mabi=32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float
-Wa,-msoft-float -ffreestanding -EL -fno-stack-check -march=mips32r2
-Wa,--trap -fno-asynchronous-unwind-tables
-fno-delete-null-pointer-checks -Wno-frame-address
-Wno-address-of-packed-member -O2 -Wframe-larger-than=1024
-fstack-protector-strong -Wno-gnu -mno-global-merge
-Wno-unused-const-variable -fomit-frame-pointer
-ftrivial-auto-var-init=zero
-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
-fno-stack-clash-protection -Wdeclaration-after-statement -Wvla
-Wno-pointer-sign -fno-strict-overflow -fno-stack-check
-Werror=date-time -Werror=incompatible-pointer-types
-Wno-initializer-overrides -Wno-format -Wno-sign-compare
-Wno-format-zero-length -Wno-pointer-to-enum-cast
-Wno-tautological-constant-out-of-range-compare
-ffile-prefix-map=/home/tuxbuild/.cache/tuxmake/builds/1/build/=
1.<eof> parser at end of file
2.Code generation
3.Running pass 'Function Pass Manager' on module
'/builds/linux/arch/mips/lib/uncached.c'.
4.Running pass 'MIPS DAG->DAG Pattern Instruction Selection' on
function '@run_uncached'
 #0 0x00007fe9edb20cb1 llvm::sys::PrintStackTrace(llvm::raw_ostream&,
int) (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xe61cb1)
 #1 0x00007fe9edb1ede0 llvm::sys::RunSignalHandlers()
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xe5fde0)
 #2 0x00007fe9edb20340 llvm::sys::CleanupOnSignal(unsigned long)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xe61340)
 #3 0x00007fe9eda69e8a (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xdaae8a)
 #4 0x00007fe9eda69e2b (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xdaae2b)
 #5 0x00007fe9edb1b457 llvm::sys::Process::Exit(int, bool)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xe5c457)
 #6 0x0000000000413990 (/usr/local/bin/clang+0x413990)
 #7 0x00007fe9eda76282 llvm::report_fatal_error(llvm::Twine const&,
bool) (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xdb7282)
 #8 0x00007fe9eda76156 (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xdb7156)
 #9 0x00007fe9efa80e23 (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x2dc1e23)
#10 0x00007fe9ee2468a7
llvm::SelectionDAGISel::Select_READ_REGISTER(llvm::SDNode*)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x15878a7)
#11 0x00007fe9ee247159
llvm::SelectionDAGISel::SelectCodeCommon(llvm::SDNode*, unsigned char
const*, unsigned int)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x1588159)
#12 0x00007fe9ee243adf
llvm::SelectionDAGISel::DoInstructionSelection()
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x1584adf)
#13 0x00007fe9ee243194 llvm::SelectionDAGISel::CodeGenAndEmitDAG()
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x1584194)
#14 0x00007fe9ee2425ca
llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm::Function const&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x15835ca)
#15 0x00007fe9ee240156
llvm::SelectionDAGISel::runOnMachineFunction(llvm::MachineFunction&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x1581156)
#16 0x00007fe9efa6408a (/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x2da508a)
#17 0x00007fe9ede451ae
llvm::MachineFunctionPass::runOnFunction(llvm::Function&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0x11861ae)
#18 0x00007fe9edc54f50
llvm::FPPassManager::runOnFunction(llvm::Function&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xf95f50)
#19 0x00007fe9edc5ab03 llvm::FPPassManager::runOnModule(llvm::Module&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xf9bb03)
#20 0x00007fe9edc55558
llvm::legacy::PassManagerImpl::run(llvm::Module&)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xf96558)
#21 0x00007fe9f3ff4456
clang::EmitBackendOutput(clang::DiagnosticsEngine&,
clang::HeaderSearchOptions const&, clang::CodeGenOptions const&,
clang::TargetOptions const&, clang::LangOptions const&,
llvm::DataLayout const&, llvm::Module*, clang::BackendAction,
std::unique_ptr<llvm::raw_pwrite_stream,
std::default_delete<llvm::raw_pwrite_stream> >)
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1676456)
#22 0x00007fe9f42a375e (/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x192575e)
#23 0x00007fe9f338b144 clang::ParseAST(clang::Sema&, bool, bool)
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0xa0d144)
#24 0x00007fe9f42a03b3 clang::CodeGenAction::ExecuteAction()
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x19223b3)
#25 0x00007fe9f49da756 clang::FrontendAction::Execute()
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x205c756)
#26 0x00007fe9f4962411
clang::CompilerInstance::ExecuteAction(clang::FrontendAction&)
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1fe4411)
#27 0x00007fe9f4a42806
clang::ExecuteCompilerInvocation(clang::CompilerInstance*)
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x20c4806)
#28 0x0000000000413689 cc1_main(llvm::ArrayRef<char const*>, char
const*, void*) (/usr/local/bin/clang+0x413689)
#29 0x000000000041198f (/usr/local/bin/clang+0x41198f)
#30 0x00007fe9f46688f2 (/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1cea8f2)
#31 0x00007fe9eda69e0d
llvm::CrashRecoveryContext::RunSafely(llvm::function_ref<void ()>)
(/usr/lib/x86_64-linux-gnu/libLLVM-12.so.1+0xdaae0d)
#32 0x00007fe9f4668080
clang::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringRef>
>, std::__cxx11::basic_string<char, std::char_traits<char>,
std::allocator<char> >*, bool*) const
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1cea080)
#33 0x00007fe9f463bab0
clang::driver::Compilation::ExecuteCommand(clang::driver::Command
const&, clang::driver::Command const*&) const
(/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1cbdab0)
#34 0x00007fe9f463be9a
clang::driver::Compilation::ExecuteJobs(clang::driver::JobList const&,
llvm::SmallVectorImpl<std::pair<int, clang::driver::Command const*>
>&) const (/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1cbde9a)
#35 0x00007fe9f465147c
clang::driver::Driver::ExecuteCompilation(clang::driver::Compilation&,
llvm::SmallVectorImpl<std::pair<int, clang::driver::Command const*>
>&) (/usr/lib/x86_64-linux-gnu/libclang-cpp.so.12+0x1cd347c)
#36 0x00000000004111f9 main (/usr/local/bin/clang+0x4111f9)
#37 0x00007fe9ec7f3d0a __libc_start_main
(/lib/x86_64-linux-gnu/libc.so.6+0x26d0a)
#38 0x000000000040e99a _start (/usr/local/bin/clang+0x40e99a)
clang: error: clang frontend command failed with exit code 70 (use -v
to see invocation)
Debian clang version
12.0.1-++20211027092659+fed41342a82f-1~exp1~20211027213207.7
Target: mipsel-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/local/bin
clang: note: diagnostic msg:
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
clang: note: diagnostic msg: /tmp/uncached-39aa89.c
clang: note: diagnostic msg: /tmp/uncached-39aa89.sh
clang: note: diagnostic msg:

********************
make[2]: *** [/builds/linux/scripts/Makefile.build:288:
arch/mips/lib/uncached.o] Error 70
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/builds/linux/Makefile:1971: arch/mips/lib] Error 2
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2
make: Target '__all' not remade because of errors.


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


--
Linaro LKFT
https://lkft.linaro.org
[1] https://builds.tuxbuild.com/25pK2fPNGxyBUklnRhYZa7QqR0Q/
[2] https://builds.tuxbuild.com/25pK2aTFzT2fxt4g3M6EKhMCWB2/
