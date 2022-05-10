Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360823B7
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 06:18:30 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d22so15859206plr.9
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 23:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xq7XvBCbmw8HPlQEPR058TJmCcUUbtMzbjoLGwh0Bxs=;
        b=KSp7v7ZrmUZ/qxs1SD7Cw6JFhGnrMWyuMzxrL+IcLLUqsBTRKW5hgFVtT4vlF6DxF8
         nG6Opi33oIHg48t3VitJWNruOQw7sHxR9A7ddbanAxajZU8xVtCQlC4+P8H3U6Iw0nOr
         FybrNjEhWgAKy6PiVnoDkKxBzDGxfcpNWejwNd40xrbhucMxCrsH5gjIKoIuShSgG9Lt
         hAQnS/eSlu33FyWk+O3ZtvDqcF6k+Bp6EmUnNS3aGdlxMG8pHzTnpT1D/R+hm8DbiXWH
         BlgFyNwCgeZ993Rb8/RGamxloWB6pU+hZpZbfV6Za8ECMT+DGtIAcpPrOEtj5V1tzi8G
         U0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xq7XvBCbmw8HPlQEPR058TJmCcUUbtMzbjoLGwh0Bxs=;
        b=2rG4rRAovnLaqfWPwT6VJA7UrGIF1kuVRrHRieCyMw/imUZ8mbZTLMdZPU1W12StCM
         wNsEkucYpkCrUo3sD8Jk34+X7dQBuXPgO4hI6ADKedwdx9Xb6+4Gg4+S4pjYo7qE1mNR
         8OJe26zTSZLYwFVnyCEUPGkWcMEAvJlwld6uio37aYzlOhu2nFSwAUF36MkohmQgZZ+o
         8IC+0cYE5PksDZiTpiHxsyhlnk2eCHFYV2ORdNqImy413rzAAfd7WHQSCs7/H6ecOCaH
         wrMEzqDlGmIfj00N72teT28MObWhNr9S4DvDaxI33UX+zQ1cZ5bzGcIEnbV7oZg+WzFy
         F9tw==
X-Gm-Message-State: AOAM531YHchbIjFg5agSgfvLc3LhbtkqiH2dPfa4Aqekn70u57ulh/eC
	cCBjmGBRYGt0QxIbMJBVfYanxw==
X-Google-Smtp-Source: ABdhPJytd9g+tMHVqY+h/nzEmxskN6Ae07Au2eklyzYLluwDsfzzQ02SJuwiOSHtgubO1UL0W9rW9w==
X-Received: by 2002:a17:902:9b93:b0:15f:17ce:3b97 with SMTP id y19-20020a1709029b9300b0015f17ce3b97mr6303757plp.174.1652163509456;
        Mon, 09 May 2022 23:18:29 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:9543:36e:1e36:a909])
        by smtp.gmail.com with ESMTPSA id y15-20020a1709029b8f00b0015e8d4eb25dsm1012905plp.167.2022.05.09.23.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 23:18:28 -0700 (PDT)
Date: Mon, 9 May 2022 23:18:25 -0700
From: Fangrui Song <maskray@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sathvika Vasireddy <sv@linux.ibm.com>,
	Russell Currey <ruscur@russell.cc>,
	"Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
Message-ID: <20220510061825.yuaip52umxcabknr@google.com>
References: <20220429064547.2334280-1-aik@ozlabs.ru>
 <CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com>
 <efe4ec7b-e1ec-84fc-cc49-7e22597ff417@ozlabs.ru>
 <de7ae055-8cbb-1fd3-e1d7-93f51c2d3f4b@ozlabs.ru>
 <YnlYemdzBDCobK/d@dev-arch.thelio-3990X>
 <CAKwvOdk_wNfo1GA1MsOehTuTpBQqNi3xhHHyLmkpyTr0wPj1Tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOdk_wNfo1GA1MsOehTuTpBQqNi3xhHHyLmkpyTr0wPj1Tg@mail.gmail.com>

On 2022-05-09, Nick Desaulniers wrote:
>On Mon, May 9, 2022 at 11:08 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> Hi Alexey,
>>
>> On Mon, May 09, 2022 at 05:42:59PM +1000, Alexey Kardashevskiy wrote:
>> >
>> >
>> > On 5/9/22 15:18, Alexey Kardashevskiy wrote:
>> > >
>> > >
>> > > On 5/4/22 07:21, Nick Desaulniers wrote:
>> > > > On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy
>> > > > <aik@ozlabs.ru> wrote:
>> > > > >
>> > > > > This enables LTO_CLANG builds on POWER with the upstream version of
>> > > > > LLVM.
>> > > > >
>> > > > > LTO optimizes the output vmlinux binary and this may affect the FTP
>> > > > > alternative section if alt branches use "bc" (Branch Conditional) which
>> > > > > is limited by 16 bit offsets. This shows up in errors like:
>> > > > >
>> > > > > ld.lld: error: InputSection too large for range extension thunk
>> > > > > vmlinux.o:(__ftr_alt_97+0xF0)
>> > > > >
>> > > > > This works around the issue by replacing "bc" in FTR_SECTION_ELSE with
>> > > > > "b" which allows 26 bit offsets.
>> > > > >
>> > > > > This catches the problem instructions in vmlinux.o before it LTO'ed:
>> > > > >
>> > > > > $ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
>> > > > >    30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
>> > > > >    f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>
>> > > > >
>> > > > > This allows LTO builds for ppc64le_defconfig plus LTO options.
>> > > > > Note that DYNAMIC_FTRACE/FUNCTION_TRACER is not supported by LTO builds
>> > > > > but this is not POWERPC-specific.
>> > > >
>> > > > $ ARCH=powerpc make LLVM=1 -j72 ppc64le_defconfig
>> > > > $ ARCH=powerpc make LLVM=1 -j72 menuconfig
>> > > > <disable FTRACE, enable LTO_CLANG_THIN>
>> > > > $ ARCH=powerpc make LLVM=1 -j72
>> > > > ...
>> > > >    VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
>> > > > /usr/bin/powerpc64le-linux-gnu-ld:
>> > > > /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: error
>> > > > loading plugin:
>> > > > /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: cannot open
>> > > > shared object file: No such file or directory
>> > > > clang-15: error: linker command failed with exit code 1 (use -v to see
>> > > > invocation)
>> > > > make[1]: *** [arch/powerpc/kernel/vdso/Makefile:67:
>> > > > arch/powerpc/kernel/vdso/vdso64.so.dbg] Error 1
>> > > >
>> > > > Looks like LLD isn't being invoked correctly to link the vdso.
>> > > > Probably need to revisit
>> > > > https://lore.kernel.org/lkml/20200901222523.1941988-1-ndesaulniers@google.com/
>> > > >
>> > > > How were you working around this issue? Perhaps you built clang to
>> > > > default to LLD? (there's a cmake option for that)
>> > >
>> > >
>> > > What option is that? I only add  -DLLVM_ENABLE_LLD=ON  which (I think)
>>
>> The option Nick is referring to here is CLANG_DEFAULT_LINKER, which sets
>> the default linker when clang is invoked as the linker driver, which the
>> PowerPC vDSO Makefile does. We have been trying to move all parts of the
>> kernel to compile with $(CC) and link with $(LD) so that the default
>> linker invoked by the compiler is taken out of the equation.
>>
>> For what it's worth, I think that the error Nick is seeing is due to a
>> lack of the LLVMgold.so plugin on his system, which is built when
>> -DLLVM_BINUTILS_INCDIR=... is included in the list of CMake variables,
>> which you have. The LLVMgold.so plugin is needed when doing LTO with
>> GNU ld, which is the case with the vDSO currently for the reason I
>> mentioned above. We could work around this with Nick's proposed
>> '-fuse-ld=lld' patch or just disable LTO for the vDSO.
>>
>> https://llvm.org/docs/GoldPlugin.html
>
>Ah, and ld.gold is currently banned by
>commit 75959d44f9dc ("kbuild: Fail if gold linker is detected")
>which landed in v5.4-rc1. So the ppc vdso build isn't quite as
>hermetic as we'd like.
>
>>
>> My version of the hack would probably be:
>>
>> ccflags-$(CONFIG_LD_IS_LLD) += -fuse-ld=lld
>> asflags-$(CONFIG_LD_IS_LLD) += -fuse-ld=lld
>
>LGTM; want to send that as a formal patch? That would also address
>https://github.com/ClangBuiltLinux/linux/issues/774.
>
>>
>> > > tells cmake to use lld to link the LLVM being built but does not seem to
>> > > tell what the built clang should do.
>>
>> Right, -DLLVM_ENABLE_LLD=ON is equivalent to -DLLVM_USE_LINKER=lld,
>> except when doing a multi-stage build:
>>
>> https://llvm.org/docs/CMake.html#llvm-related-variables
>>
>> > >
>> > > Without -DLLVM_ENABLE_LLD=ON, building just fails:
>> > >
>> > > [fstn1-p1 ~/pbuild/llvm/llvm-lto-latest-cleanbuild]$ ninja -j 100
>> > > [619/3501] Linking CXX executable bin/not
>> > > FAILED: bin/not
>> > > : && /usr/bin/clang++ -fPIC -fvisibility-inlines-hidden
>> > > -Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra
>> > > -Wno-unused-parameter -Wwrite-strings -Wcast-qual
>> > > -Wmissing-field-initializers -pedantic -Wno-long-long
>> > > -Wc++98-compat-extra-semi -Wimplicit-fallthrough
>> > > -Wcovered-switch-default -Wno-noexcept-type -Wnon-virtual-dtor
>> > > -Wdelete-non-virtual-dtor -Wsuggest-override -Wstring-conversion
>> > > -Wmisleading-indentation -fdiagnostics-color -ffunction-sections
>> > > -fdata-sections -flto -O3 -DNDEBUG -flto
>> > > -Wl,-rpath-link,/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/./lib
>> > > -Wl,--gc-sections utils/not/CMakeFiles/not.dir/not.cpp.o -o bin/not
>> > > -Wl,-rpath,"\$ORIGIN/../lib"  -lpthread  lib/libLLVMSupport.a  -lrt
>> > > -ldl  -lpthread  -lm  /usr/lib/powerpc64le-linux-gnu/libz.so
>> > > /usr/lib/powerpc64le-linux-gnu/libtinfo.so  lib/libLLVMDemangle.a && :
>> > > /usr/bin/ld: lib/libLLVMSupport.a: error adding symbols: archive has no
>> > > index; run ranlib to add one
>
>Sounds like a bug with llvm cmake on ppc hosts.
>
>The other error about
>
>> /usr/bin/ld: lib/libLLVMObject.a: error adding symbols: file format not
>recognized
>
>Is likely because GNU ld doesn't recognize LLVM IR, which is what's
>passed to the linker when you build LLVM itself with LTO via
>`-DLLVM_ENABLE_LTO=ON`.

GNU ld needs -plugin path/to/LLVMgold.so to recognize LLVM bitcode files.
As discussed, LLVMgold.so is not specified...

`error adding symbols: archive has no index` indicates another problem.
An archive needs to be built with llvm-ar or `ar -plugin path/to/LLVMgold.so`
to include LLVM IR symbols in the archive symbol table. ld.lld < 14.0.0
does not support such archives.
See https://maskray.me/blog/2022-01-16-archives-and-start-lib#thin-archives-without-a-symbol-table

While named LLVMgold.so, the plugin supports all of gold, ld.bfd, ar, and ranlib.
