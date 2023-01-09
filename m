Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3225233
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 22:13:06 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id s67so6895312pgs.3
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 14:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe6A//qmJ4NnWbVuXzR/SPLnXLfnt5V0+ditkKxdD0c=;
        b=avwgqVIoXCpLRgL2rsbCwZk0+FJkhMDJvlfNCKRUfVdJskLNjDTEzit1skN/ZlDe3T
         R4r88LCIkzuGmRlRfgYxMpZlD7ZQ8qIJT0x6uZxwzNzAIwkcBLcBXmLsLe6xmo4jbR+8
         BddQ+9IEl/FL+GcFcDjRQnvhsj3/k2N6WpOnOJIXa+jd8/Qt4rM5go649f1Ve2iEqVxA
         Wwvyrgxb/ZPP8v5V9xzX5o1EFc+KUs7qPXPBnIuI3HUnZ2l7+lBWtwJtQnlK14+xFYLR
         sNCpJroLJ2+SnjtIbGfkqlwz+ePnTt2aNE1eKtJ+tBXfhOulflt9EqgIVYQEezgG5/3h
         0lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe6A//qmJ4NnWbVuXzR/SPLnXLfnt5V0+ditkKxdD0c=;
        b=zM6EP2OZJLWZLeJXRRsBVanm0MqS9MimtDL/qFFz9GII5X7xv1zECr4dUq2xhz29A6
         vZouYDDaFifB3UzTJVBRHlC27VOoqIQQhbGdVqw8rKQ5ZsyZtE0Khg7s/DXoGIuFPLpa
         +1SPRazpPwPOja4ckWdvog7I0FuGwcQRVlDflA8hsrgtWibZIlcCMdoQGun767gawJJG
         IND9pkAlnQUOwqxCmOheQo0wSJ71aduGEmAEYh2RPvV1hPGWLb4mLnkACEAuhiTIQTA0
         qWwYJSZUgSM/Jyou9X7JZURn91Bqsiomk2jsG7v2Wuh6s9XyYr2dM3i5yp5zrV0s/0Y4
         /vfQ==
X-Gm-Message-State: AFqh2kpha4nciALWquWFOa9bNiipNV/GKdCAaI99Ilocy/quC4YjohLm
	/FJzjVvP7DWsL8gdVJFafuBG2eZxakh1hEOpBa2bRg==
X-Google-Smtp-Source: AMrXdXtMcFa+l6kAazK251eqZGx6C7sgD9DBhmYRg4WNsq57PkL6XzXoZvYpynLFe25uQvunKx2n9ndiQ0ZxzuLH2tc=
X-Received: by 2002:a63:c50:0:b0:494:7a78:4bb0 with SMTP id
 16-20020a630c50000000b004947a784bb0mr3997953pgm.427.1673302386285; Mon, 09
 Jan 2023 14:13:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-8-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 14:12:55 -0800
Message-ID: <CAKwvOd=oKBcFrsw5W1kJuVb5WXx+54BTJCtRkS1YwbeJZ6vX-w@mail.gmail.com>
Subject: Re: [PATCH 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns:
>
>   clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
>
> This flag is supported for 64-bit powerpc but not 32-bit, hence the warning.
> Just remove the flag from vgettimeofday-32.o's CFLAGS when using clang, as has
> been done for other flags previously.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Hmm...so this was added by the top level Makefile doing a cc-option
test.  How did the test pass if this was unsupported? That worries me
that perhaps other cc-option tests are passing erroneously for certain
ppc -m32/-m64 configs?

> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 769b62832b38..4ee7d36ce752 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -16,6 +16,11 @@ ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
>    CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
>    CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
> +  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
> +  # an unused command line flag warning for this file.
> +  ifdef CONFIG_CC_IS_CLANG
> +  CFLAGS_REMOVE_vgettimeofday-32.o += -fno-stack-clash-protection
> +  endif
>    CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y)
>    CFLAGS_vgettimeofday-64.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>    CFLAGS_vgettimeofday-64.o += $(call cc-option, -fno-stack-protector)
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
