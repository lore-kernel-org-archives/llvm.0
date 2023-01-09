Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21CE5233
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 22:08:53 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id k19so7272859pfg.11
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 14:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M3/bjcjwqs32VfeutL9QJPZEaF21MdlHhnjWNUyFuEk=;
        b=L4i61R65lF+VOm1+zwk+wWlBh/BIGTiXkXWreB02q9PPbDx0yp0CW7GthGgHj9YTrX
         vWxkorg4qIgTjhp1+3KfardcFLd0WDovQvL+6ZTK594tzf3Up6nirE9kFUyUU+f7g1ge
         DGhXuWL/exJH4nMFuVPmYlwCz2wRNYpyh3O6x1g35a5UI9jbbG3upgQxz7ZVdXGC2Dnt
         jqvNsM2yBxe5m6LbMsAptcWXFvx4UALQKoYeCsogmoJDdhbnyKP67BBX1Go0Qe6wFpzu
         gTeUF2AYgR2yJfrqiMsPBKNlU3/gGI0RzX6vCVCWDvd2Zl61+6oN9euz5fCNbwITsdtO
         0heA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3/bjcjwqs32VfeutL9QJPZEaF21MdlHhnjWNUyFuEk=;
        b=t1rGqNac2bfscysgMgaNZQr2kIDdsicSO9cMlHZZS+uct1zPp4su8+Z2lhyrPDX70Z
         Y5GBlziqavjaCZq8Y17q/KAYZiGkRZSDCGLBlaI8LDD509l+jSCuSeuKT84dvT6KBCFA
         OT93Ap8Ht4Yz8QyEAvbX0UUg78kvFMItEGDJfV76vAXYsnRqJ5Bj7v7XntsZe2xNh5vI
         xnML6x9Q0JbLdfCqtt8Jio2yJGGjmXJ1yPGUw9ACUsK4QbpoVJ9jfQYyQGk9S6q5QW5M
         ZzIHnqBr9elQ/r7ATCMYw8llZqNIfMRkFzMq3HGezgC8dCasdxG+hRXg8SMIwbkWMtpW
         F27A==
X-Gm-Message-State: AFqh2kpqMRlHsvYUQvLWNi02guWZ0QhrhjHNDzwl7TA2kvyHYB34QEME
	wbFo1XLzPKtbdq4rM3WhQg7arl57w/rqj/Mtt6ueWQ==
X-Google-Smtp-Source: AMrXdXt/8E/+SyPMUdape52/fOutTDwYLaY2GTy6DvMV9KeXUD40pN8sLSBZ8IdJNLQaURK+LVnkxljtzRqecW3wauQ=
X-Received: by 2002:aa7:914e:0:b0:578:202d:a33a with SMTP id
 14-20020aa7914e000000b00578202da33amr3359404pfi.23.1673302132638; Mon, 09 Jan
 2023 14:08:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-7-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-7-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 14:08:41 -0800
Message-ID: <CAKwvOdk6wzoPWoAoShtaeCDZXEZ2b7OAE05pHZy-ry=Eu8UnAg@mail.gmail.com>
Subject: Re: [PATCH 07/14] powerpc/vdso: Improve linker flags
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
> are several warnings in the PowerPC vDSO:
>
>   clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]
>
>   clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
>   clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]
>
> The first group of warnings point out that linker flags were being added
> to all invocations of $(CC), even though they will only be used during
> the final vDSO link. Move those flags to ldflags-y.
>
> The second group of warnings are compiler or assembler flags that will
> be unused during linking. Filter them out from KBUILD_CFLAGS so that
> they are not used during linking.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 45c0cc5d34b6..769b62832b38 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
>  UBSAN_SANITIZE := n
>  KASAN_SANITIZE := n
>
> -ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
> -ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> -
> -CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> +ccflags-y := -fno-common -fno-builtin
> +ldflags-y := -Wl,--hash-style=both -nostdlib -shared
> +ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
> +# Filter flags that clang will warn are unused for linking
> +ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
> +
> +CC32FLAGS := -m32
> +LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
>  AS32FLAGS := -D__VDSO32__
>
> -CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> +LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
>  AS64FLAGS := -D__VDSO64__
>
>  targets += vdso32.lds
> @@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
>
>  # actual build commands
>  quiet_cmd_vdso32ld_and_check = VDSO32L $@
> -      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> +      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
>  quiet_cmd_vdso32as = VDSO32A $@
>        cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
>  quiet_cmd_vdso32cc = VDSO32C $@
>        cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
>
>  quiet_cmd_vdso64ld_and_check = VDSO64L $@
> -      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
> +      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)

Let's move `-z noexecstack` up into ldflags-y? (you may add my RB with
that modification)

>  quiet_cmd_vdso64as = VDSO64A $@
>        cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
>
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
