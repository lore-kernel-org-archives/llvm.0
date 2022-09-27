Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13194C64
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 20:01:47 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id b23so10607088pfp.9
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SNLo4c9BXtM0z8UOQgf5tFMG8y138Obd6dyre72qoDc=;
        b=YGNnK0RD7gMznPaSdiz+8/9d+mAhbgcMjrKjGfS4Ua0g7pNb438g/v79EXPXkPfnuH
         a5DqrcBgZSyqMknfCCnZfSt2baOkOFcOiroT+L7+Mns7eHGbtweRaw5F1DOX7AN7wicX
         Llm+dO8eq5ifmRMGFFRawrgjjoHFYDxkKzBKoKZZLmxGEmWFUV1/a8n+k5wS8imXAVaC
         QKINXr+UsuuOyH/ho3RNnrdCHxmI6WQ55Ed+OZmL5HR6b/jHFxAjSrzKSRocPL7eQ1j7
         xZ2jVnhxMjMrRnbdIDcBPxHFcgCbvdKyHpNkMiCFxOe57ZZhYrE40AIhvoC15AQYbOOy
         MxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SNLo4c9BXtM0z8UOQgf5tFMG8y138Obd6dyre72qoDc=;
        b=bpj0QhICStBmx2Iyy7W7CGqvWrIIwRHpCD5DZL4GwNgXlCZfUrh2oelWzBD5KdKNop
         OnZ1pndrsd+G2wav2SG3BMXrZeyFZoy1SpZRXV5g8C7FVvX7HJaNVRV40PHe5YXypmOe
         b5GsxLTerjra74Dla5ChziRXOTOXkJMm5nghgOfaPi+C7j1K++/EuXWxsEAvcVrMsyom
         n3oSQG4cOYxMBBLEqvR3AfVeWYVCAaJ/owvyg6hTQMgxj30Kxz2lKW1WjIHwl3usH+vT
         oMsnyr2q/psrLbWgRbgj83Kc9gWV0uX7G5hgJ4KJv36NsjR3d7XU1QW45ipIQQMrnBnR
         N6Dg==
X-Gm-Message-State: ACrzQf3dtNw0Ozyall50qCCyUdhf+lFFV494wjzbov2+Q357Hk9VRXFS
	EbVYnolr52x03pWGM1ZuHpIb7+4s7qRdmMEtKCakFw==
X-Google-Smtp-Source: AMsMyM5nUZ7pJPZM0NapVjvtCoXp0CCfy1zzFCgNJOsgpQxvYoYW8apQuNO9SAObnHlget6TUmiX9lei/L0iloYqEGQ=
X-Received: by 2002:a62:1ad5:0:b0:540:4830:7df6 with SMTP id
 a204-20020a621ad5000000b0054048307df6mr30046652pfa.37.1664308907250; Tue, 27
 Sep 2022 13:01:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOd=a+0VNP-d=mHnbM4ujdtPrujru4dxHtfDo+EEM+b6deg@mail.gmail.com>
 <20220927172839.3708280-1-ndesaulniers@google.com> <202209271143.7B7D15D@keescook>
In-Reply-To: <202209271143.7B7D15D@keescook>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 27 Sep 2022 13:01:35 -0700
Message-ID: <CAKwvOdk1QM4iZqEVj5MzTW3jMr1FiD_0C065Kub=EHKnH+xNaw@mail.gmail.com>
Subject: Re: [PATCH v2] x86, mem: move memmove to out of line assembler
To: Kees Cook <keescook@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, llvm@lists.linux.dev, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 27, 2022 at 12:24 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Sep 27, 2022 at 10:28:39AM -0700, Nick Desaulniers wrote:
> > In addition to having complex constraints that can't always be resolved,
> > the clobber list seems to be missing %bx and %dx, and possibly %cl. By
> > using numbered operands rather than symbolic operands, the constraints
> > are quite obnoxious to refactor.
> > [...]
> > -             /*
> > -              * Move data from 2 bytes to 3 bytes.
> > -              */
> > -             ".p2align 4\n\t"
> > -             "9:\n\t"
> > -             "cmp $2, %0\n\t"
> > -             "jb 10f\n\t"
> > -             "movw 0*2(%1), %%dx\n\t"
> > -             "movw -1*2(%1, %0), %%bx\n\t"
> > -             "movw %%dx, 0*2(%2)\n\t"
> > -             "movw %%bx, -1*2(%2, %0)\n\t"
> > -             "jmp 11f\n\t"
> > [...]
> > +.set tmp0, %edi
> > [...]
> > +     /*
> > +      * Move data from 2 bytes to 3 bytes.
> > +      */
> > +.p2align 4
> > +.L4_byteswap:
> > +     cmpl    $2, n
> > +     jb      .Lbyteswap
> > +     movw    0*2(src), %di
> > +     movw    -1*2(src, n), %bx
> > +     movw    %dx, 0*2(dest)
> > +     movw    %bx, -1*2(dest, n)
> > +     jmp     .Ldone
>
> Found it (need to use %di instead of %dx). With this changed, the kunit
> test passes again:
>
> diff --git a/arch/x86/lib/memmove_32.S b/arch/x86/lib/memmove_32.S
> index 73314a391a72..9e33c9a1c595 100644
> --- a/arch/x86/lib/memmove_32.S
> +++ b/arch/x86/lib/memmove_32.S
> @@ -179,7 +179,7 @@ SYM_FUNC_START(memmove)
>         jb      .Lbyteswap
>         movw    0*2(src), %di
>         movw    -1*2(src, n), %bx
> -       movw    %dx, 0*2(dest)
> +       movw    %di, 0*2(dest)
>         movw    %bx, -1*2(dest, n)
>         jmp     .Ldone

That was stupid of me, I updated the scratch register operand in the
instruction 2 before the one at issue and forgot to update the operand
for the register in question, breaking the swap.

I'll use .set directives to give these more descriptive names to avoid
such a mistake.

.set tmp0w %di

then use tmp0w everywhere.  I will give names to the remaining
register operands, too.

Off thread, can you show me how to run the kunit tests, please?

Will send a v3 shortly.

>
> -Kees
>
> --
> Kees Cook



-- 
Thanks,
~Nick Desaulniers
