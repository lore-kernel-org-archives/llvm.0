Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EE67C
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 19:20:06 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id h23so10431214lfe.4
        for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 12:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N0O/0DmbRs+7MXOg+g7dkZYD+/tIewscyvV6ESK7mhQ=;
        b=HOdkBVIWNqU056KIzOpAxtJ+hARPtbhKZh0UFqk2E42MCGc4NI0bbNvqot9YBdek/u
         Aw3Ph3Cy725yYM58fI5EBjLaXvJ3IZA7sMs4+BRmmqE0M72v9SbnlbC8Djtl9NZNb8CU
         H7xn5l0SUfo734b7nIBfFERs63lfF0xmfxBcgkMDR5XHhk1OpUfJdlbEbqovlOtM5bwf
         703+UIJV5z9RrG9/Bi4GYdrekq9nxUWi4WJ77/+tLe180iF3OiNNIn/RGyj+dRjI2oiz
         zU6XL7qBEOCef7JP8Y46wJZV9HCALTmVCCDqgkpsePw0O7mAQ4gHyYbPjTspGXPI7MHe
         T/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N0O/0DmbRs+7MXOg+g7dkZYD+/tIewscyvV6ESK7mhQ=;
        b=DJnqHyAN1WiXhhL13tI+bCjFhQCUZf8fMhHdQP07zm+CXz8xHSQoRqfdAh0c9jEL6l
         UHj4zGBktSrMJQ/zlfP8qNkIxhA9mFH8ON8lPslihWSISGcYkbCaBArLOyD/Hd1WERt7
         QZhI6nT6p2cBnC3z1fF692ZnrwG4p6Tuci91Ri6puHfYSFdrgcSyo9WYliV/vSYGSIrE
         g8M0xjC3Q0PhXagabhOQi8aavAyYZ49UNpRUEsNz/U2r2pZcZ5uXI+aZ5f0MFmemmgXW
         GSDjRAsDql+WvCLmM0f9ndMPHSYTC5ZtxRXllKH7gc13qxGEwAxQY2bKtL2fKKTgHvta
         sywQ==
X-Gm-Message-State: AJIora88j4FJqKMa0YznqcIXDqyO2OQAwxUWTy6G6mghFzJogtMFx/hA
	d3jGeKHesm77MJb4v1LrXz/10lw95SFwj2a54yZo
X-Google-Smtp-Source: AGRyM1slaJnALPt1IdrnDQHmZ2dLpXWUN5aXU49HeMYiktjUgFM+PsAcD+NIJ/T25pitBW8x0Gqc0SCI0hzcZ0fBI0A=
X-Received: by 2002:a05:6512:524:b0:479:898:fd3c with SMTP id
 o4-20020a056512052400b004790898fd3cmr773787lfc.252.1655148003935; Mon, 13 Jun
 2022 12:20:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220610233513.1798771-1-samitolvanen@google.com>
 <20220610233513.1798771-17-samitolvanen@google.com> <CAKwvOdm1Abmu+NQ82ZLgX3O5g4vYPni23A9c4FJ+xeSYVwPtJw@mail.gmail.com>
In-Reply-To: <CAKwvOdm1Abmu+NQ82ZLgX3O5g4vYPni23A9c4FJ+xeSYVwPtJw@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 13 Jun 2022 12:19:52 -0700
Message-ID: <CAGG=3QUt0mCA_Db93kuNkEMFGvO9AJUA4h9wxnVxvUn2Q1Mvqw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 16/20] kallsyms: Drop CONFIG_CFI_CLANG workarounds
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 10, 2022 at 4:40 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Jun 10, 2022 at 4:35 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > With -fsanitize=kcfi, the compiler no longer renames static
> > functions with CONFIG_CFI_CLANG + ThinLTO. Drop the code that cleans
> > up the ThinLTO hash from the function names.
>
> Good riddance!
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
Much clapping!

-bw

> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  kernel/kallsyms.c | 17 -----------------
> >  1 file changed, 17 deletions(-)
> >
> > diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> > index fbdf8d3279ac..2fbb94817e02 100644
> > --- a/kernel/kallsyms.c
> > +++ b/kernel/kallsyms.c
> > @@ -179,7 +179,6 @@ static bool cleanup_symbol_name(char *s)
> >          * character in an identifier in C. Suffixes observed:
> >          * - foo.llvm.[0-9a-f]+
> >          * - foo.[0-9a-f]+
> > -        * - foo.[0-9a-f]+.cfi_jt
> >          */
> >         res = strchr(s, '.');
> >         if (res) {
> > @@ -187,22 +186,6 @@ static bool cleanup_symbol_name(char *s)
> >                 return true;
> >         }
> >
> > -       if (!IS_ENABLED(CONFIG_CFI_CLANG) ||
> > -           !IS_ENABLED(CONFIG_LTO_CLANG_THIN) ||
> > -           CONFIG_CLANG_VERSION >= 130000)
> > -               return false;
> > -
> > -       /*
> > -        * Prior to LLVM 13, the following suffixes were observed when thinLTO
> > -        * and CFI are both enabled:
> > -        * - foo$[0-9]+
> > -        */
> > -       res = strrchr(s, '$');
> > -       if (res) {
> > -               *res = '\0';
> > -               return true;
> > -       }
> > -
> >         return false;
> >  }
> >
> > --
> > 2.36.1.476.g0c4daa206d-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
