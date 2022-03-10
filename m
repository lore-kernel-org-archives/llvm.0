Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8345A1F
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 19:16:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id l20so11116353lfg.12
        for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 11:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=go92KYaN5aNvN8bXbqqxD++j8ixdpZLOPabJY6m9jQw=;
        b=LMIIbB0h1/4pQ0VdwUiOVE5d8NYb+t5fKYOcBza0G4sUYUWMDPGXo6a0id4sFW37kU
         6PZ2zExV/hzV0YuLWmcwShIUaxVm9631BL2nPdiIHiZGdGkS915lgqkRKgnNzjIJRABq
         3p1plaVXJ4Xyv6Y/3l4odxQrdGFhBBcovjO2Ov1AovSwcNpnnk5EtWg/AIWe9NqtZRNm
         SpWjOXK61WvLZdF+uhKHXmIVdc8jO6xY5SN7yP/WdujHoRlSZ6/zXbrAz+y7O+Dbtm3g
         Ozlpm0qv5imV2YW5vd/0MDNm7DFvkJDqOehkFMPsktIyHGsWxGU0R9DWREfGW0uwXnRG
         lFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=go92KYaN5aNvN8bXbqqxD++j8ixdpZLOPabJY6m9jQw=;
        b=DRcxfbwsT5OJ7qabCFCBSGLPOUgcpLGlHPL6zfk0bEl/ZyRCr3bxxKvl0g0fbQ519Y
         7ynoowtCM+bFYAD1+cba4+k+GpTdE+juAdWRnlavXA5GXakhYYKl8BtBqz5/yTUv9w6F
         C5ZSYsZZqPLaoe98nxFhPv99iitBZ3+F3gnCSBwJJ6eFSvXIjO0h6KdB0hD3F3c7lELT
         nZzrSe2mE5A9goDIvtkSK0x56R4GPIxTOC84QTwkTMyBUFlGEX1RTLESv4/aGpDyAyk8
         7TIDX9iBEfkFABioz7tG14npgm/KcB17kuKjgIW9Vs6v72z2Jjvl2WStrezXfyyXrcjl
         CPsw==
X-Gm-Message-State: AOAM531jFwRkFdPcKVNgp8qWMC3+4/2pidV7ZFPQrzPDSdkJvB0DGCwL
	9joSeb0eHReat6/5wpjd5Ngtjrl2VE8YnOYZIWsq3g==
X-Google-Smtp-Source: ABdhPJzEWqQmXRfdkmydm0aeWMsZ+uV0rW00eQolc1dHSilGfFUrRNnedV8T2t9cApwOAE7/envXItTTv3uQAduPaEY=
X-Received: by 2002:a05:6512:31d4:b0:445:e4ef:c0f8 with SMTP id
 j20-20020a05651231d400b00445e4efc0f8mr3847544lfe.626.1646939777382; Thu, 10
 Mar 2022 11:16:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220305125605.149913-1-masahiroy@kernel.org>
In-Reply-To: <20220305125605.149913-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 10 Mar 2022 11:16:05 -0800
Message-ID: <CAKwvOdkYs8wkFOGpPc6SKY8CSFHdT8t_AJdFTkSCr+43dm20Mg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add --target to correctly cross-compile UAPI
 headers with Clang
To: Masahiro Yamada <masahiroy@kernel.org>, David Howells <dhowells@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Fangrui Song <maskray@google.com>, 
	"Dmitry V. Levin" <ldv@altlinux.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Michael Kerrisk <mtk.manpages@gmail.com>, =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 5, 2022 at 4:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When you compile-test UAPI headers (CONFIG_UAPI_HEADER_TEST=y) with
> Clang, they are currently compiled for the host target (likely x86_64)
> regardless of the given ARCH=.
>
> In fact, some exported headers include libc headers. For example,
> include/uapi/linux/agpgart.h includes <stdlib.h> after being exported.
> The header search paths should match to the target we are compiling
> them for.

Isn't that a bug in that header though? Why does it inconsistently use
size_t vs. __kernel_size_t. Shouldn't it be consistently using
__kernel_size_t? (Seeing TRUE/FALSE defined in such a low level header
is also *yikes*.) Are there platforms where sizeof(size_t) !=
sizeof(__kernel_size_t)?

Usually to bootstrap a toolchain you need to start with kernel headers
to bootstrap the libc.  It seems like some kind of circular dependency
to me if kernel headers are dependent on libc headers. Hence my
previous comment about -ffreestanding.

>
> Pick up the --target triple from KBUILD_CFLAGS in the same ways as
> commit 7f58b487e9ff ("kbuild: make Clang build userprogs for target
> architecture").

Oh boy thanks for finding+fixing this! I still suspect we shouldn't
need a cross-libc for UAPI header testing, and that the kernel headers
simply need to be cleaned up. But regardless of that it doesn't make
sense to use the wrong target when checking headers generated for the
target. Thanks for the patch (and sorry I've been falling behind on
code review lately).

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Reword the commit description to mention agpgart.h instead of
>     asound.h because the latter is in the no-header-test list.
>
>  usr/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index ac206fb27c65..4215801e1110 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -10,7 +10,7 @@ UAPI_CFLAGS := -std=c90 -Wall -Werror=implicit-function-declaration
>
>  # In theory, we do not care -m32 or -m64 for header compile tests.
>  # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
> -UAPI_CFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> +UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
>
>  # USERCFLAGS might contain sysroot location for CC.
>  UAPI_CFLAGS += $(USERCFLAGS)
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
