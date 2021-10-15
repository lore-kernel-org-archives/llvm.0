Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FDD2C83
	for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 18:42:55 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id v195so25025165ybb.0
        for <llvm@lists.linux.dev>; Fri, 15 Oct 2021 11:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YyFndEo3gUR+eMx/EaHlI/+HLKDJ+s4HAj68KJojv2E=;
        b=MbkkXxRw1l7BoouF3CrgxtsPPhDu1KnBZaY06+EdyKH1pO6POgMfNhqvlqd6DsgXlq
         ezhS9Gd12dfBMPidYDxcylK0EZgaXQcxtRmXvaQEjcEjvgB8IbWAz9E1bZRwJAIrRqo2
         bHjc0L4ctaVMPcb/OR5YAUjiVd62l+Kn5ZBTpWWQ7cx+6wZJqjhsZV1jpqCMWkb8e8oS
         q5od3+7tLzc+ciaOMd6t36bhGtfqsDKQDzNBQkLHH1tNtkxIdW8M+ljHCQXdsKxwjyC1
         WqxnjKiUYq0D0Qv4P/i8ZiemKmyDGSbDwdHvNonz58bB/4+5GZIOD03WNN/2uU7WBOMw
         RjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YyFndEo3gUR+eMx/EaHlI/+HLKDJ+s4HAj68KJojv2E=;
        b=NzSjOKRd33A4iM+xHSPt1lVbDklBiswKbWGa9L+WyXCLd+wl/LtsGc/wUoirHWkP+e
         13UEHsAcjEx7E5cxmbQbnjGdP5TrV232DlLpnuMMLwqutEJlWABzTjpYMqheGygOMHNL
         KhDaN4x3htJLMM6unkc9OgW9AOOpT4+O1f8nvpsiPAOeZ6zTr1z89+KrOfN4/io4LsLC
         MMP6YAsuX6fGAa5UPKyAisdT8oKRpNZv4pFK9o/1LWHQInoP8/uqAmgd2dK0Bh3IpWeJ
         wYbl0GrFpcnPcSCftdMMy3cDkSpdw05L2GmNwnGOPjxufMgCfvpNjhisIXq+jFMOe8dw
         GWkg==
X-Gm-Message-State: AOAM530adbZyRMRVuFN3jlC5XSP2G544VqtRDjeZ5bOpmAUbyp+FW1vq
	U6BrYwdZf+DIlReG5bpDKRFTLW22qzv5dBqUOhTFVg==
X-Google-Smtp-Source: ABdhPJzHhDNJ92BDjbL3eNowitqNJl7sbLIc9MyypGUdc+46JWKxEJW9d9Z/0MDyie59LcpfhOWnx7jOWMeN1OLfsFQ=
X-Received: by 2002:a25:cf8f:: with SMTP id f137mr15531922ybg.338.1634323374308;
 Fri, 15 Oct 2021 11:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-4-samitolvanen@google.com> <7377e6b9-7130-4c20-a0c8-16de4620c995@www.fastmail.com>
 <8735p25llh.ffs@tglx> <87zgra41dh.ffs@tglx>
In-Reply-To: <87zgra41dh.ffs@tglx>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 15 Oct 2021 11:42:43 -0700
Message-ID: <CABCJKuc+mN4vw_sanZQKcb1=SyfT4h3JK2wpBuaB2qZH3Croxg@mail.gmail.com>
Subject: Re: [PATCH v5 03/15] linkage: Add DECLARE_NOT_CALLED_FROM_C
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, "the arch/x86 maintainers" <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 10:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Fri, Oct 15 2021 at 17:55, Thomas Gleixner wrote:
> > On Thu, Oct 14 2021 at 19:51, Andy Lutomirski wrote:
> >> On Wed, Oct 13, 2021, at 11:16 AM, Sami Tolvanen wrote:
> > That still tells me:
> >
> >     1) This is a function
> >
> >     2) It has a regular argument which is expected to be in RDI
> >
> > which even allows to do analyis of e.g. the alternative call which
> > invokes that function.
> >
> > DECLARE_NOT_CALLED_FROM_C(clear_page_erms);
> >
> > loses these properties and IMO it's a tasteless hack.
>
> Look:
>
> SYSCALL_DEFINE2(set_robust_list, struct robust_list_head __user *, head,
>                 size_t, len)
>
> Not beautiful, but it gives the information which is needed and it tells
> me clearly what this is about. While the above lumps everything together
> whatever it is.

Sure, that makes sense. Ignoring the macro for a moment, how do you
feel about using incomplete structs for the non-C functions as Andy
suggested?

> Having __bikeshedme would allow to do:
>
>    __hardware_call
>    __xenhv_call
>    __inline_asm_call
>
> or such, which clearly tells how the function should be used and it can
> even be validated by tooling.

Previously you suggested adding a built-in function to the compiler:

https://lore.kernel.org/lkml/877dl0sc2m.ffs@nanos.tec.linutronix.de/

I actually did implement this in Clang, but the feature wasn't
necessary with opaque types, so I never moved forward with those
patches. A built-in also won't make the code any cleaner, which was a
concern last time.

I do agree that a function attribute would look cleaner, but it won't
stop anyone from mistakenly calling these functions from C code, which
was something Andy wanted to address at the same time. Do you still
prefer a function attribute over using an opaque type nevertheless?

> You could to that with macros as well, but thats not what you offered.
>
> Seriously, if you want to sell me that stuff, then you really should
> offer me something which has a value on its own and makes it palatable
> to me. That's not something new. See:
>
>   https://lore.kernel.org/lkml/alpine.LFD.2.00.1001251002430.3574@localhost.localdomain/
>
> That said, I still want to have a coherent technical explanation why the
> compiler people cannot come up with a sensible annotation for these
> things.

I can only assume they didn't think about this specific use case.

Sami
