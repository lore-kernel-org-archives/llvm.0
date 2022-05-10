Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC023B7
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 06:22:19 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id a191so13862322pge.2
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 23:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r2fRyBS1PCGHWxGubdLBk7/5OJZHaTwkfn+9TQECPvA=;
        b=5pLUXPfwONX2rUTMrxu+zZxlh8XA+Bs2LiiHjy3J1iq/1QkxUnMQkIK9L7JIGd3uVd
         j/DCkNzLmc0AxN3PpfBKf8t0gN/S+Mf8XPTnlZ21xtaMRMJ7gNGlW5/Hzb5iK44El4oE
         fK7aNhWeDcpSuGEFe7XQpyl84xCEG2szfTDQo7BZpsFElSKQslx5BgLXbz8U88QH5J+v
         DBzXh4M569/dSBNHaYYq3dXwdRItSYrQPw+gkOSZNV1WEiIwplZwKnBk3PR2NRTU/RdE
         w5pFMPRg/u+U6O9tbAz/Cc0oEh1aHKd20MSuzel8RMC2s7iPm+L+/buiPUM3bYAE1E6F
         72hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r2fRyBS1PCGHWxGubdLBk7/5OJZHaTwkfn+9TQECPvA=;
        b=H5PVon6jN4EXhcMvMCPKI1ms70t15US3mOLZkCMM0HY3ydA3r5uLOrV1wpfIewjdnw
         ZtX4ha5zA5Bfimcpecr0q3ZR/ZIbtUdnhxCRh/Rw8gQ/klseARRasR+qb+gUO+NZGk48
         bQC0WXFNJ2LEVe0zTRovhMprir6dmZIIG9F9YNjWtFe0Hn32254/Y1ZN7fyGxVIsMD97
         /7kIctvqn7bo95WsLyTvgE4mtqwKXcDkN9pKEZXzeZ924fdRgmwVfpPHHIILRr1L3jJK
         iT+tZau3olTZs7Ccdqz745fNEulF70N9jG3dR6QRbl3pyemBlyzugOuKZy69xkyVYaVy
         EQpw==
X-Gm-Message-State: AOAM530rBRT3VSts37NogsS19STPAA50uiP0l0g9NJ8I5Y9PURcbR3IQ
	e26Pf2qWCLaAjcAy//7Er6iytA==
X-Google-Smtp-Source: ABdhPJypmPrYaweX1M/lWVoq6y1mcDbSNObKQUR1WOaa4Dph1JgWtserJIpVGCJFAC2mctRftZi3Lg==
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id l15-20020a056a00140f00b004e069959c48mr19176518pfu.59.1652163739169;
        Mon, 09 May 2022 23:22:19 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id a1-20020aa795a1000000b0050dc762815asm9751096pfk.52.2022.05.09.23.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 May 2022 23:22:18 -0700 (PDT)
Message-ID: <ddd263c7-f27b-9543-55a3-d4efd899afac@ozlabs.ru>
Date: Tue, 10 May 2022 16:22:12 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH 2/2] powerpc/vdso: Link with ld.lld when requested
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, patches@lists.linux.dev
References: <20220509204635.2539549-1-nathan@kernel.org>
 <20220509204635.2539549-3-nathan@kernel.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220509204635.2539549-3-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/10/22 06:46, Nathan Chancellor wrote:
> The PowerPC vDSO is linked with $(CC) instead of $(LD), which means the
> default linker of the compiler is used instead of the linker requested
> by the builder.
> 
>    $ make ARCH=powerpc LLVM=1 mrproper defconfig arch/powerpc/kernel/vdso/
>    ...
> 
>    $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
> 
>    File: arch/powerpc/kernel/vdso/vdso32.so.dbg
>    String dump of section '.comment':
>    [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
>    File: arch/powerpc/kernel/vdso/vdso64.so.dbg
>    String dump of section '.comment':
>    [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
> The compiler option '-fuse-ld' tells the compiler which linker to use
> when it is invoked as both the compiler and linker. Use '-fuse-ld=lld'
> when LD=ld.lld has been specified (CONFIG_LD_IS_LLD) so that the vDSO is
> linked with the same linker as the rest of the kernel.
> 
>    $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
> 
>    File: arch/powerpc/kernel/vdso/vdso32.so.dbg
>    String dump of section '.comment':
>    [     0] Linker: LLD 14.0.0
>    [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
>    File: arch/powerpc/kernel/vdso/vdso64.so.dbg
>    String dump of section '.comment':
>    [     0] Linker: LLD 14.0.0
>    [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
> LD can be a full path to ld.lld, which will not be handled properly by
> '-fuse-ld=lld' if the full path to ld.lld is outside of the compiler's
> search path. '-fuse-ld' can take a path to the linker but it is
> deprecated in clang 12.0.0; '--ld-path' is preferred for this scenario.
> 
> Use '--ld-path' if it is supported, as it will handle a full path or
> just 'ld.lld' properly. See the LLVM commit below for the full details
> of '--ld-path'.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/774
> Link: https://github.com/llvm/llvm-project/commit/1bc5c84710a8c73ef21295e63c19d10a8c71f2f5
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   arch/powerpc/kernel/vdso/Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 954974287ee7..096b0bf1335f 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -48,6 +48,7 @@ UBSAN_SANITIZE := n
>   KASAN_SANITIZE := n
>   
>   ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> +ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)


Out of curiosity - how does this work exactly? I can see --ld-path= in 
the output so it works but there is no -fuse-ld=lld, is the second 
argument of cc-option only picked when the first one is not supported?

Anyway,

Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



>   
>   CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
>   AS32FLAGS := -D__VDSO32__ -s
