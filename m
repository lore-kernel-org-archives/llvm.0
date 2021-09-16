Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833193FC9
	for <llvm@lists.linux.dev>; Thu, 16 Sep 2021 23:26:57 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id b15so6508921lfe.7
        for <llvm@lists.linux.dev>; Thu, 16 Sep 2021 16:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qGW+TlqgmksvmhUEkFUHjtdzrHaBOdCApfV4N+CESfA=;
        b=iI1AB/uL5IKlwdLyO2RhbtZpmeHcOT7OX2ULVresTNDmhDk7gIub2LhVdRwBJcqLMh
         XiglApUPu0QaUlAIg3Y2Q/B/XfDAWJ8EwWq/x9pDJoySoMsCcG1PLPPEwJRItLFqgtgQ
         2Dcn6u5gso9HAm1IiaNkjCw2h+gSWvm1yETAxzuvKVvRKvBesxAXQPH05FjTvDbqoBQi
         jTRMpZzbRCe5EFJzplvt/uT9gKTFvtzpxBIst9k02ZJqRz1bTgiXUCmAmTDQcY7ULtdK
         rA814LQ1TmQI9v8bQ9U8FKSz+S8nc7jTfWmUqkuX1d1CjzocsbFRpFebjHhR+wPM8vxS
         P1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qGW+TlqgmksvmhUEkFUHjtdzrHaBOdCApfV4N+CESfA=;
        b=iqy6FNX73LbEG+4BaeX/w19oRy0GP+55QxpA1PkTKfpj7qy8dK4IQ8yy+033kRYbSf
         E43J8dvdO4/vftAJm/fR/tc11JpcDhKUzonra8+UJPkF0hvNBxZ/ru+9wedfc8EGL3WQ
         E7TiK6MmsvVOICzhW4aHIgBDH985uxhwPve/Hi3EYnj+YZM1fqE1InraaS62O7aOPXtn
         SJ+pw69L0C7vAUp5tkKB4Fvn1l9APxcm3TsQLsp1wVibEZMzbqyhgz4iFW/XO9FOxflH
         MbE5IOv94MHjk9p3bfTuvM87S/uMY3gRhaJnSD2egagzJxnQPgt/g3D78wa2HTD19BhW
         y/bQ==
X-Gm-Message-State: AOAM533Jk+Ei5lPHTRk9P/XO/I9rPSYxnD0N326QUCdrtIF6pOzceey/
	mSAPS+m5Yb4kEn8dnsLYsjEnKxJS5HkWPaIAcmxOng==
X-Google-Smtp-Source: ABdhPJy1ZYuYhqdlBzLoZg+vMF2Sg/WTKkh6TEdBxkvxcWnSTiA4cw7O+M0iwQlNphJQppOLamlPKpz35Q1eonR6kwE=
X-Received: by 2002:a05:6512:3b9e:: with SMTP id g30mr5707949lfv.651.1631834815384;
 Thu, 16 Sep 2021 16:26:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210830213846.2609349-1-ndesaulniers@google.com> <CACRpkdap==EPZpAggMmd0XN1J-DwK=OQu3oGn-V=zPOaq5XnHw@mail.gmail.com>
In-Reply-To: <CACRpkdap==EPZpAggMmd0XN1J-DwK=OQu3oGn-V=zPOaq5XnHw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 16 Sep 2021 16:26:44 -0700
Message-ID: <CAKwvOdmmrxs2eMqvUm+Zg6Lpin+9BoQRPh9CF3Tdnc-+9eeQSw@mail.gmail.com>
Subject: Re: [PATCH] ARM: select HAVE_FUTEX_CMPXCHG
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, YiFei Zhu <yifeifz2@illinois.edu>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mike Rapoport <rppt@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 16, 2021 at 3:40 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Aug 30, 2021 at 11:38 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>
> > tglx notes:
> >   This function [futex_detect_cmpxchg] is only needed when an
> >   architecture has to runtime discover whether the CPU supports it or
> >   not.  ARM has unconditional support for this, so the obvious thing to
> >   do is the below.
> >
> > Fixes linkage failure from Clang randconfigs:
> > kernel/futex.o:(.text.fixup+0x5c): relocation truncated to fit: R_ARM_JUMP24 against `.init.text'
> > and boot failures for CONFIG_THUMB2_KERNEL.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/325
> > Reported-by: Arnd Bergmann <arnd@arndb.de>
> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> LGTM
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please put this into Russell's patch tracker!

Done!
https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9122/1
Thanks for the review!

-- 
Thanks,
~Nick Desaulniers
