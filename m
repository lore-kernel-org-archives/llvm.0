Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04E2C85
	for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 12:53:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id c16so18379824lfb.3
        for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2k/ZaQAzKjqweGateaE0Tvo0NkW9rSK+3Qj4AApTN/4=;
        b=ZSLCxjGX7tQYzbDskYfD626rmaWlza7wsgUXb0BjlkAep29giCuf82iT/Cwp0f2elG
         eiW2+oBxGFnFll/kN5b3ek0W4lXfWyP9dpHscAxui6P3eEU/YRyJJivgyEasyc/TFXZ3
         RMFXgOCaidKQIHzr4rgIzXMtsg6nyHRtJdsY7VgM2cmbLq7eDrrHs3RBmGtDCu/gcoJh
         0Ak9dXhrMC4r15EL79vqVYQNAqi79ut4bdi96lfwL8MWZ/nLo/eITxxiuQvfe5nhUnA3
         m2je+r8iEhEZdm5XFQXeWdz94VqiYeGSkiC5a6QqKtLT9zaae0LjkQUrsptyFxdDDHE2
         PjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2k/ZaQAzKjqweGateaE0Tvo0NkW9rSK+3Qj4AApTN/4=;
        b=LrENWDO8k2hFyySaPfvYhZwlBpIulvlSmG5dmFgUOKux9F8wLNFxOBwYI5gBywf6mN
         e1i11A5SGgXVDYgPtSxCx8WsmM/fs118njfG6qsa3F5o56HE7kv1UeWI4YQKH+6/SvCG
         rXlO61sVwikcTmpBFm6cU0CcHgm0d4ySuGEPzyHMrdAnluQmkjEhk8zz+vf0yAEwIBew
         bhX2hm2GFqtBFF8Hi1XPBqGcWwKfr+8g/Hn1XVj+u2aom0eEWNEUXB2WD5+9YHggIUS1
         4i2sos3Ds/0RwoxDiMJvPT12HSyppIHqNj5vcgYMatFRUvTEPvB6wahEjsNpGtPR0eSU
         fU/g==
X-Gm-Message-State: AOAM530f+cYE+7/cRqzrWe2xZD8Q6iA5SzWBulU4j9G0hbJ3ASkrJzDv
	85wcejGb4yP+dfrNmkIc/f4C5TGew7x9UVHl1LgnDA==
X-Google-Smtp-Source: ABdhPJyARxT64gBM4/0hpaqUPffzx2KLdH47VGZHNVvkpM9nZmnWmJZ9tQxSFqsau9mY0cgtxNDE/kF8mTRRm34gUE4=
X-Received: by 2002:a05:6512:3b94:: with SMTP id g20mr28120003lfv.119.1633956832747;
 Mon, 11 Oct 2021 05:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211005123645.2766258-1-sumit.garg@linaro.org>
 <CABCJKuesYcGdKLi1YqHP3PU5n6vf-3Q-A+UNyCLzsoJ+0oiKmw@mail.gmail.com>
 <20211005153523.GD6678@C02TD0UTHF1T.local> <CAFA6WYMvVuwAsU09iW7LonZGK92hX2rH3f8Xtktqs6t1wVtLUw@mail.gmail.com>
 <20211008080546.GA495@willie-the-truck>
In-Reply-To: <20211008080546.GA495@willie-the-truck>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 11 Oct 2021 18:23:41 +0530
Message-ID: <CAFA6WYPjJ4WUsJf4b=w2vFPnXhxS_vC_SQ-TRK+uwwfVM9HG0Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: ftrace: use function_nocfi for _mcount as well
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, ben.dai@unisoc.com, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Daniel Thompson <daniel.thompson@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Fri, 8 Oct 2021 at 13:35, Will Deacon <will@kernel.org> wrote:
>
> Hi Sumit,
>
> On Wed, Oct 06, 2021 at 11:05:52AM +0530, Sumit Garg wrote:
> > On Tue, 5 Oct 2021 at 21:05, Mark Rutland <mark.rutland@arm.com> wrote:
> > > On Tue, Oct 05, 2021 at 08:20:02AM -0700, Sami Tolvanen wrote:
> > > > On Tue, Oct 5, 2021 at 5:37 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > > > diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> > > > > index 91fa4baa1a93..347b0cc68f07 100644
> > > > > --- a/arch/arm64/include/asm/ftrace.h
> > > > > +++ b/arch/arm64/include/asm/ftrace.h
> > > > > @@ -15,7 +15,7 @@
> > > > >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> > > > >  #define ARCH_SUPPORTS_FTRACE_OPS 1
> > > > >  #else
> > > > > -#define MCOUNT_ADDR            ((unsigned long)_mcount)
> > > > > +#define MCOUNT_ADDR            ((unsigned long)function_nocfi(_mcount))
> > > > >  #endif
> > > > >
> > > > >  /* The BL at the callsite's adjusted rec->ip */
> > > > > --
> > > > > 2.17.1
> > > > >
> > > >
> > > > Clang >= 10 supports -fpatchable-function-entry and CFI requires Clang
> > > > 12, so I assume this is only an issue if
> > > > CONFIG_DYNAMIC_FTRACE_WITH_REGS is explicitly disabled?
> > >
> > > I don't believe it's possible to disable explicitly, since
> > > DYNAMIC_FTRACE_WITH_REGS isn't user selectable, and is def bool y,
> > > depending on HAVE_DYNAMIC_FTRACE_WITH_REGS.
> > >
> >
> > Ah, I see.
> >
> > > Sumit, have you actually seen a problem, or was this found by
> > > inspection?
> > >
> >
> > Actually I have seen this ftrace problem with the android11-5.4-lts
> > kernel and AOSP master user-space on db845c. The reason being kernel
> > v5.4 LTS doesn't support ftrace with -fpatchable-function-entry on
> > arm64.
> >
> > With the mainline, I haven't tried to reproduce this issue but it was
> > rather by inspection that this needs to be fixed as well.
> >
> > > If this isn't an issue in practice, we could add the funciton_nocfi()
> > > for consistency, but we should make that clear in the commit message,
> > > and drop the fixes tag.
> >
> > Sure, let me drop the fixes tag and update the commit description in
> > v3 as mainline only enabled CFI_CLANG for arm64 when
> > "-fpatchable-function-entry" is supported.
>
> Did you post a v3? Just want to make sure I didn't miss it.
>

Apologies for the delay, here [1] it is.

[1] https://lkml.org/lkml/2021/10/11/485

-Sumit

> Will
