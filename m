Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406C42C85
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 05:36:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id n8so5377136lfk.6
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 22:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ybRV+hwt+XX9ge3tQ7wYeHTSSre975ppkrBynQaih68=;
        b=OGLR+fdzuu83r+LVkVgU/R82Qj2xU1RxfIhAkTq5M9KO9tp5Yki8qP3nCeOA/qdKtY
         tRxRkDy86vKOfWi8PcvOT8GgF6nU1PAwUoJ4MxwfgY2xWB7G/WDwRzg3GdsEZ5Z9JcGq
         jbREXv0tEsGS/Byq/QbpRlly2G9PXkrFj1RyhZuP/YlqqGGpQ8qh2zaKXb0UNDfEH6e4
         hzasqeQ73tKDjuNmWzX718Plg8QfOfo6blOJ7q3K9Q5oep6F131LdDFAgutcPLF1xbwq
         MVfiKIMP72/Wkgox241eYRIJ5kcF7dSrXNheWEZM7l+R1W6CkqthTlP2/yiX4PAfmwAg
         bTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ybRV+hwt+XX9ge3tQ7wYeHTSSre975ppkrBynQaih68=;
        b=xcxoE4Cde/lIOlDpAW3XYnrlNn8BVERv7DE/c2j6ieFnFpbVJN/dHSjHrfCnO7h+kM
         CPdH0AkepitfImA82WYYvsZVpDwqLxKXlIVy+BNyLwYxswskEqON1jFZYDjNWogXrYpf
         p+e1nsVUBwr/fQ7CxJJ3RhpZvoCd8S/KL0DSK3krGZVHrXyTVulzQ9pw86Xbes2NXGnm
         vtcwc0DFhRRkejjkD/Cdbi19xDenEFm+oVtxVO9S2vWQRGzm8eLJJFganzoYAXYIwwK1
         Yv/muDRTinY7jTl2k7wZTZml3lvgjIOJyglpbR2n4zqJAZP9gam4ciVxws/ASHxUlCIw
         Rx3g==
X-Gm-Message-State: AOAM5316SuH65dfjOzhI/FIIWoFc2pum2fUlW4US9iJlsZqRdgYD45bW
	VnhBxF+a8qXwiGRLVCKo43URwvSYcATk4Pnuol83RA==
X-Google-Smtp-Source: ABdhPJzqEDYTHvAgPayyBNgll4yjivTHrBO+vJYqEiOV4VbsArYf1dvYHymL3sKS5UG7PlqCkl77D1pUn08KGosvLnY=
X-Received: by 2002:a05:6512:747:: with SMTP id c7mr7562628lfs.80.1633498565212;
 Tue, 05 Oct 2021 22:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211005123645.2766258-1-sumit.garg@linaro.org>
 <CABCJKuesYcGdKLi1YqHP3PU5n6vf-3Q-A+UNyCLzsoJ+0oiKmw@mail.gmail.com> <20211005153523.GD6678@C02TD0UTHF1T.local>
In-Reply-To: <20211005153523.GD6678@C02TD0UTHF1T.local>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 6 Oct 2021 11:05:52 +0530
Message-ID: <CAFA6WYMvVuwAsU09iW7LonZGK92hX2rH3f8Xtktqs6t1wVtLUw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: ftrace: use function_nocfi for _mcount as well
To: Mark Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, ben.dai@unisoc.com, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Daniel Thompson <daniel.thompson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mark, Sami,

On Tue, 5 Oct 2021 at 21:05, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Tue, Oct 05, 2021 at 08:20:02AM -0700, Sami Tolvanen wrote:
> > Hi Sumit,
> >
> > On Tue, Oct 5, 2021 at 5:37 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > >
> > > Commit 800618f955a9 ("arm64: ftrace: use function_nocfi for ftrace_call")
> > > only fixed address of ftrace_call but address of _mcount needs to be
> > > fixed as well. Use function_nocfi() to get the actual address of _mcount
> > > function as with CONFIG_CFI_CLANG, the compiler replaces function pointers
> > > with jump table addresses which breaks dynamic ftrace as the address of
> > > _mcount is replaced with the address of _mcount.cfi_jt.
> > >
> > > This problem won't apply where the toolchain implements
> > > -fpatchable-function-entry as we'll use that in preference to regular -pg,
> > > i.e. this won't show up with recent versions of clang.
> > >
> > > Fixes: 9186ad8e66bab6a1 ("arm64: allow CONFIG_CFI_CLANG to be selected")
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > > ---
> > >
> > > Changes in v2:
> > > - Added fixes tag.
> > > - Extended commit description.
> > > - Picked up Mark's ack.
> > >
> > >  arch/arm64/include/asm/ftrace.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> > > index 91fa4baa1a93..347b0cc68f07 100644
> > > --- a/arch/arm64/include/asm/ftrace.h
> > > +++ b/arch/arm64/include/asm/ftrace.h
> > > @@ -15,7 +15,7 @@
> > >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> > >  #define ARCH_SUPPORTS_FTRACE_OPS 1
> > >  #else
> > > -#define MCOUNT_ADDR            ((unsigned long)_mcount)
> > > +#define MCOUNT_ADDR            ((unsigned long)function_nocfi(_mcount))
> > >  #endif
> > >
> > >  /* The BL at the callsite's adjusted rec->ip */
> > > --
> > > 2.17.1
> > >
> >
> > Clang >= 10 supports -fpatchable-function-entry and CFI requires Clang
> > 12, so I assume this is only an issue if
> > CONFIG_DYNAMIC_FTRACE_WITH_REGS is explicitly disabled?
>
> I don't believe it's possible to disable explicitly, since
> DYNAMIC_FTRACE_WITH_REGS isn't user selectable, and is def bool y,
> depending on HAVE_DYNAMIC_FTRACE_WITH_REGS.
>

Ah, I see.

> Sumit, have you actually seen a problem, or was this found by
> inspection?
>

Actually I have seen this ftrace problem with the android11-5.4-lts
kernel and AOSP master user-space on db845c. The reason being kernel
v5.4 LTS doesn't support ftrace with -fpatchable-function-entry on
arm64.

With the mainline, I haven't tried to reproduce this issue but it was
rather by inspection that this needs to be fixed as well.

> If this isn't an issue in practice, we could add the funciton_nocfi()
> for consistency, but we should make that clear in the commit message,
> and drop the fixes tag.

Sure, let me drop the fixes tag and update the commit description in
v3 as mainline only enabled CFI_CLANG for arm64 when
"-fpatchable-function-entry" is supported.

-Sumit

>
> Thanks,
> Mark.
