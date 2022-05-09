Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0F46A9
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 07:43:06 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id x18so13090102plg.6
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 00:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=ehuXX1FBMkXSxSIO1nrsalxMQ5cS613ljbe6bhV7rSM=;
        b=KZ5PzAABnM7rZuNaEf3eccRR5cnr2G94ZV1XwtYplLCKyR7Q59KUGxguJ34iH486OD
         HEDUAM2ilO8WK9tEaa1ANMzauRzjKj0RbCNHtZ0SYoraprpNC2WD3MtEQzQtQYHeVt4m
         rMwT1Xue9YNWdTLjZQvLgNkFguieLN4YXPTP2v3BcKltwIAO9LlDInW7XG93PR4zzILt
         CaM3xTwlATa+Kn9xRkIa6l8+V7BugxU0TdpJUetZsBK8+g1TKI6xOcmhu6+5agvM4he3
         Kemu/c/+dpU1Rouv4Fp1Mg3Db9qmgMWsE0LkgjZyx9ukdGGN7uDy2pVFuoR7H5aBX5xw
         MtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=ehuXX1FBMkXSxSIO1nrsalxMQ5cS613ljbe6bhV7rSM=;
        b=0MSv0Pa+zVw1c0CIljodaNhhFO3NKvuRJVPgPOvxa9JeSXIRKHx7bJD8r3bmzXFwm5
         el9k91iMRm58K5bGlz/VSySCqILuURzRrPUuTCckIDsRCMgs0soQnvfUoNhIkVnpD1WX
         kRlaeRR9I2U7euMBCbVbHge3FOi4K3N7mvDeJe5sW/5VGqAJ17k4xcVcxfVgZfYzK3T2
         eNKU6Hq1tA1rnL+tTuydCUMsCn4UybysPBvJQp1eNO2NbGRr2GqOiQo3/aYJJJWnLsW0
         b4THRw1KTnQihSLS7Dot7DAQ/TBzcxaIYkdOqaMx8NqoC9cpjKetFJKa7GB2fou5/zwo
         MWnA==
X-Gm-Message-State: AOAM531hqF2Hq6PqYUOCgWd2ZiD7q8v6ruyurNMCbrUShAwbozcKooTn
	lnupW9NTYhmTUM4rI5FWsf2lKw==
X-Google-Smtp-Source: ABdhPJwMgzoh3Y2fXnk2/wstyuVnsZF2oNgkzIUibycLookoAo0VhhE5CajSIyQyjfIXih4W8ze5qQ==
X-Received: by 2002:a17:90b:1d10:b0:1dc:dea8:d2ad with SMTP id on16-20020a17090b1d1000b001dcdea8d2admr15400232pjb.174.1652082185680;
        Mon, 09 May 2022 00:43:05 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id c80-20020a621c53000000b0050dc7628132sm8161048pfc.12.2022.05.09.00.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 00:43:05 -0700 (PDT)
Message-ID: <de7ae055-8cbb-1fd3-e1d7-93f51c2d3f4b@ozlabs.ru>
Date: Mon, 9 May 2022 17:42:59 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Sathvika Vasireddy
 <sv@linux.ibm.com>, Russell Currey <ruscur@russell.cc>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>
References: <20220429064547.2334280-1-aik@ozlabs.ru>
 <CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com>
 <efe4ec7b-e1ec-84fc-cc49-7e22597ff417@ozlabs.ru>
In-Reply-To: <efe4ec7b-e1ec-84fc-cc49-7e22597ff417@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/9/22 15:18, Alexey Kardashevskiy wrote:
> 
> 
> On 5/4/22 07:21, Nick Desaulniers wrote:
>> On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy <aik@ozlabs.ru> 
>> wrote:
>>>
>>> This enables LTO_CLANG builds on POWER with the upstream version of
>>> LLVM.
>>>
>>> LTO optimizes the output vmlinux binary and this may affect the FTP
>>> alternative section if alt branches use "bc" (Branch Conditional) which
>>> is limited by 16 bit offsets. This shows up in errors like:
>>>
>>> ld.lld: error: InputSection too large for range extension thunk 
>>> vmlinux.o:(__ftr_alt_97+0xF0)
>>>
>>> This works around the issue by replacing "bc" in FTR_SECTION_ELSE with
>>> "b" which allows 26 bit offsets.
>>>
>>> This catches the problem instructions in vmlinux.o before it LTO'ed:
>>>
>>> $ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
>>>    30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
>>>    f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>
>>>
>>> This allows LTO builds for ppc64le_defconfig plus LTO options.
>>> Note that DYNAMIC_FTRACE/FUNCTION_TRACER is not supported by LTO builds
>>> but this is not POWERPC-specific.
>>
>> $ ARCH=powerpc make LLVM=1 -j72 ppc64le_defconfig
>> $ ARCH=powerpc make LLVM=1 -j72 menuconfig
>> <disable FTRACE, enable LTO_CLANG_THIN>
>> $ ARCH=powerpc make LLVM=1 -j72
>> ...
>>    VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
>> /usr/bin/powerpc64le-linux-gnu-ld:
>> /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: error
>> loading plugin:
>> /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: cannot open
>> shared object file: No such file or directory
>> clang-15: error: linker command failed with exit code 1 (use -v to see
>> invocation)
>> make[1]: *** [arch/powerpc/kernel/vdso/Makefile:67:
>> arch/powerpc/kernel/vdso/vdso64.so.dbg] Error 1
>>
>> Looks like LLD isn't being invoked correctly to link the vdso.
>> Probably need to revisit
>> https://lore.kernel.org/lkml/20200901222523.1941988-1-ndesaulniers@google.com/
>>
>> How were you working around this issue? Perhaps you built clang to
>> default to LLD? (there's a cmake option for that)
> 
> 
> What option is that? I only add  -DLLVM_ENABLE_LLD=ON  which (I think) 
> tells cmake to use lld to link the LLVM being built but does not seem to 
> tell what the built clang should do.
> 
> Without -DLLVM_ENABLE_LLD=ON, building just fails:
> 
> [fstn1-p1 ~/pbuild/llvm/llvm-lto-latest-cleanbuild]$ ninja -j 100
> [619/3501] Linking CXX executable bin/not
> FAILED: bin/not
> : && /usr/bin/clang++ -fPIC -fvisibility-inlines-hidden 
> -Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra 
> -Wno-unused-parameter -Wwrite-strings -Wcast-qual 
> -Wmissing-field-initializers -pedantic -Wno-long-long 
> -Wc++98-compat-extra-semi -Wimplicit-fallthrough 
> -Wcovered-switch-default -Wno-noexcept-type -Wnon-virtual-dtor 
> -Wdelete-non-virtual-dtor -Wsuggest-override -Wstring-conversion 
> -Wmisleading-indentation -fdiagnostics-color -ffunction-sections 
> -fdata-sections -flto -O3 -DNDEBUG -flto 
> -Wl,-rpath-link,/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/./lib 
> -Wl,--gc-sections utils/not/CMakeFiles/not.dir/not.cpp.o -o bin/not 
> -Wl,-rpath,"\$ORIGIN/../lib"  -lpthread  lib/libLLVMSupport.a  -lrt 
> -ldl  -lpthread  -lm  /usr/lib/powerpc64le-linux-gnu/libz.so 
> /usr/lib/powerpc64le-linux-gnu/libtinfo.so  lib/libLLVMDemangle.a && :
> /usr/bin/ld: lib/libLLVMSupport.a: error adding symbols: archive has no 
> index; run ranlib to add one
> clang: error: linker command failed with exit code 1 (use -v to see 
> invocation)
> [701/3501] Building CXX object 
> utils/TableGen/CMakeFiles/llvm-tblgen.dir/GlobalISelEmitter.cpp.o
> ninja: build stopped: subcommand failed.
> 
> 
> 
> My head hurts :(
> The above example is running on PPC. Now I am trying x86 box:
> 

A bit of progress.

cmake -G Ninja -DLLVM_ENABLE_PROJECTS="clang;lld" 
-DLLVM_TARGET_ARCH=PowerPC -DLLVM_TARGETS_TO_BUILD=PowerPC 
~/llvm-project//llvm -DLLVM_ENABLE_LTO=ON 
-DLLVM_BINUTILS_INCDIR=/usr/lib/gcc/powerpc64le-linux-gnu/11/plugin/include/ 
-DCMAKE_BUILD_TYPE=Release

produces:

-- Native target architecture is PowerPC 

....
-- LLVM host triple: x86_64-unknown-linux-gnu
-- LLVM default target triple: x86_64-unknown-linux-gnu


and the resulting "clang" can only to "Target: 
x86_64-unknown-linux-gnu", how do you build LLVM exactly? Thanks,


