Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0F2F80
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 21:39:58 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id r18so399112edv.12
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gDh9+EkJ1XaioXG706gkM4MC/zvXOsIVOcJCDT0kPlA=;
        b=By1oZKn5ZK9lpmbNq9hmZ9zb4Q5xi6mybeF9MwvF2f8trWsWis+vN0IT+3VXJSeKXg
         +R2RtWPiXDlLjsZdkcekT6ysH7JpyHG94Tb6k2xKDjnRIaKq+kjoKO5tAoU2tc+19nam
         +7xiU8S3OSUHHeCLbkbYDUPPTslbhFrmnmT6mxCIaOMOiEHurXSexF/D7Esh5QgCbea9
         ErtdN+oWwQhRV4WmBJpeylpvRpPKQoE2BJfE+GA8sJyXrJhZvt26Pftiwbdi/Unzm16Q
         PM4yejiUuDuVmAfug58LWDePo2zbeT9FpSmz2FFInlZVP67VbX06bMLh63VA5F+Xtbw8
         PZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gDh9+EkJ1XaioXG706gkM4MC/zvXOsIVOcJCDT0kPlA=;
        b=SaSCLfg9wnRN70JG/2+5Te+22mVCqfb5ZwxmXZbawf3K/+K/Y/lrE+Sr63+N6gx/fD
         yZNXitF+oGgTKgqyiglSKx6bEGzHRMP//RbT1WZ7WOeUIjmEO+lNRpXsMljG4C2uOuzz
         b9mWZg/Oowj4VdlStV3rkJR/P0Ofll7L5oxm1x8wXDSERAjnEsksocgdVwSJ+vQgq/qp
         MrJWajCrq4U272A89gU87yEYPzDKxhd4dycbmqND8X9uzGFp/zhfzz/RGAa5Ne/o95DA
         m3QiTqA6J6ocrDSC6IXMZ1aLIWbu0C/XHFWtAigaulKiJFVVtvaAJWLwlOrL5vUqzfiH
         k9Sw==
X-Gm-Message-State: AOAM5305b4QlFHlzLQmpwLTsT9NpJgcRM20L5cFZcQM93Yd0hShZtSG4
	f6eVBH9r6ZztmZJzthSSBn2IiAgOtlXWDoafhMRW9w==
X-Google-Smtp-Source: ABdhPJxNM3CwYb0naketQjkRI2A0IGPc/ibk6F55WPHNr5CZpsGwvlMmC4LJjLEfkXKKOmGc0AXr+WUGMOXXH44mSV4=
X-Received: by 2002:a17:906:8618:: with SMTP id o24mr6777111ejx.189.1632865197080;
 Tue, 28 Sep 2021 14:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210928154143.2106903-1-arnd@kernel.org> <20210928154143.2106903-4-arnd@kernel.org>
In-Reply-To: <20210928154143.2106903-4-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Sep 2021 23:39:46 +0200
Message-ID: <CACRpkdZYJogU_SN3H9oeVq=zJkRgRT1gDz3xp59gdqWXxw-B=w@mail.gmail.com>
Subject: Re: [PATCH 03/14] ARM: remove duplicate memcpy() definition
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 28, 2021 at 5:42 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Both the decompressor code and the kasan logic try to override
> the memcpy() and memmove()  definitions, which leading to a clash
> in a KASAN-enabled kernel with XZ decompression:
>
> arch/arm/boot/compressed/decompress.c:50:9: error: 'memmove' macro redefined [-Werror,-Wmacro-redefined]
>  #define memmove memmove
>         ^
> arch/arm/include/asm/string.h:59:9: note: previous definition is here
>  #define memmove(dst, src, len) __memmove(dst, src, len)
>         ^
> arch/arm/boot/compressed/decompress.c:51:9: error: 'memcpy' macro redefined [-Werror,-Wmacro-redefined]
>  #define memcpy memcpy
>         ^
> arch/arm/include/asm/string.h:58:9: note: previous definition is here
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
>         ^
>
> Here we want the set of functions from the decompressor, so undefine
> the other macros before the override.
>
> Fixes: d6d51a96c7d6 ("ARM: 9014/2: Replace string mem* functions for KASan")
> Fixes: a7f464f3db93 ("ARM: 7001/2: Wire up support for the XZ decompressor")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Solves this, right?
https://lore.kernel.org/lkml/202105091112.F5rmd4By-lkp@intel.com/

Can you put in a reported-by and Link: to this so we got it tracked?

>  #ifdef CONFIG_KERNEL_XZ
> +#undef memmove
>  #define memmove memmove
> +#undef memcpy
>  #define memcpy memcpy
>  #include "../../../../lib/decompress_unxz.c"
>  #endif

That's clever, maybe drop a small comment in the code why we do this
pretty unintuitive looking thing and how this works?

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
