Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C9923C4
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 21:24:54 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id b18so26023649lfv.9
        for <llvm@lists.linux.dev>; Mon, 09 May 2022 14:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f1ZKCNhZxORq8c7EgaL4dVwnuRxBSTms81kX0yogN9o=;
        b=rnUNDFnvWbpL/h8Vf3izjlnms8lBTpny2gdCnHOxqB2MEGjnQ0lcLXPO+4vHqI7B9c
         //N55s0emMp69g6AwrRl461noDFhya5c61TVnRUPS9vn0djdsBQGwRV2o8pSuEaVVdX1
         RjxQYrD85ZPw7uCGi3fdbKwpemkp3qhK2YAQKPOjoPSaqDdVrRZ6Oq29cTAcskq6B8iT
         KpFbcQeJcuNw9pJFKhoypmWObaWomuzk4bIYfYoL2Q0flenXImaomkousTnAE7/gQfFf
         xE7jGrNTrS1xMdjQJv/q28vx69R7YgfucnQnAXcTyAzYy8gqcE/sTxMUD+jVf2MKUgaU
         OOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f1ZKCNhZxORq8c7EgaL4dVwnuRxBSTms81kX0yogN9o=;
        b=J5fupEbaG1rbDqXGQKhASQjp3xDt8FaTXjeOeVlVJFknB9KAZdOCbQsYbdXDivov3G
         dHmZ/q2DlgKeYcxBThqfKNBm657Wfe8rqVEJCrFSjutTmZqbOI4aALJLPbKo/30mE32a
         tUgfpeRN+S0cXumXd/d3UQOEQ/7C110z/uk5RidVVdFztIi96u1cveexQMNMG/xR7deu
         QKtTS+Awfn459OzpIg4LTVTvNECxh2B4cIXIg6/kkw4Wlf2hjR2p62p2Jv0gLweL91Ml
         71IVxo3NeEv96c8MMQfwIdMYKkRbQw99YD1LVsgliN+4E6VBcqN5RwJzGF2HLkkRsWdC
         /DWg==
X-Gm-Message-State: AOAM530qJauLjJi5snhUvPIij0Q0JGVtto0vWdF8b5C0u0T3SkjYVHeL
	0FK6PQXA9zxagDR2GfPwwK9tAptgkVsbNGdlNzp0tw==
X-Google-Smtp-Source: ABdhPJzlVJ4LdtgzZNGGoTW71AqVYfRQLEXQr1oqfWVq1fwCpHO+N4JyBlIGF/GxtN25yMeZ/G9OTyQPpYIokXa9cz0=
X-Received: by 2002:a05:6512:48f:b0:472:3c47:94a0 with SMTP id
 v15-20020a056512048f00b004723c4794a0mr13987721lfq.579.1652131492458; Mon, 09
 May 2022 14:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220509204635.2539549-1-nathan@kernel.org> <20220509204635.2539549-3-nathan@kernel.org>
In-Reply-To: <20220509204635.2539549-3-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 14:24:40 -0700
Message-ID: <CAKwvOdkvF8AJudCcu=CVmU42eyVMJwUjQFnX+rpVF45bTR86Mg@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/vdso: Link with ld.lld when requested
To: Nathan Chancellor <nathan@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, May 9, 2022 at 1:47 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> The PowerPC vDSO is linked with $(CC) instead of $(LD), which means the
> default linker of the compiler is used instead of the linker requested
> by the builder.
>
>   $ make ARCH=powerpc LLVM=1 mrproper defconfig arch/powerpc/kernel/vdso/
>   ...
>
>   $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
>
>   File: arch/powerpc/kernel/vdso/vdso32.so.dbg
>   String dump of section '.comment':
>   [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
>
>   File: arch/powerpc/kernel/vdso/vdso64.so.dbg
>   String dump of section '.comment':
>   [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
>
> The compiler option '-fuse-ld' tells the compiler which linker to use
> when it is invoked as both the compiler and linker. Use '-fuse-ld=lld'
> when LD=ld.lld has been specified (CONFIG_LD_IS_LLD) so that the vDSO is
> linked with the same linker as the rest of the kernel.
>
>   $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg
>
>   File: arch/powerpc/kernel/vdso/vdso32.so.dbg
>   String dump of section '.comment':
>   [     0] Linker: LLD 14.0.0
>   [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
>
>   File: arch/powerpc/kernel/vdso/vdso64.so.dbg
>   String dump of section '.comment':
>   [     0] Linker: LLD 14.0.0
>   [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)
>
> LD can be a full path to ld.lld, which will not be handled properly by
> '-fuse-ld=lld' if the full path to ld.lld is outside of the compiler's
> search path. '-fuse-ld' can take a path to the linker but it is
> deprecated in clang 12.0.0; '--ld-path' is preferred for this scenario.
>
> Use '--ld-path' if it is supported, as it will handle a full path or
> just 'ld.lld' properly. See the LLVM commit below for the full details
> of '--ld-path'.

Perhaps worth adding some additional background from the cover letter
to the commit message that will actually go into the kernel,
particularly:
1. Kbuild mostly invokes the compiler and linker distinctly; the ppc
vdso code uses the compiler as the linker driver though.
2. When doing so, depending on how the compiler was configured, the
implicit default linker the compiler invokes might not match $LD.
3. This is a problem for LTO since clang may try to invoke ld.gold,
which is not supported as of
commit 75959d44f9dc ("kbuild: Fail if gold linker is detected")
4. Using the linker as the driver can cause ld.bfd 2.26 to crash.
https://lore.kernel.org/all/b2066ccd-2b81-6032-08e3-41105b400f75@csgroup.eu/
(Though, I wonder if that's because I was trying to add
--orphan-handling=warn, which we're not yet doing for the ppc vdso
AFAICT).

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Link: https://github.com/ClangBuiltLinux/linux/issues/774
> Link: https://github.com/llvm/llvm-project/commit/1bc5c84710a8c73ef21295e63c19d10a8c71f2f5
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/powerpc/kernel/vdso/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 954974287ee7..096b0bf1335f 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -48,6 +48,7 @@ UBSAN_SANITIZE := n
>  KASAN_SANITIZE := n
>
>  ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> +ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
>
>  CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
>  AS32FLAGS := -D__VDSO32__ -s
> --
> 2.36.1
>


-- 
Thanks,
~Nick Desaulniers
