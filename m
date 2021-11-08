Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7538A68
	for <llvm@lists.linux.dev>; Mon,  8 Nov 2021 23:52:48 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id b40so10632029lfv.10
        for <llvm@lists.linux.dev>; Mon, 08 Nov 2021 15:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xQoakJHTcWwfHa/NS4KPgpKolL7O0uuBUoyy7jYi4UY=;
        b=FzgTBxK8H5tAEUhcqKWHyLjlpG0kfn/cnOAKtdSn7Jmclp+DBaVq4u5MvwU8+FUc7F
         XwgCxpxqFuiAHGrMf3JoRhyBBsxryXJLbMx3Ppd29nXMnTM3WVR2KmD8WAYb0y1YGGFO
         FO2kHEcqadQkuy8MhuElUx1FWI+oaCjeDBpHvkDsd0zK7Ts/zZn2iA/oGAfYBuFch95P
         zedUqHpdpXUFsbRiSGdVe9pxVKskLqNW3AXKdzKOM8fRRf6KoyLjLmOM+tDt17A+M+29
         KWBgPzKIdyy5KsZUzxJGGB/BBLx44ZXaViSkegJ2K/Lff0A6lo8mbxn6LllkhItoUw2I
         Dchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xQoakJHTcWwfHa/NS4KPgpKolL7O0uuBUoyy7jYi4UY=;
        b=Tgs5vNqfzGHfLssj9fqdG07mWM28VzKi+U2IApi4gI470826k7bKbmc81OSsKSiVXG
         cIM0gUvLRulLUss13qC739Q9XSlpzEAldY2+Ps7yun8imw5MrLdWKgykbcr6/slY+1iJ
         Ciz86eaI/j58YX+nd5lbVRg/nS9jJAW7w3hObo+1cjgraPBLUvDmhNPKWJJT/hKbXXhH
         idkE7/EbD+O+PBnAK0W1Xh/z1t1n4C5EhAKEQ5lOsOaihhuj40SJaIEIuk1+rDSX7+dj
         fdgXJbCsoDgJi6O4CpiLYpP/STE/vvutozwB4E9XFW0MWkI62a0GueV1o9/IDeIst+r7
         vzCA==
X-Gm-Message-State: AOAM530hx3v4jf7tRwlSQPq0iwAhjEfVke0ydMaTHxkE6CLan143Zzt+
	iTB9Qvcn+0qdXDPTcl5dkOZ5KFFjM0rm4HSsu1FIrA==
X-Google-Smtp-Source: ABdhPJz9Jal+DdJFxwcno3dBZUUGwwrzI6E+nDFqJAZgZew/jY4YcfEEOfxYGGFPwS0SI3bdktL6b+A7GK7Ucrt0TaU=
X-Received: by 2002:a05:6512:b29:: with SMTP id w41mr2875410lfu.240.1636415566309;
 Mon, 08 Nov 2021 15:52:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211107162641.324688-1-masahiroy@kernel.org> <20211107162641.324688-2-masahiroy@kernel.org>
In-Reply-To: <20211107162641.324688-2-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 8 Nov 2021 15:52:35 -0800
Message-ID: <CAKwvOdmCaXAMvouD7bsWqmgOUxQ9vpdt3LY7qWpzTVm-2gddEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/purgatory: remove -nostdlib compiler flag
To: Masahiro Yamada <masahiroy@kernel.org>, Fangrui Song <maskray@google.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, clang-built-linux@googlegroups.com, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 7, 2021 at 8:27 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The -nostdlib option requests the compiler to not use the standard
> system startup files or libraries when linking. It is effective only
> when $(CC) is used as a linker driver.

Is that right? ld.lld recognizes --nostdlib and has --help text for it.

>
> $(LD) is directly used for linking purgatory.{ro,chk} here, hence
> -nostdlib is unneeded.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/x86/purgatory/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
> index 95ea17a9d20c..ae53d54d7959 100644
> --- a/arch/x86/purgatory/Makefile
> +++ b/arch/x86/purgatory/Makefile
> @@ -16,7 +16,7 @@ CFLAGS_sha256.o := -D__DISABLE_EXPORTS
>
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved symbols.
> -PURGATORY_LDFLAGS := -e purgatory_start -nostdlib -z nodefaultlib
> +PURGATORY_LDFLAGS := -e purgatory_start -z nodefaultlib
>  LDFLAGS_purgatory.ro := -r $(PURGATORY_LDFLAGS)
>  LDFLAGS_purgatory.chk := $(PURGATORY_LDFLAGS)
>  targets += purgatory.ro purgatory.chk
> --
> 2.30.2

-- 
Thanks,
~Nick Desaulniers
