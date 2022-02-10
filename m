Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65FA2F24
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644499708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=655oapQofgtIjTDCAPuuIN68Pbz4ffFFuE9wwH9kpAI=;
	b=hp+BN5aHYAGckNP324DQXn1HkcJ7YF36HdiH1ad7Cmh395aDl0V+X4rwEmzJ7d5B1qzSDx
	P331RakCx1XyIq63hjOZjP7aoVquX91dt8pSSp3bYcGPIgD0NNHphF9/6JYTvIiqmaVSID
	jpZswk7Ir5tPNhRrZwpN0kBmWFugsIc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-1fOUdsG2MUS7vCUx46a9bQ-1; Thu, 10 Feb 2022 08:28:18 -0500
X-MC-Unique: 1fOUdsG2MUS7vCUx46a9bQ-1
Received: by mail-pj1-f70.google.com with SMTP id jf17-20020a17090b175100b001b90cf26a4eso4277167pjb.3
        for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 05:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FXbCS4MBCfEnqEfy65p8ZrotlbsJqVe/jujDF0szR90=;
        b=g0rCTdD6GZilVDNg9uD4gKnf6HZEMZZBN8ZAUraqaY1SUhJE4zyKQRHYaHlpUt7hEL
         R2nA/HBXrrhoA3DP+uwxb+INU7UbWZdhvM3IIaFAi14MWktIR3Cq7CKTj0I99r5Q8+7p
         7gcmoL9ZT0jlm73ycWYL5hNXKBa/SsHXjRSyuKTeFwl/fpZWBMj9QUavYpFumZUf2qWv
         wINXgqsBk0PEbmWAWXz3B7hgOdHj0vHfX2FTA4YPp83vzuPAMUXv9uNzPKAfk+JNqZ+R
         bfQpyXm4WXAhFmwn3naop9W4C7SwPAC8B1PXB2syeSk9JOfrN1BT67GUkvhQ2KoZeXVU
         QKEQ==
X-Gm-Message-State: AOAM530lJweRG6u6Vyc/YdzRslMMedfz/tT5v0N6Aen/EA1y5kdbP7hG
	fCh21N8/nY8U9iDvzoO8ZTAeKt0TichX4Mk6Ja53wiDpwcc06bFugMe/cOcJAbr1SvRjRW8EMHy
	YbbI7aRpA2hyfqA==
X-Received: by 2002:a17:902:bc83:: with SMTP id bb3mr7538716plb.172.1644499694949;
        Thu, 10 Feb 2022 05:28:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZT3/uf+i1M6aTUhq/nXKEELTt36uWRkAYdnFKo+/wNAFrfW9Y8Qqa+wd8DMBbJrlmuBbjCA==
X-Received: by 2002:a17:902:bc83:: with SMTP id bb3mr7538642plb.172.1644499694011;
        Thu, 10 Feb 2022 05:28:14 -0800 (PST)
Received: from [10.72.12.153] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id m21sm16756765pgh.69.2022.02.10.05.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 05:28:13 -0800 (PST)
Subject: Re: [ceph-client:testing 6/8] fs/ceph/addr.c:788:12: warning: stack
 frame size (2352) exceeds limit (2048) in 'ceph_writepages_start'
To: Jeff Layton <jlayton@kernel.org>, kernel test robot <lkp@intel.com>,
 David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>
References: <202202102053.7C17duIV-lkp@intel.com>
 <38bc506c75bf502ce5b15158315fde1c59b0b2d3.camel@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <f25d857b-5760-de8a-51e0-3229e5a31137@redhat.com>
Date: Thu, 10 Feb 2022 21:28:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <38bc506c75bf502ce5b15158315fde1c59b0b2d3.camel@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=xiubli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2/10/22 9:01 PM, Jeff Layton wrote:
> On Thu, 2022-02-10 at 20:14 +0800, kernel test robot wrote:
>> tree:   https://github.com/ceph/ceph-client.git testing
>> head:   6dc7235ee916b768b31afa12ab507874bd278573
>> commit: 85fc162016ac8d19e28877a15f55c0fa4b47713b [6/8] ceph: Make ceph_n=
etfs_issue_op() handle inlined data
>> config: mips-randconfig-r014-20220209 (https://download.01.org/0day-ci/a=
rchive/20220210/202202102053.7C17duIV-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project aa8=
45d7a245d85c441d0bd44fc7b6c3be8f3de8d)
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install mips cross compiling tool for clang build
>>          # apt-get install binutils-mips-linux-gnu
>>          # https://github.com/ceph/ceph-client/commit/85fc162016ac8d19e2=
8877a15f55c0fa4b47713b
>>          git remote add ceph-client https://github.com/ceph/ceph-client.=
git
>>          git fetch --no-tags ceph-client testing
>>          git checkout 85fc162016ac8d19e28877a15f55c0fa4b47713b
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Dmips SHELL=3D/bin/bash fs/ceph/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> fs/ceph/addr.c:788:12: warning: stack frame size (2352) exceeds limit =
(2048) in 'ceph_writepages_start'
>
> ceph_writepages_start is a major stack hog, but the commit mentioned
> above doesn't affect that function, AFAICT. I don't think this is a new
> problem from that patch.
>
> This looks more like llvm on mips blew up?

Yeah, it seems. The 'ceph_writepages_start()' will consume around 350=20
bytes in the stack frame.

And before calling it the stack frame already reaches full.

>
>>     static int ceph_writepages_start(struct address_space
>>     ^
>>     fatal error: error in backend: Nested variants found in inline asm s=
tring: ' .set push
>>     .set mips64r6
>>     .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_b=
ranch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftr=
ace_branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/i=
nclude/asm/bitops.h", .line =3D 190, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 )=
; .set push; .set mips64r6; .rept 1; sync 0x00; .endr; .set pop; .else; ; .=
endif
>>     1: lld $0, $2
>>     or $1, $0, $3
>>     scd $1, $2
>>     beqzc $1, 1b
>>     .set pop
>>     '
>>     PLEASE submit a bug report to https://github.com/llvm/llvm-project/i=
ssues/ and include the crash backtrace, preprocessed source, and associated=
 run script.
>>     Stack dump:
>>     0. Program arguments: clang -Wp,-MMD,fs/ceph/.addr.o.d -nostdinc -Ia=
rch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iar=
ch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I=
./include/generated/uapi -include include/linux/compiler-version.h -include=
 include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL=
__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0xff=
ffffff84000000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D=
 -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimpli=
cit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-=
format-security -std=3Dgnu89 --target=3Dmips64-linux -fintegrated-as -Werro=
r=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mabi=3D=
64 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -DGAS_HAS_SET_HARDFLOAT -=
Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmips64r6 -Wa,-=
-trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-generic -Iarch=
/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-=
null-pointer-checks -Wno-frame-address -Wno-address-of-packed-member -O2 -W=
frame-larger-than=3D2048 -fno-stack-protector -Wimplicit-fallthrough -Wno-g=
nu -mno-global-merge -Wno-unused-but-set-variable -Wno-unused-const-variabl=
e -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-protection -pg -Wdecla=
ration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-ar=
ray-bounds -fno-strict-overflow -fno-stack-check -Werror=3Ddate-time -Werro=
r=3Dincompatible-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmis=
sing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-sty=
le-definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-con=
st-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-lim=
its -fsanitize=3Dunreachable -fsanitize=3Denum -I fs/ceph -I ./fs/ceph -DMO=
DULE -mlong-calls -DKBUILD_BASENAME=3D"addr" -DKBUILD_MODNAME=3D"ceph" -D__=
KBUILD_MODNAME=3Dkmod_ceph -c -o fs/ceph/addr.o fs/ceph/addr.c
>>     1. <eof> parser at end of file
>>     2. Code generation
>>     3. Running pass 'Function Pass Manager' on module 'fs/ceph/addr.c'.
>>     4. Running pass 'Mips Assembly Printer' on function '@ceph_writepage=
s_start'
>>     #0 0x000055a535e1f68f Signals.cpp:0:0
>>     #1 0x000055a535e1d56c llvm::sys::CleanupOnSignal(unsigned long) (/op=
t/cross/clang-aa845d7a24/bin/clang-15+0x347456c)
>>     #2 0x000055a535d5d9e7 llvm::CrashRecoveryContext::HandleExit(int) (/=
opt/cross/clang-aa845d7a24/bin/clang-15+0x33b49e7)
>>     #3 0x000055a535e15c1e llvm::sys::Process::Exit(int, bool) (/opt/cros=
s/clang-aa845d7a24/bin/clang-15+0x346cc1e)
>>     #4 0x000055a533a508bb (/opt/cross/clang-aa845d7a24/bin/clang-15+0x10=
a78bb)
>>     #5 0x000055a535d6449c llvm::report_fatal_error(llvm::Twine const&, b=
ool) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x33bb49c)
>>     #6 0x000055a536a56000 llvm::AsmPrinter::emitInlineAsm(llvm::MachineI=
nstr const (/opt/cross/clang-aa845d7a24/bin/clang-15+0x40ad000)
>>     #7 0x000055a536a51f34 llvm::AsmPrinter::emitFunctionBody() (/opt/cro=
ss/clang-aa845d7a24/bin/clang-15+0x40a8f34)
>>     #8 0x000055a5344bb1e7 llvm::MipsAsmPrinter::runOnMachineFunction(llv=
m::MachineFunction&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x1b121e7)
>>     #9 0x000055a535170a3d llvm::MachineFunctionPass::runOnFunction(llvm:=
:Function&) (.part.53) MachineFunctionPass.cpp:0:0
>>     #10 0x000055a5355b1757 llvm::FPPassManager::runOnFunction(llvm::Func=
tion&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x2c08757)
>>     #11 0x000055a5355b18d1 llvm::FPPassManager::runOnModule(llvm::Module=
&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x2c088d1)
>>     #12 0x000055a5355b244f llvm::legacy::PassManagerImpl::run(llvm::Modu=
le&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x2c0944f)
>>     #13 0x000055a536137917 clang::EmitBackendOutput(clang::DiagnosticsEn=
gine&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, cla=
ng::TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang=
::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_dele=
te<llvm::raw_pwrite_stream> >) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x=
378e917)
>>     #14 0x000055a536d6f063 clang::BackendConsumer::HandleTranslationUnit=
(clang::ASTContext&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x43c6063)
>>     #15 0x000055a537845629 clang::ParseAST(clang::Sema&, bool, bool) (/o=
pt/cross/clang-aa845d7a24/bin/clang-15+0x4e9c629)
>>     #16 0x000055a536d6de9f clang::CodeGenAction::ExecuteAction() (/opt/c=
ross/clang-aa845d7a24/bin/clang-15+0x43c4e9f)
>>     #17 0x000055a53676ac81 clang::FrontendAction::Execute() (/opt/cross/=
clang-aa845d7a24/bin/clang-15+0x3dc1c81)
>>     #18 0x000055a536701b0a clang::CompilerInstance::ExecuteAction(clang:=
:FrontendAction&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x3d58b0a)
>>     #19 0x000055a53682f59b (/opt/cross/clang-aa845d7a24/bin/clang-15+0x3=
e8659b)
>>     #20 0x000055a533a51e6c cc1_main(llvm::ArrayRef<char char (/opt/cross=
/clang-aa845d7a24/bin/clang-15+0x10a8e6c)
>>     #21 0x000055a533a4eb3b ExecuteCC1Tool(llvm::SmallVectorImpl<char dri=
ver.cpp:0:0
>>     #22 0x000055a536599765 void llvm::function_ref<void ()>::callback_fn=
<clang::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::Str=
ingRef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::al=
locator<char> const::'lambda'()>(long) Job.cpp:0:0
>>     #23 0x000055a535d5d8a3 llvm::CrashRecoveryContext::RunSafely(llvm::f=
unction_ref<void ()>) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x33b48a3)
>>     #24 0x000055a53659a05e clang::driver::CC1Command::Execute(llvm::Arra=
yRef<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, st=
d::char_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
>>     #25 0x000055a53656ec57 clang::driver::Compilation::ExecuteCommand(cl=
ang::driver::Command const&, clang::driver::Command const (/opt/cross/clang=
-aa845d7a24/bin/clang-15+0x3bc5c57)
>>     #26 0x000055a53656f637 clang::driver::Compilation::ExecuteJobs(clang=
::driver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::drive=
r::Command >&) const (/opt/cross/clang-aa845d7a24/bin/clang-15+0x3bc6637)
>>     #27 0x000055a536578cc9 clang::driver::Driver::ExecuteCompilation(cla=
ng::driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::drive=
r::Command >&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x3bcfcc9)
>>     #28 0x000055a53397738f main (/opt/cross/clang-aa845d7a24/bin/clang-1=
5+0xfce38f)
>>     #29 0x00007fe35f12cd0a __libc_start_main (/lib/x86_64-linux-gnu/libc=
.so.6+0x26d0a)
>>     #30 0x000055a533a4e65a _start (/opt/cross/clang-aa845d7a24/bin/clang=
-15+0x10a565a)
>>     clang-15: error: clang frontend command failed with exit code 70 (us=
e -v to see invocation)
>>     clang version 15.0.0 (git://gitmirror/llvm_project aa845d7a245d85c44=
1d0bd44fc7b6c3be8f3de8d)
>>     Target: mips64-unknown-linux
>>     Thread model: posix
>>     InstalledDir: /opt/cross/clang-aa845d7a24/bin
>>     clang-15: note: diagnostic msg:
>>     Makefile arch fs include kernel nr_bisected scripts source usr
>> --
>>>> fs/ceph/addr.c:788:12: warning: stack frame size (2352) exceeds limit =
(2048) in 'ceph_writepages_start'
>>     static int ceph_writepages_start(struct address_space
>>     ^
>>     fatal error: error in backend: Nested variants found in inline asm s=
tring: ' .set push
>>     .set mips64r6
>>     .if ( 0x00 ) !=3D -1)) 0x00 ) !=3D -1)) : ($( static struct ftrace_b=
ranch_data __attribute__((__aligned__(4))) __attribute__((__section__("_ftr=
ace_branch"))) __if_trace =3D $( .func =3D __func__, .file =3D "arch/mips/i=
nclude/asm/bitops.h", .line =3D 190, $); 0x00 ) !=3D -1)) : $))) ) && ( 0 )=
; .set push; .set mips64r6; .rept 1; sync 0x00; .endr; .set pop; .else; ; .=
endif
>>     1: lld $0, $2
>>     or $1, $0, $3
>>     scd $1, $2
>>     beqzc $1, 1b
>>     .set pop
>>     '
>>     PLEASE submit a bug report to https://github.com/llvm/llvm-project/i=
ssues/ and include the crash backtrace, preprocessed source, and associated=
 run script.
>>     Stack dump:
>>     0. Program arguments: clang -Wp,-MMD,fs/ceph/.addr.o.d -nostdinc -Ia=
rch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Iar=
ch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -I=
./include/generated/uapi -include include/linux/compiler-version.h -include=
 include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL=
__ -DVMLINUX_LOAD_ADDRESS=3D0xffffffff84000000 -DLINKER_LOAD_ADDRESS=3D0xff=
ffffff84000000 -DDATAOFFSET=3D0 -Qunused-arguments -fmacro-prefix-map=3D=3D=
 -DKBUILD_EXTRA_WARN1 -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigra=
phs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimpli=
cit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-=
format-security -std=3Dgnu89 --target=3Dmips64-linux -fintegrated-as -Werro=
r=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mabi=3D=
64 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -DGAS_HAS_SET_HARDFLOAT -=
Wa,-msoft-float -ffreestanding -EB -fno-stack-check -march=3Dmips64r6 -Wa,-=
-trap -DTOOLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-generic -Iarch=
/mips/include/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-=
null-pointer-checks -Wno-frame-address -Wno-address-of-packed-member -O2 -W=
frame-larger-than=3D2048 -fno-stack-protector -Wimplicit-fallthrough -Wno-g=
nu -mno-global-merge -Wno-unused-but-set-variable -Wno-unused-const-variabl=
e -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-protection -pg -Wdecla=
ration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-ar=
ray-bounds -fno-strict-overflow -fno-stack-check -Werror=3Ddate-time -Werro=
r=3Dincompatible-pointer-types -Wextra -Wunused -Wno-unused-parameter -Wmis=
sing-declarations -Wmissing-format-attribute -Wmissing-prototypes -Wold-sty=
le-definition -Wmissing-include-dirs -Wunused-but-set-variable -Wunused-con=
st-variable -Wno-missing-field-initializers -Wno-sign-compare -Wno-type-lim=
its -fsanitize=3Dunreachable -fsanitize=3Denum -DMODULE -mlong-calls -DKBUI=
LD_BASENAME=3D"addr" -DKBUILD_MODNAME=3D"ceph" -D__KBUILD_MODNAME=3Dkmod_ce=
ph -c -o fs/ceph/addr.o fs/ceph/addr.c
>>     1. <eof> parser at end of file
>>     2. Code generation
>>     3. Running pass 'Function Pass Manager' on module 'fs/ceph/addr.c'.
>>     4. Running pass 'Mips Assembly Printer' on function '@ceph_writepage=
s_start'
>>     #0 0x0000562358d5368f Signals.cpp:0:0
>>     #1 0x0000562358d5156c llvm::sys::CleanupOnSignal(unsigned long) (/op=
t/cross/clang-aa845d7a24/bin/clang-15+0x347456c)
>>     #2 0x0000562358c919e7 llvm::CrashRecoveryContext::HandleExit(int) (/=
opt/cross/clang-aa845d7a24/bin/clang-15+0x33b49e7)
>>     #3 0x0000562358d49c1e llvm::sys::Process::Exit(int, bool) (/opt/cros=
s/clang-aa845d7a24/bin/clang-15+0x346cc1e)
>>     #4 0x00005623569848bb (/opt/cross/clang-aa845d7a24/bin/clang-15+0x10=
a78bb)
>>     #5 0x0000562358c9849c llvm::report_fatal_error(llvm::Twine const&, b=
ool) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x33bb49c)
>>     #6 0x000056235998a000 llvm::AsmPrinter::emitInlineAsm(llvm::MachineI=
nstr const (/opt/cross/clang-aa845d7a24/bin/clang-15+0x40ad000)
>>     #7 0x0000562359985f34 llvm::AsmPrinter::emitFunctionBody() (/opt/cro=
ss/clang-aa845d7a24/bin/clang-15+0x40a8f34)
>>     #8 0x00005623573ef1e7 llvm::MipsAsmPrinter::runOnMachineFunction(llv=
m::MachineFunction&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x1b121e7)
>>     #9 0x00005623580a4a3d llvm::MachineFunctionPass::runOnFunction(llvm:=
:Function&) (.part.53) MachineFunctionPass.cpp:0:0
>>     #10 0x00005623584e5757 llvm::FPPassManager::runOnFunction(llvm::Func=
tion&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x2c08757)
>>     #11 0x00005623584e58d1 llvm::FPPassManager::runOnModule(llvm::Module=
&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x2c088d1)
>>     #12 0x00005623584e644f llvm::legacy::PassManagerImpl::run(llvm::Modu=
le&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x2c0944f)
>>     #13 0x000056235906b917 clang::EmitBackendOutput(clang::DiagnosticsEn=
gine&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, cla=
ng::TargetOptions const&, clang::LangOptions const&, llvm::StringRef, clang=
::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_dele=
te<llvm::raw_pwrite_stream> >) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x=
378e917)
>>     #14 0x0000562359ca3063 clang::BackendConsumer::HandleTranslationUnit=
(clang::ASTContext&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x43c6063)
>>     #15 0x000056235a779629 clang::ParseAST(clang::Sema&, bool, bool) (/o=
pt/cross/clang-aa845d7a24/bin/clang-15+0x4e9c629)
>>     #16 0x0000562359ca1e9f clang::CodeGenAction::ExecuteAction() (/opt/c=
ross/clang-aa845d7a24/bin/clang-15+0x43c4e9f)
>>     #17 0x000056235969ec81 clang::FrontendAction::Execute() (/opt/cross/=
clang-aa845d7a24/bin/clang-15+0x3dc1c81)
>>     #18 0x0000562359635b0a clang::CompilerInstance::ExecuteAction(clang:=
:FrontendAction&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x3d58b0a)
>>     #19 0x000056235976359b (/opt/cross/clang-aa845d7a24/bin/clang-15+0x3=
e8659b)
>>     #20 0x0000562356985e6c cc1_main(llvm::ArrayRef<char char (/opt/cross=
/clang-aa845d7a24/bin/clang-15+0x10a8e6c)
>>     #21 0x0000562356982b3b ExecuteCC1Tool(llvm::SmallVectorImpl<char dri=
ver.cpp:0:0
>>     #22 0x00005623594cd765 void llvm::function_ref<void ()>::callback_fn=
<clang::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::Str=
ingRef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::al=
locator<char> const::'lambda'()>(long) Job.cpp:0:0
>>     #23 0x0000562358c918a3 llvm::CrashRecoveryContext::RunSafely(llvm::f=
unction_ref<void ()>) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x33b48a3)
>>     #24 0x00005623594ce05e clang::driver::CC1Command::Execute(llvm::Arra=
yRef<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, st=
d::char_traits<char>, std::allocator<char> const (.part.216) Job.cpp:0:0
>>     #25 0x00005623594a2c57 clang::driver::Compilation::ExecuteCommand(cl=
ang::driver::Command const&, clang::driver::Command const (/opt/cross/clang=
-aa845d7a24/bin/clang-15+0x3bc5c57)
>>     #26 0x00005623594a3637 clang::driver::Compilation::ExecuteJobs(clang=
::driver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::drive=
r::Command >&) const (/opt/cross/clang-aa845d7a24/bin/clang-15+0x3bc6637)
>>     #27 0x00005623594accc9 clang::driver::Driver::ExecuteCompilation(cla=
ng::driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::drive=
r::Command >&) (/opt/cross/clang-aa845d7a24/bin/clang-15+0x3bcfcc9)
>>     #28 0x00005623568ab38f main (/opt/cross/clang-aa845d7a24/bin/clang-1=
5+0xfce38f)
>>     #29 0x00007f845ced9d0a __libc_start_main (/lib/x86_64-linux-gnu/libc=
.so.6+0x26d0a)
>>     #30 0x000056235698265a _start (/opt/cross/clang-aa845d7a24/bin/clang=
-15+0x10a565a)
>>     clang-15: error: clang frontend command failed with exit code 70 (us=
e -v to see invocation)
>>     clang version 15.0.0 (git://gitmirror/llvm_project aa845d7a245d85c44=
1d0bd44fc7b6c3be8f3de8d)
>>     Target: mips64-unknown-linux
>>     Thread model: posix
>>     InstalledDir: /opt/cross/clang-aa845d7a24/bin
>>     clang-15: note: diagnostic msg:
>>     Makefile arch fs include kernel nr_bisected scripts source usr
>>
>>
>> vim +/ceph_writepages_start +788 fs/ceph/addr.c
>>
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   784
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   785  /*
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   786   * initiate async wr=
iteback
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   787   */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  @788  static int ceph_writ=
epages_start(struct address_space *mapping,
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   789  =09=09=09=09 struct =
writeback_control *wbc)
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   790  {
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   791  =09struct inode *ino=
de =3D mapping->host;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   792  =09struct ceph_inode=
_info *ci =3D ceph_inode(inode);
>> fc2744aa12da71 Yan, Zheng         2013-05-31   793  =09struct ceph_fs_cl=
ient *fsc =3D ceph_inode_to_client(inode);
>> fc2744aa12da71 Yan, Zheng         2013-05-31   794  =09struct ceph_vino =
vino =3D ceph_vino(inode);
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   795  =09pgoff_t index, st=
art_index, end =3D -1;
>> 80e755fedebc8d Sage Weil          2010-03-31   796  =09struct ceph_snap_=
context *snapc =3D NULL, *last_snapc =3D NULL, *pgsnapc;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   797  =09struct pagevec pv=
ec;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   798  =09int rc =3D 0;
>> 93407472a21b82 Fabian Frederick   2017-02-27   799  =09unsigned int wsiz=
e =3D i_blocksize(inode);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   800  =09struct ceph_osd_r=
equest *req =3D NULL;
>> 1f934b00e90752 Yan, Zheng         2017-08-30   801  =09struct ceph_write=
back_ctl ceph_wbc;
>> 590e9d9861f5f2 Yan, Zheng         2017-09-03   802  =09bool should_loop,=
 range_whole =3D false;
>> af9cc401ce7452 Yan, Zheng         2018-03-04   803  =09bool done =3D fal=
se;
>> 1702e79734104d Jeff Layton        2021-12-07   804  =09bool caching =3D =
ceph_is_cache_enabled(inode);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   805
>> 3fb99d483e614b Yanhu Cao          2017-07-21   806  =09dout("writepages_=
start %p (mode=3D%s)\n", inode,
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   807  =09     wbc->sync_mo=
de =3D=3D WB_SYNC_NONE ? "NONE" :
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   808  =09     (wbc->sync_m=
ode =3D=3D WB_SYNC_ALL ? "ALL" : "HOLD"));
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   809
>> 5d6451b1489ad1 Jeff Layton        2021-08-31   810  =09if (ceph_inode_is=
_shutdown(inode)) {
>> 6c93df5db628e7 Yan, Zheng         2016-04-15   811  =09=09if (ci->i_wrbu=
ffer_ref > 0) {
>> 6c93df5db628e7 Yan, Zheng         2016-04-15   812  =09=09=09pr_warn_rat=
elimited(
>> 6c93df5db628e7 Yan, Zheng         2016-04-15   813  =09=09=09=09"writepa=
ge_start %p %lld forced umount\n",
>> 6c93df5db628e7 Yan, Zheng         2016-04-15   814  =09=09=09=09inode, c=
eph_ino(inode));
>> 6c93df5db628e7 Yan, Zheng         2016-04-15   815  =09=09}
>> a341d4df87487a Yan, Zheng         2015-07-01   816  =09=09mapping_set_er=
ror(mapping, -EIO);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   817  =09=09return -EIO; /=
* we're in a forced umount, don't write! */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   818  =09}
>> 95cca2b44e54b0 Yan, Zheng         2017-07-11   819  =09if (fsc->mount_op=
tions->wsize < wsize)
>> 3d14c5d2b6e15c Yehuda Sadeh       2010-04-06   820  =09=09wsize =3D fsc-=
>mount_options->wsize;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   821
>> 8667982014d604 Mel Gorman         2017-11-15   822  =09pagevec_init(&pve=
c);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   823
>> 590e9d9861f5f2 Yan, Zheng         2017-09-03   824  =09start_index =3D w=
bc->range_cyclic ? mapping->writeback_index : 0;
>> 590e9d9861f5f2 Yan, Zheng         2017-09-03   825  =09index =3D start_i=
ndex;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   826
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   827  retry:
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   828  =09/* find oldest sn=
ap context with dirty data */
>> 05455e1177f768 Yan, Zheng         2017-09-02   829  =09snapc =3D get_old=
est_context(inode, &ceph_wbc, NULL);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   830  =09if (!snapc) {
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   831  =09=09/* hmm, why do=
es writepages get called when there
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   832  =09=09   is no dirty=
 data? */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   833  =09=09dout(" no snap=
 context with dirty data?\n");
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   834  =09=09goto out;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   835  =09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   836  =09dout(" oldest sna=
pc is %p seq %lld (%d snaps)\n",
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   837  =09     snapc, snapc=
->seq, snapc->num_snaps);
>> fc2744aa12da71 Yan, Zheng         2013-05-31   838
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   839  =09should_loop =3D f=
alse;
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   840  =09if (ceph_wbc.head=
_snapc && snapc !=3D last_snapc) {
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   841  =09=09/* where to st=
art/end? */
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   842  =09=09if (wbc->range=
_cyclic) {
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   843  =09=09=09index =3D s=
tart_index;
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   844  =09=09=09end =3D -1;
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   845  =09=09=09if (index >=
 0)
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   846  =09=09=09=09should_l=
oop =3D true;
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   847  =09=09=09dout(" cycl=
ic, start at %lu\n", index);
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   848  =09=09} else {
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   849  =09=09=09index =3D w=
bc->range_start >> PAGE_SHIFT;
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   850  =09=09=09end =3D wbc=
->range_end >> PAGE_SHIFT;
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   851  =09=09=09if (wbc->ra=
nge_start =3D=3D 0 && wbc->range_end =3D=3D LLONG_MAX)
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   852  =09=09=09=09range_wh=
ole =3D true;
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   853  =09=09=09dout(" not =
cyclic, %lu to %lu\n", index, end);
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   854  =09=09}
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   855  =09} else if (!ceph_=
wbc.head_snapc) {
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   856  =09=09/* Do not resp=
ect wbc->range_{start,end}. Dirty pages
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   857  =09=09 * in that ran=
ge can be associated with newer snapc.
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   858  =09=09 * They are no=
t writeable until we write all dirty pages
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   859  =09=09 * associated =
with 'snapc' get written */
>> 1582af2eaaf17c Yan, Zheng         2018-03-06   860  =09=09if (index > 0)
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   861  =09=09=09should_loop=
 =3D true;
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   862  =09=09dout(" non-hea=
d snapc, range whole\n");
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   863  =09}
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   864
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01   865  =09ceph_put_snap_con=
text(last_snapc);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   866  =09last_snapc =3D sn=
apc;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   867
>> af9cc401ce7452 Yan, Zheng         2018-03-04   868  =09while (!done && i=
ndex <=3D end) {
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   869  =09=09int num_ops =
=3D 0, op_idx;
>> 0e5ecac7168366 Yan, Zheng         2017-08-31   870  =09=09unsigned i, pv=
ec_pages, max_pages, locked_pages =3D 0;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   871  =09=09struct page **=
pages =3D NULL, **data_pages;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   872  =09=09struct page *p=
age;
>> 0e5ecac7168366 Yan, Zheng         2017-08-31   873  =09=09pgoff_t strip_=
unit_end =3D 0;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   874  =09=09u64 offset =3D=
 0, len =3D 0;
>> a0102bda5bc099 Jeff Layton        2020-07-30   875  =09=09bool from_pool=
 =3D false;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   876
>> 0e5ecac7168366 Yan, Zheng         2017-08-31   877  =09=09max_pages =3D =
wsize >> PAGE_SHIFT;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   878
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   879  get_more_pages:
>> 2e169296603470 Jeff Layton        2020-09-14   880  =09=09pvec_pages =3D=
 pagevec_lookup_range_tag(&pvec, mapping, &index,
>> 2e169296603470 Jeff Layton        2020-09-14   881  =09=09=09=09=09=09en=
d, PAGECACHE_TAG_DIRTY);
>> 0ed75fc8d288f4 Jan Kara           2017-11-15   882  =09=09dout("pagevec_=
lookup_range_tag got %d\n", pvec_pages);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   883  =09=09if (!pvec_page=
s && !locked_pages)
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   884  =09=09=09break;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   885  =09=09for (i =3D 0; =
i < pvec_pages && locked_pages < max_pages; i++) {
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   886  =09=09=09page =3D pv=
ec.pages[i];
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   887  =09=09=09dout("? %p =
idx %lu\n", page, page->index);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   888  =09=09=09if (locked_=
pages =3D=3D 0)
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   889  =09=09=09=09lock_pag=
e(page);  /* first page */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   890  =09=09=09else if (!t=
rylock_page(page))
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   891  =09=09=09=09break;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   892
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   893  =09=09=09/* only dir=
ty pages, or our accounting breaks */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   894  =09=09=09if (unlikel=
y(!PageDirty(page)) ||
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   895  =09=09=09    unlikel=
y(page->mapping !=3D mapping)) {
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   896  =09=09=09=09dout("!d=
irty or !mapping %p\n", page);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   897  =09=09=09=09unlock_p=
age(page);
>> 0713e5f24b7deb Yan, Zheng         2017-08-31   898  =09=09=09=09continue=
;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   899  =09=09=09}
>> af9cc401ce7452 Yan, Zheng         2018-03-04   900  =09=09=09/* only if =
matching snap context */
>> af9cc401ce7452 Yan, Zheng         2018-03-04   901  =09=09=09pgsnapc =3D=
 page_snap_context(page);
>> af9cc401ce7452 Yan, Zheng         2018-03-04   902  =09=09=09if (pgsnapc=
 !=3D snapc) {
>> af9cc401ce7452 Yan, Zheng         2018-03-04   903  =09=09=09=09dout("pa=
ge snapc %p %lld !=3D oldest %p %lld\n",
>> af9cc401ce7452 Yan, Zheng         2018-03-04   904  =09=09=09=09     pgs=
napc, pgsnapc->seq, snapc, snapc->seq);
>> 1582af2eaaf17c Yan, Zheng         2018-03-06   905  =09=09=09=09if (!sho=
uld_loop &&
>> 1582af2eaaf17c Yan, Zheng         2018-03-06   906  =09=09=09=09    !cep=
h_wbc.head_snapc &&
>> 1582af2eaaf17c Yan, Zheng         2018-03-06   907  =09=09=09=09    wbc-=
>sync_mode !=3D WB_SYNC_NONE)
>> 1582af2eaaf17c Yan, Zheng         2018-03-06   908  =09=09=09=09=09shoul=
d_loop =3D true;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   909  =09=09=09=09unlock_p=
age(page);
>> af9cc401ce7452 Yan, Zheng         2018-03-04   910  =09=09=09=09continue=
;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   911  =09=09=09}
>> 1f934b00e90752 Yan, Zheng         2017-08-30   912  =09=09=09if (page_of=
fset(page) >=3D ceph_wbc.i_size) {
>> 1f934b00e90752 Yan, Zheng         2017-08-30   913  =09=09=09=09dout("%p=
 page eof %llu\n",
>> 1f934b00e90752 Yan, Zheng         2017-08-30   914  =09=09=09=09     pag=
e, ceph_wbc.i_size);
>> c95f1c5f436bad Erqi Chen          2019-07-24   915  =09=09=09=09if ((cep=
h_wbc.size_stable ||
>> c95f1c5f436bad Erqi Chen          2019-07-24   916  =09=09=09=09    page=
_offset(page) >=3D i_size_read(inode)) &&
>> c95f1c5f436bad Erqi Chen          2019-07-24   917  =09=09=09=09    clea=
r_page_dirty_for_io(page))
>> af9cc401ce7452 Yan, Zheng         2018-03-04   918  =09=09=09=09=09mappi=
ng->a_ops->invalidatepage(page,
>> 8ff2d290c8ce77 Jeff Layton        2021-04-05   919  =09=09=09=09=09=09=
=09=090, thp_size(page));
>> af9cc401ce7452 Yan, Zheng         2018-03-04   920  =09=09=09=09unlock_p=
age(page);
>> af9cc401ce7452 Yan, Zheng         2018-03-04   921  =09=09=09=09continue=
;
>> af9cc401ce7452 Yan, Zheng         2018-03-04   922  =09=09=09}
>> af9cc401ce7452 Yan, Zheng         2018-03-04   923  =09=09=09if (strip_u=
nit_end && (page->index > strip_unit_end)) {
>> af9cc401ce7452 Yan, Zheng         2018-03-04   924  =09=09=09=09dout("en=
d of strip unit %p\n", page);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   925  =09=09=09=09unlock_p=
age(page);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   926  =09=09=09=09break;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   927  =09=09=09}
>> 1702e79734104d Jeff Layton        2021-12-07   928  =09=09=09if (PageWri=
teback(page) || PageFsCache(page)) {
>> 0713e5f24b7deb Yan, Zheng         2017-08-31   929  =09=09=09=09if (wbc-=
>sync_mode =3D=3D WB_SYNC_NONE) {
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   930  =09=09=09=09=09dout(=
"%p under writeback\n", page);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   931  =09=09=09=09=09unloc=
k_page(page);
>> 0713e5f24b7deb Yan, Zheng         2017-08-31   932  =09=09=09=09=09conti=
nue;
>> 0713e5f24b7deb Yan, Zheng         2017-08-31   933  =09=09=09=09}
>> 0713e5f24b7deb Yan, Zheng         2017-08-31   934  =09=09=09=09dout("wa=
iting on writeback %p\n", page);
>> 0713e5f24b7deb Yan, Zheng         2017-08-31   935  =09=09=09=09wait_on_=
page_writeback(page);
>> 1702e79734104d Jeff Layton        2021-12-07   936  =09=09=09=09wait_on_=
page_fscache(page);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   937  =09=09=09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   938
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   939  =09=09=09if (!clear_=
page_dirty_for_io(page)) {
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   940  =09=09=09=09dout("%p=
 !clear_page_dirty_for_io\n", page);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   941  =09=09=09=09unlock_p=
age(page);
>> 0713e5f24b7deb Yan, Zheng         2017-08-31   942  =09=09=09=09continue=
;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   943  =09=09=09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   944
>> e5975c7c8eb6ae Alex Elder         2013-03-14   945  =09=09=09/*
>> e5975c7c8eb6ae Alex Elder         2013-03-14   946  =09=09=09 * We have =
something to write.  If this is
>> e5975c7c8eb6ae Alex Elder         2013-03-14   947  =09=09=09 * the firs=
t locked page this time through,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   948  =09=09=09 * calculat=
e max possinle write size and
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   949  =09=09=09 * allocate=
 a page array
>> e5975c7c8eb6ae Alex Elder         2013-03-14   950  =09=09=09 */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   951  =09=09=09if (locked_=
pages =3D=3D 0) {
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   952  =09=09=09=09u64 objn=
um;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   953  =09=09=09=09u64 objo=
ff;
>> dccbf08005df80 Ilya Dryomov       2018-02-17   954  =09=09=09=09u32 xlen=
;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   955
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   956  =09=09=09=09/* prepa=
re async write request */
>> 6285bc23127741 Alex Elder         2012-10-02   957  =09=09=09=09offset =
=3D (u64)page_offset(page);
>> dccbf08005df80 Ilya Dryomov       2018-02-17   958  =09=09=09=09ceph_cal=
c_file_object_mapping(&ci->i_layout,
>> dccbf08005df80 Ilya Dryomov       2018-02-17   959  =09=09=09=09=09=09=
=09      offset, wsize,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   960  =09=09=09=09=09=09=
=09      &objnum, &objoff,
>> dccbf08005df80 Ilya Dryomov       2018-02-17   961  =09=09=09=09=09=09=
=09      &xlen);
>> dccbf08005df80 Ilya Dryomov       2018-02-17   962  =09=09=09=09len =3D =
xlen;
>> 8c71897be2ddfd Henry C Chang      2011-05-03   963
>> 3fb99d483e614b Yanhu Cao          2017-07-21   964  =09=09=09=09num_ops =
=3D 1;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   965  =09=09=09=09strip_un=
it_end =3D page->index +
>> 09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01   966  =09=09=09=09=09((len=
 - 1) >> PAGE_SHIFT);
>> 88486957f9fbf5 Alex Elder         2013-03-14   967
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   968  =09=09=09=09BUG_ON(p=
ages);
>> 88486957f9fbf5 Alex Elder         2013-03-14   969  =09=09=09=09max_page=
s =3D calc_pages_for(0, (u64)len);
>> 6da2ec56059c3c Kees Cook          2018-06-12   970  =09=09=09=09pages =
=3D kmalloc_array(max_pages,
>> 6da2ec56059c3c Kees Cook          2018-06-12   971  =09=09=09=09=09=09  =
    sizeof(*pages),
>> fc2744aa12da71 Yan, Zheng         2013-05-31   972  =09=09=09=09=09=09  =
    GFP_NOFS);
>> 88486957f9fbf5 Alex Elder         2013-03-14   973  =09=09=09=09if (!pag=
es) {
>> a0102bda5bc099 Jeff Layton        2020-07-30   974  =09=09=09=09=09from_=
pool =3D true;
>> a0102bda5bc099 Jeff Layton        2020-07-30   975  =09=09=09=09=09pages=
 =3D mempool_alloc(ceph_wb_pagevec_pool, GFP_NOFS);
>> e5975c7c8eb6ae Alex Elder         2013-03-14   976  =09=09=09=09=09BUG_O=
N(!pages);
>> 88486957f9fbf5 Alex Elder         2013-03-14   977  =09=09=09=09}
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   978
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   979  =09=09=09=09len =3D =
0;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   980  =09=09=09} else if (=
page->index !=3D
>> 09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01   981  =09=09=09=09   (offs=
et + len) >> PAGE_SHIFT) {
>> a0102bda5bc099 Jeff Layton        2020-07-30   982  =09=09=09=09if (num_=
ops >=3D (from_pool ?  CEPH_OSD_SLAB_OPS :
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   983  =09=09=09=09=09=09=
=09     CEPH_OSD_MAX_OPS)) {
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   984  =09=09=09=09=09redir=
ty_page_for_writepage(wbc, page);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   985  =09=09=09=09=09unloc=
k_page(page);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   986  =09=09=09=09=09break=
;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   987  =09=09=09=09}
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   988
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   989  =09=09=09=09num_ops+=
+;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   990  =09=09=09=09offset =
=3D (u64)page_offset(page);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   991  =09=09=09=09len =3D =
0;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   992  =09=09=09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   993
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   994  =09=09=09/* note pos=
ition of first page in pvec */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   995  =09=09=09dout("%p wi=
ll write page %p idx %lu\n",
>> 1d3576fd10f0d7 Sage Weil          2009-10-06   996  =09=09=09     inode,=
 page, page->index);
>> 2baba25019ec56 Yehuda Sadeh       2009-12-18   997
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   998  =09=09=09if (atomic_=
long_inc_return(&fsc->writeback_count) >
>> 5b64640cf65be4 Yan, Zheng         2016-01-07   999  =09=09=09    CONGEST=
ION_ON_THRESH(
>> 3d14c5d2b6e15c Yehuda Sadeh       2010-04-06  1000  =09=09=09=09    fsc-=
>mount_options->congestion_kb)) {
>> 09dc9fc24ba714 Jan Kara           2017-04-12  1001  =09=09=09=09set_bdi_=
congested(inode_to_bdi(inode),
>> 213c99ee0cf17f Sage Weil          2010-08-03  1002  =09=09=09=09=09=09  =
BLK_RW_ASYNC);
>> 2baba25019ec56 Yehuda Sadeh       2009-12-18  1003  =09=09=09}
>> 2baba25019ec56 Yehuda Sadeh       2009-12-18  1004
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1005
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1006  =09=09=09pages[locke=
d_pages++] =3D page;
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1007  =09=09=09pvec.pages[=
i] =3D NULL;
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1008
>> 8ff2d290c8ce77 Jeff Layton        2021-04-05  1009  =09=09=09len +=3D th=
p_size(page);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1010  =09=09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1011
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1012  =09=09/* did we get =
anything? */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1013  =09=09if (!locked_pa=
ges)
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1014  =09=09=09goto releas=
e_pvec_pages;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1015  =09=09if (i) {
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1016  =09=09=09unsigned j,=
 n =3D 0;
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1017  =09=09=09/* shift un=
used page to beginning of pvec */
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1018  =09=09=09for (j =3D =
0; j < pvec_pages; j++) {
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1019  =09=09=09=09if (!pve=
c.pages[j])
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1020  =09=09=09=09=09conti=
nue;
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1021  =09=09=09=09if (n < =
j)
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1022  =09=09=09=09=09pvec.=
pages[n] =3D pvec.pages[j];
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1023  =09=09=09=09n++;
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1024  =09=09=09}
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1025  =09=09=09pvec.nr =3D=
 n;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1026
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1027  =09=09=09if (pvec_pa=
ges && i =3D=3D pvec_pages &&
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1028  =09=09=09    locked_=
pages < max_pages) {
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1029  =09=09=09=09dout("re=
ached end pvec, trying for more\n");
>> 0713e5f24b7deb Yan, Zheng         2017-08-31  1030  =09=09=09=09pagevec_=
release(&pvec);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1031  =09=09=09=09goto get=
_more_pages;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1032  =09=09=09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1033  =09=09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1034
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1035  new_request:
>> e5975c7c8eb6ae Alex Elder         2013-03-14  1036  =09=09offset =3D pag=
e_offset(pages[0]);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1037  =09=09len =3D wsize;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1038
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1039  =09=09req =3D ceph_o=
sdc_new_request(&fsc->client->osdc,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1040  =09=09=09=09=09&ci->=
i_layout, vino,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1041  =09=09=09=09=09offse=
t, &len, 0, num_ops,
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1042  =09=09=09=09=09CEPH_=
OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE,
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1043  =09=09=09=09=09snapc=
, ceph_wbc.truncate_seq,
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1044  =09=09=09=09=09ceph_=
wbc.truncate_size, false);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1045  =09=09if (IS_ERR(req=
)) {
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1046  =09=09=09req =3D cep=
h_osdc_new_request(&fsc->client->osdc,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1047  =09=09=09=09=09=09&c=
i->i_layout, vino,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1048  =09=09=09=09=09=09of=
fset, &len, 0,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1049  =09=09=09=09=09=09mi=
n(num_ops,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1050  =09=09=09=09=09=09  =
  CEPH_OSD_SLAB_OPS),
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1051  =09=09=09=09=09=09CE=
PH_OSD_OP_WRITE,
>> 54ea0046b6fe36 Ilya Dryomov       2017-02-11  1052  =09=09=09=09=09=09CE=
PH_OSD_FLAG_WRITE,
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1053  =09=09=09=09=09=09sn=
apc, ceph_wbc.truncate_seq,
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1054  =09=09=09=09=09=09ce=
ph_wbc.truncate_size, true);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1055  =09=09=09BUG_ON(IS_E=
RR(req));
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1056  =09=09}
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1057  =09=09BUG_ON(len < p=
age_offset(pages[locked_pages - 1]) +
>> 8ff2d290c8ce77 Jeff Layton        2021-04-05  1058  =09=09=09     thp_si=
ze(page) - offset);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1059
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1060  =09=09req->r_callbac=
k =3D writepages_finish;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1061  =09=09req->r_inode =
=3D inode;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1062
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1063  =09=09/* Format the =
osd request message and submit the write */
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1064  =09=09len =3D 0;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1065  =09=09data_pages =3D=
 pages;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1066  =09=09op_idx =3D 0;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1067  =09=09for (i =3D 0; =
i < locked_pages; i++) {
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1068  =09=09=09u64 cur_off=
set =3D page_offset(pages[i]);
>> 1702e79734104d Jeff Layton        2021-12-07  1069  =09=09=09/*
>> 1702e79734104d Jeff Layton        2021-12-07  1070  =09=09=09 * Disconti=
nuity in page range? Ceph can handle that by just passing
>> 1702e79734104d Jeff Layton        2021-12-07  1071  =09=09=09 * multiple=
 extents in the write op.
>> 1702e79734104d Jeff Layton        2021-12-07  1072  =09=09=09 */
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1073  =09=09=09if (offset =
+ len !=3D cur_offset) {
>> 1702e79734104d Jeff Layton        2021-12-07  1074  =09=09=09=09/* If it=
's full, stop here */
>> 3fb99d483e614b Yanhu Cao          2017-07-21  1075  =09=09=09=09if (op_i=
dx + 1 =3D=3D req->r_num_ops)
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1076  =09=09=09=09=09break=
;
>> 1702e79734104d Jeff Layton        2021-12-07  1077
>> 1702e79734104d Jeff Layton        2021-12-07  1078  =09=09=09=09/* Kick =
off an fscache write with what we have so far. */
>> 1702e79734104d Jeff Layton        2021-12-07  1079  =09=09=09=09ceph_fsc=
ache_write_to_cache(inode, offset, len, caching);
>> 1702e79734104d Jeff Layton        2021-12-07  1080
>> 1702e79734104d Jeff Layton        2021-12-07  1081  =09=09=09=09/* Start=
 a new extent */
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1082  =09=09=09=09osd_req_=
op_extent_dup_last(req, op_idx,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1083  =09=09=09=09=09=09=
=09   cur_offset - offset);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1084  =09=09=09=09dout("wr=
itepages got pages at %llu~%llu\n",
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1085  =09=09=09=09     off=
set, len);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1086  =09=09=09=09osd_req_=
op_extent_osd_data_pages(req, op_idx,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1087  =09=09=09=09=09=09=
=09data_pages, len, 0,
>> a0102bda5bc099 Jeff Layton        2020-07-30  1088  =09=09=09=09=09=09=
=09from_pool, false);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1089  =09=09=09=09osd_req_=
op_extent_update(req, op_idx, len);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1090
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1091  =09=09=09=09len =3D =
0;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1092  =09=09=09=09offset =
=3D cur_offset;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1093  =09=09=09=09data_pag=
es =3D pages + i;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1094  =09=09=09=09op_idx++=
;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1095  =09=09=09}
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1096
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1097  =09=09=09set_page_wr=
iteback(pages[i]);
>> 1702e79734104d Jeff Layton        2021-12-07  1098  =09=09=09if (caching=
)
>> 1702e79734104d Jeff Layton        2021-12-07  1099  =09=09=09=09ceph_set=
_page_fscache(pages[i]);
>> 8ff2d290c8ce77 Jeff Layton        2021-04-05  1100  =09=09=09len +=3D th=
p_size(page);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1101  =09=09}
>> 1702e79734104d Jeff Layton        2021-12-07  1102  =09=09ceph_fscache_w=
rite_to_cache(inode, offset, len, caching);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1103
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1104  =09=09if (ceph_wbc.s=
ize_stable) {
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1105  =09=09=09len =3D min=
(len, ceph_wbc.i_size - offset);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1106  =09=09} else if (i =
=3D=3D locked_pages) {
>> e1966b49446a43 Yan, Zheng         2015-06-18  1107  =09=09=09/* writepag=
es_finish() clears writeback pages
>> e1966b49446a43 Yan, Zheng         2015-06-18  1108  =09=09=09 * accordin=
g to the data length, so make sure
>> e1966b49446a43 Yan, Zheng         2015-06-18  1109  =09=09=09 * data len=
gth covers all locked pages */
>> 8ff2d290c8ce77 Jeff Layton        2021-04-05  1110  =09=09=09u64 min_len=
 =3D len + 1 - thp_size(page);
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1111  =09=09=09len =3D get=
_writepages_data_length(inode, pages[i - 1],
>> 1f934b00e90752 Yan, Zheng         2017-08-30  1112  =09=09=09=09=09=09=
=09 offset);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1113  =09=09=09len =3D max=
(len, min_len);
>> e1966b49446a43 Yan, Zheng         2015-06-18  1114  =09=09}
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1115  =09=09dout("writepag=
es got pages at %llu~%llu\n", offset, len);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1116
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1117  =09=09osd_req_op_ext=
ent_osd_data_pages(req, op_idx, data_pages, len,
>> a0102bda5bc099 Jeff Layton        2020-07-30  1118  =09=09=09=09=09=09 0=
, from_pool, false);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1119  =09=09osd_req_op_ext=
ent_update(req, op_idx, len);
>> e5975c7c8eb6ae Alex Elder         2013-03-14  1120
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1121  =09=09BUG_ON(op_idx =
+ 1 !=3D req->r_num_ops);
>> e5975c7c8eb6ae Alex Elder         2013-03-14  1122
>> a0102bda5bc099 Jeff Layton        2020-07-30  1123  =09=09from_pool =3D =
false;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1124  =09=09if (i < locked=
_pages) {
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1125  =09=09=09BUG_ON(num_=
ops <=3D req->r_num_ops);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1126  =09=09=09num_ops -=
=3D req->r_num_ops;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1127  =09=09=09locked_page=
s -=3D i;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1128
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1129  =09=09=09/* allocate=
 new pages array for next request */
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1130  =09=09=09data_pages =
=3D pages;
>> 6da2ec56059c3c Kees Cook          2018-06-12  1131  =09=09=09pages =3D k=
malloc_array(locked_pages, sizeof(*pages),
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1132  =09=09=09=09=09     =
 GFP_NOFS);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1133  =09=09=09if (!pages)=
 {
>> a0102bda5bc099 Jeff Layton        2020-07-30  1134  =09=09=09=09from_poo=
l =3D true;
>> a0102bda5bc099 Jeff Layton        2020-07-30  1135  =09=09=09=09pages =
=3D mempool_alloc(ceph_wb_pagevec_pool, GFP_NOFS);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1136  =09=09=09=09BUG_ON(!=
pages);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1137  =09=09=09}
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1138  =09=09=09memcpy(page=
s, data_pages + i,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1139  =09=09=09       lock=
ed_pages * sizeof(*pages));
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1140  =09=09=09memset(data=
_pages + i, 0,
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1141  =09=09=09       lock=
ed_pages * sizeof(*pages));
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1142  =09=09} else {
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1143  =09=09=09BUG_ON(num_=
ops !=3D req->r_num_ops);
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1144  =09=09=09index =3D p=
ages[i - 1]->index + 1;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1145  =09=09=09/* request =
message now owns the pages array */
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1146  =09=09=09pages =3D N=
ULL;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1147  =09=09}
>> e5975c7c8eb6ae Alex Elder         2013-03-14  1148
>> fac02ddf910814 Arnd Bergmann      2018-07-13  1149  =09=09req->r_mtime =
=3D inode->i_mtime;
>> 9d6fcb081a4770 Sage Weil          2011-05-12  1150  =09=09rc =3D ceph_os=
dc_start_request(&fsc->client->osdc, req, true);
>> 9d6fcb081a4770 Sage Weil          2011-05-12  1151  =09=09BUG_ON(rc);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1152  =09=09req =3D NULL;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1153
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1154  =09=09wbc->nr_to_wri=
te -=3D i;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1155  =09=09if (pages)
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1156  =09=09=09goto new_re=
quest;
>> 5b64640cf65be4 Yan, Zheng         2016-01-07  1157
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1158  =09=09/*
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1159  =09=09 * We stop wri=
ting back only if we are not doing
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1160  =09=09 * integrity s=
ync. In case of integrity sync we have to
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1161  =09=09 * keep going =
until we have written all the pages
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1162  =09=09 * we tagged f=
or writeback prior to entering this loop.
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1163  =09=09 */
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1164  =09=09if (wbc->nr_to=
_write <=3D 0 && wbc->sync_mode =3D=3D WB_SYNC_NONE)
>> af9cc401ce7452 Yan, Zheng         2018-03-04  1165  =09=09=09done =3D tr=
ue;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1166
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1167  release_pvec_pages:
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1168  =09=09dout("pagevec_=
release on %d pages (%p)\n", (int)pvec.nr,
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1169  =09=09     pvec.nr ?=
 pvec.pages[0] : NULL);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1170  =09=09pagevec_releas=
e(&pvec);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1171  =09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1172
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1173  =09if (should_loop &=
& !done) {
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1174  =09=09/* more to do;=
 loop back to beginning of file */
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1175  =09=09dout("writepag=
es looping back to beginning of file\n");
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1176  =09=09end =3D start_=
index - 1; /* OK even when start_index =3D=3D 0 */
>> f275635ee0b664 Yan, Zheng         2017-09-01  1177
>> f275635ee0b664 Yan, Zheng         2017-09-01  1178  =09=09/* to write di=
rty pages associated with next snapc,
>> f275635ee0b664 Yan, Zheng         2017-09-01  1179  =09=09 * we need to =
wait until current writes complete */
>> f275635ee0b664 Yan, Zheng         2017-09-01  1180  =09=09if (wbc->sync_=
mode !=3D WB_SYNC_NONE &&
>> f275635ee0b664 Yan, Zheng         2017-09-01  1181  =09=09    start_inde=
x =3D=3D 0 && /* all dirty pages were checked */
>> f275635ee0b664 Yan, Zheng         2017-09-01  1182  =09=09    !ceph_wbc.=
head_snapc) {
>> f275635ee0b664 Yan, Zheng         2017-09-01  1183  =09=09=09struct page=
 *page;
>> f275635ee0b664 Yan, Zheng         2017-09-01  1184  =09=09=09unsigned i,=
 nr;
>> f275635ee0b664 Yan, Zheng         2017-09-01  1185  =09=09=09index =3D 0=
;
>> f275635ee0b664 Yan, Zheng         2017-09-01  1186  =09=09=09while ((ind=
ex <=3D end) &&
>> f275635ee0b664 Yan, Zheng         2017-09-01  1187  =09=09=09       (nr =
=3D pagevec_lookup_tag(&pvec, mapping, &index,
>> 67fd707f468142 Jan Kara           2017-11-15  1188  =09=09=09=09=09=09PA=
GECACHE_TAG_WRITEBACK))) {
>> f275635ee0b664 Yan, Zheng         2017-09-01  1189  =09=09=09=09for (i =
=3D 0; i < nr; i++) {
>> f275635ee0b664 Yan, Zheng         2017-09-01  1190  =09=09=09=09=09page =
=3D pvec.pages[i];
>> f275635ee0b664 Yan, Zheng         2017-09-01  1191  =09=09=09=09=09if (p=
age_snap_context(page) !=3D snapc)
>> f275635ee0b664 Yan, Zheng         2017-09-01  1192  =09=09=09=09=09=09co=
ntinue;
>> f275635ee0b664 Yan, Zheng         2017-09-01  1193  =09=09=09=09=09wait_=
on_page_writeback(page);
>> f275635ee0b664 Yan, Zheng         2017-09-01  1194  =09=09=09=09}
>> f275635ee0b664 Yan, Zheng         2017-09-01  1195  =09=09=09=09pagevec_=
release(&pvec);
>> f275635ee0b664 Yan, Zheng         2017-09-01  1196  =09=09=09=09cond_res=
ched();
>> f275635ee0b664 Yan, Zheng         2017-09-01  1197  =09=09=09}
>> f275635ee0b664 Yan, Zheng         2017-09-01  1198  =09=09}
>> f275635ee0b664 Yan, Zheng         2017-09-01  1199
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1200  =09=09start_index =
=3D 0;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1201  =09=09index =3D 0;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1202  =09=09goto retry;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1203  =09}
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1204
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1205  =09if (wbc->range_cy=
clic || (range_whole && wbc->nr_to_write > 0))
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1206  =09=09mapping->write=
back_index =3D index;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1207
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1208  out:
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1209  =09ceph_osdc_put_req=
uest(req);
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1210  =09ceph_put_snap_con=
text(last_snapc);
>> 2a2d927e35dd8d Yan, Zheng         2017-09-01  1211  =09dout("writepages =
dend - startone, rc =3D %d\n", rc);
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1212  =09return rc;
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1213  }
>> 1d3576fd10f0d7 Sage Weil          2009-10-06  1214
>>
>> :::::: The code at line 788 was first introduced by commit
>> :::::: 1d3576fd10f0d7a104204267b81cf84a07028dad ceph: address space oper=
ations
>>
>> :::::: TO: Sage Weil <sage@newdream.net>
>> :::::: CC: Sage Weil <sage@newdream.net>
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

