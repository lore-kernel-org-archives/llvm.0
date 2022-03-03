Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29236B
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 18:40:13 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id r20so7991932ljj.1
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 10:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y9eIeQ0ho5+PgyAKnaaB11UpUGBa3mppG5jHpvKWnBA=;
        b=BjH5X6Yj0lRLeYOc8+oSpAblIl1dkXNqVGcH9rXpzrumLG854C8lBpc1Hf32dy9X7S
         qN144M6BlKdb/TeKDx4m4KlRfbXCKSuIqZSqDAKIaMsp/mNK0QGzcF0nI54JGHx/GDIf
         JiaQLSrtU95mf2sbhwjFSoKjW96x+Y/thc44fNJ1JCLIcNzbIhDJPp339LrPgRBP548x
         Lqw1WlROjRYD6A8BHvM+qqmOmYuhm94stV8lJbFSYie+bs4si8ZjxZPjzxUSVl2KkMlH
         E45QFbuyDCz8Jrn4GPhNWcrNdFjXLzSLHep6Zk6vW/eISe6AvtEYi0RsmuJydwV0rYk7
         zKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y9eIeQ0ho5+PgyAKnaaB11UpUGBa3mppG5jHpvKWnBA=;
        b=d1a+0Zb6geGEQ6DjNG/+vDKVqJaVXT5dzXs8vK1ZxMiao7SyBl6urzb8yJe3waMSgv
         ZBxrnYB/4gyq1hdAPgVanRxpa4yMrWF7nrTGiFsuqXuPSXDF02UNrHR1XJlcoH8QqJQl
         tRZwdvnGgbGgBn4pTGTk7/2j7HW3eFzUmBSdRiDDwQg7nhIL7BzZWaAkAxd2NXtXb3QF
         3g7xogkxMBVczCxksTRdOBOQlx57sdfOp+zmIcmIqgbuBzSxl0QzVhT4NBSSrOo06wCb
         +0Nll1O3TFDaegIdrDznCLFUSRKAsy/tfBOgQAqGIFLrYUVGXPrpEpu/XHDfcpRRhOJf
         nPpg==
X-Gm-Message-State: AOAM533nXzQlOfdGldkSP1U3PMVTw8bSD1otHh3UjP7nyMMM1/Cn9Vrc
	YPQmfr5sHVrTxWmp608NaXwP7BqZi/TRoytXHI6HNA==
X-Google-Smtp-Source: ABdhPJwyjNAAm+EL9aaDfd+4HLNYZJcB+u5Y2JbOp3rzBkroi7cpVqLVVllTAVIMTyL9bcg2tNAPemU2mRq88VzGMek=
X-Received: by 2002:a2e:bf24:0:b0:246:801e:39d3 with SMTP id
 c36-20020a2ebf24000000b00246801e39d3mr17157636ljr.472.1646332810871; Thu, 03
 Mar 2022 10:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220303090643.241747-1-davidgow@google.com> <YiD7R2wRxoWxtVq7@dev-arch.thelio-3990X>
 <202203030947.E2FA3D9@keescook> <YiEISsoS/XrbEtbm@thelio-3990X>
In-Reply-To: <YiEISsoS/XrbEtbm@thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Mar 2022 10:39:58 -0800
Message-ID: <CAKwvOdkA1c3U6+-6hB3Nj9m2Z8eYzsFWm5X4se2eq_cF3NB2jA@mail.gmail.com>
Subject: Re: [PATCH] um: clang: Strip out -mno-global-merge from USER_CFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, David Gow <davidgow@google.com>, 
	Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-um@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 3, 2022 at 10:26 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Mar 03, 2022 at 10:04:28AM -0800, Kees Cook wrote:
> > How does -mno-global-merge get KBUILD_CFLAGS in the first place? If it's
> > arm/arm64 only, shouldn't that get relocated to those architectures?
> >
> > *time travel* found it:
> >
> > 61163efae020 ("kbuild: LLVMLinux: Add Kbuild support for building kernel with Clang")
> >
> > So I think this may have been universally true long ago, and now only
> > arm/arm64 need it?

Looks like that's the case from LLVM sources.

<snip>

> > diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> > index a2391b8de5a5..dcab28c44c26 100644
> > --- a/arch/arm/Makefile
> > +++ b/arch/arm/Makefile
> > @@ -48,6 +48,13 @@ CHECKFLAGS += -D__ARMEL__
> >  KBUILD_LDFLAGS       += -EL
> >  endif
> >
> > +ifdef CONFIG_CC_IS_CLANG
> > +# CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> > +# source of a reference will be _MergedGlobals and not on of the whitelisted names.

I think there's a typo in the original comment.
s/on of/one of/ ?

Also, I'm not sure what's meant by _MergedGlobals. Perhaps this is an
opportunity to make this clearer?

"Clang's "global-merge" pass (implemented only for arm and aarch64)
may break modpost Pattern 2 if symbols are renamed and thus don't
appear on modpost's allowlist.

> > +# See modpost pattern 2
> > +KBUILD_CFLAGS        += -mno-global-merge
> > +endif
> > +



-- 
Thanks,
~Nick Desaulniers
