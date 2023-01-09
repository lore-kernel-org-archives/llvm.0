Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DAC5221
	for <llvm@lists.linux.dev>; Mon,  9 Jan 2023 21:21:13 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id h7so3001127pfq.4
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 13:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VEv+BCQ3d9QW4yHvpTO11D0ci7c2BKG21JG++s6/agQ=;
        b=APo6u6W6JLXHn46Hy9zPF8zoq9mI2i96AoxJiaj3fStb9ZveAJAIITs6jeOcXTqhSN
         fDZZRIx0dRF64BBx+uGEu9s21TTPqcPQCKPhQOYA5iYgL6lVWUSWCGrejs4Iws2aI7+G
         nV9efbTEq/6F5NC7vIniecbnfFFmbq4Xn5LIVNXpS5fC9vyHKP/41DvxQbVRX3h284CS
         n8uuLrIkrXjHSw/208Qt0eseYqa3ACYCacTSUq3IJYq9O72fkhGjhd6V3X1GC1Axyx4s
         K9YhpfRRuWTKkuXGaeA+1XI6lFlo6EaIzShsanZVIKddUS8xO79VugukaXVFJIApuh1Q
         AmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEv+BCQ3d9QW4yHvpTO11D0ci7c2BKG21JG++s6/agQ=;
        b=YxJiqpK0Owwz39T+tX6vvJOZgAOBHWdhzECbyeUpuX24TkLaBSEAyvOSPLqO8ilk+u
         DnwjAKM2qPLE9L3U/yYWPfwaW8cimERjK2qPjoNM7u4PNojbSm4Id6jPSXeeEFNvwI9X
         h7g0V2Bd0kTb1xFp1fAVLRFfNSRe25LU6M49TuMh/BYSDkHoUtxGRh2mh2dZPFVpHU9g
         8IZEGxj5esydMNTmfeGX6jDKMane3MzvwYPOOcPk8lFwodMiW4KHqYPO0c0laFNnrVlP
         xK/RELWoKQ/mRcVlo7O23tjtIXPHLFNgyblpIGzeUJ/dilBqMM9Oc7zZ0YJmVwSADt38
         xzMQ==
X-Gm-Message-State: AFqh2koGygM2tG1XFyLS7akv6LGe191sBNi08Y58jTm8FGJxesXyjfyR
	BUemTpBzN/E618r0Am8ObBUbL84ruBJVrqa1h0uSGg==
X-Google-Smtp-Source: AMrXdXt7M8CmfWV4I0d441cdSIh1mUYOCCO5z7/hJFNohOLqc9JQnee//Ossa2yV783Z2MWZzSA6fK08Nmxl5RWwjqI=
X-Received: by 2002:a63:131d:0:b0:492:703:3f03 with SMTP id
 i29-20020a63131d000000b0049207033f03mr5485137pgl.403.1673299272219; Mon, 09
 Jan 2023 13:21:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 Jan 2023 13:21:00 -0800
Message-ID: <CAKwvOdnvdOChj0wZSA8k-NpTw9fxqfOyPXSHPNxORGHekf0szQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] MIPS: Prefer cc-option for additions to cflags
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 11:54 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A future change will switch as-option to use KBUILD_AFLAGS instead of
> KBUILD_CFLAGS to allow clang to drop -Qunused-arguments, which may cause
> issues if the flag being tested requires a flag previously added to
> KBUILD_CFLAGS but not KBUILD_AFLAGS. Use cc-option for cflags additions
> so that the flags are tested properly.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

We don't need the trailing comma in the `call`, but it's not worth a
v2 IMO. Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Cc: tsbogend@alpha.franken.de
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/Makefile             | 2 +-
>  arch/mips/loongson2ef/Platform | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index a00a6d94e16f..04e46ec24319 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -143,7 +143,7 @@ cflags-y += -fno-stack-check
>  #
>  # Avoid this by explicitly disabling that assembler behaviour.
>  #
> -cflags-y += $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
> +cflags-y += $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
>
>  #
>  # CPU-dependent compiler/assembler options for optimization.
> diff --git a/arch/mips/loongson2ef/Platform b/arch/mips/loongson2ef/Platform
> index eebabf9df6ac..c6f7a4b95997 100644
> --- a/arch/mips/loongson2ef/Platform
> +++ b/arch/mips/loongson2ef/Platform
> @@ -25,7 +25,7 @@ cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f
>  # binutils does not merge support for the flag then we can revisit & remove
>  # this later - for now it ensures vendor toolchains don't cause problems.
>  #
> -cflags-$(CONFIG_CPU_LOONGSON2EF)       += $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
> +cflags-$(CONFIG_CPU_LOONGSON2EF)       += $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
>
>  # Enable the workarounds for Loongson2f
>  ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
