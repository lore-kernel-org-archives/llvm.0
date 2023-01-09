Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AA15233
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 21:58:44 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 7so6879388pga.1
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 13:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8mtKWc4WmtGm6NDppB1FPmywRJwZewn7Wl9vLbuK9vw=;
        b=SXyWMObFZXeTNyQecHi104uVS3C5VVNdbITrtvMou5aDqzX/U4NRz7uvEIsM8Onyco
         x8qqLrvh0HSwV3fczYkK93qVBE1SWVIm5mK9HzYglylMhUJMaXqn7bL6FtcjEoZEo/fo
         OcjstuljDhRYrS830xjpdSB77YwrYtXuM+PYffd8oCYXe+qhIHx87mShQzdUWimUiypY
         QNKHUicr800mVPn0COXPqDU4vjZAVpA83JY6L6WaC9XuTG0bw7sSTuItcNytIXboiUkK
         JB8evh3Cgq1lCllojmImBjDJpZSraooL+3WVJsi+rOxRCXx/O5eGPvvgudRNalID0dyL
         rXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mtKWc4WmtGm6NDppB1FPmywRJwZewn7Wl9vLbuK9vw=;
        b=vHt1KVSPiqQofS7ajavEIWfcG6MYWVYv562A2gfqi3irPSTpLlDNj31xjr8sgJIgeG
         CxmLNHMjbfgXTvYZ8iYD2fSjsBRaxnuOKcyCYUR47iZarFG9/uOtGdK4ShsF55eXHr2h
         l5J1XbopGduyZExTvJl5NinefqF62wJNtnv83yGUSc3S4MvPprYZgN/yiC2NGHf6yrt+
         GmPgJyXCirXFAx2Wbt46mfE6lU/PqK5BrT7iKLnvKsxW7UDlRDA8g8Gk4OKWU30mY1m8
         v6DT+eeNrVEfCv/sbsWxJvv4R+veNAwqcydofDuXhmxHWsLyamBv7wHBXwTJUz1Vg2sN
         6bVQ==
X-Gm-Message-State: AFqh2kow2d16lmiQtxKN7kpj4Cvoq7NDQRZ2guaVRMn4oEnoZaPo9gdm
	3JmaFKdnDLFF2ZJLIjD8LwKMmcHS/7IfnHoQ0zXz5g==
X-Google-Smtp-Source: AMrXdXsTlZoISLITCF02n+J4dXMcvFqFszZPB4liS+mZyZpp5BBYwkngdTAnTeTZgwlDRJLb/yCfd+smm6q/Dgm9C1w=
X-Received: by 2002:a63:4943:0:b0:478:e6cf:c24c with SMTP id
 y3-20020a634943000000b00478e6cfc24cmr5128347pgk.365.1673301523884; Mon, 09
 Jan 2023 13:58:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 13:58:32 -0800
Message-ID: <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns that ASFLAGS contains '-s', which is a linking phase option, so it
> is unused.
>
>   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
>
> Looking at the GAS sources, '-s' is only useful when targeting Solaris
> and it is ignored for the powerpc target so just drop the flag
> altogether, as it is not needed.

Do you have any more info where you found this?  I don't see -s
documented as an assembler flag.
https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
https://sourceware.org/binutils/docs/as/Invoking.html

The patch seems fine to me, but what was this ever supposed to be?
FWICT it predates git history (looking at
arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 6a977b0d8ffc..45c0cc5d34b6 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -51,10 +51,10 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
>  ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
>
>  CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> -AS32FLAGS := -D__VDSO32__ -s
> +AS32FLAGS := -D__VDSO32__
>
>  CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> -AS64FLAGS := -D__VDSO64__ -s
> +AS64FLAGS := -D__VDSO64__
>
>  targets += vdso32.lds
>  CPPFLAGS_vdso32.lds += -P -C -Upowerpc
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
