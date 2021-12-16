Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00BB168
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 19:58:34 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id d10so158299lfg.6
        for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 11:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RN/NMu5d0oivOUfeNE/zhdxce8wdPlEOf3JJtPqlHy0=;
        b=EA1GYY1osrfwxYs38rQ20hSE9+mtWr4+bdNYmCGJacbacPbJoJM0E5VOu6gC16nDqt
         bKauoWYaORQ10iJ7XKWXXlpzR0U++WAyJqc20FGj0nzxYXNprACE57Yu4x/wP+cJDw3p
         EqLen8171auYGKTCkq2qlaT2rLG0mJxf4zx4KxzNVamhX0E27dxXxi9gk/dSQrnhGUIa
         WaGe1Nh4HduJsbFCJkg2xuwbxvUDoNyyxsHq9+zksUNzHseGAw8M+RFyx8ah9ZpTJve5
         Ahn/caMma5iJPiFgJUZCEr/FY5DrqkgXAn5GRrZX9V3O2Md/53xSGXtWxqlE2G11YDlR
         FtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RN/NMu5d0oivOUfeNE/zhdxce8wdPlEOf3JJtPqlHy0=;
        b=NRyXxalBcmAL4/wUgfAkHW7QLmM+QnpJPNB+t873ug8Kta3bERLQh5QcgUg5cyaAUp
         X3GgtqvSQOjzXLiLuywIqqTmkVtjYDdm0g/WvMZCV3zulpKArTOV78emch1E8WVQaEre
         OZ+UzqNmsFaKzLa3y7qphjVv2BwDgKLbjIaiF4Rssg+0dWfp8rXHpNxgZPvFnz2gY/a3
         xQxzVmyps8clSswKsHOxcaSTCX9YYPMBpB4nM+ofdm27n7dQbWrwfpNYqsV+WsJW/ynD
         EgAiOBgy8pFUJlnyyHXSYgHRqCf1TO6TWHk0tWENeu9OkfkVJxz+iVHiLCBdohLCa91N
         s5Fw==
X-Gm-Message-State: AOAM533vwqazpuFDs9E8NLMLUASXkO6NeWbjdf5y3IcbYOfcK8MkhE5C
	v7SPuXkyBtLsNzkHwAthEF0KF2uAvANF+uEHEISB+w==
X-Google-Smtp-Source: ABdhPJyq5DYDh4jEOHCwiyOOUElXnojMJYEY7cm/5KjNbs/dlFIT2Vo5bamzTutEhmL9mfhE9xThIEb920y1Umz26RI=
X-Received: by 2002:a05:6512:3d16:: with SMTP id d22mr15757836lfv.523.1639684712664;
 Thu, 16 Dec 2021 11:58:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211215211847.206208-1-morbo@google.com> <87mtl1l63m.ffs@tglx>
In-Reply-To: <87mtl1l63m.ffs@tglx>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 16 Dec 2021 11:58:20 -0800
Message-ID: <CAKwvOdnCEzHf-pUxz3aJLhW5L-LhKFUtDkfRZ0PgLy7sCqDGgA@mail.gmail.com>
Subject: Re: [PATCH] x86: use builtins to read eflags
To: Bill Wendling <morbo@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 15, 2021 at 4:57 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Bill,
>
> On Wed, Dec 15 2021 at 13:18, Bill Wendling wrote:
>
> please always CC the relevant mailing lists, i.e. this lacks a cc:
> linux-kernel@vger.kernel.org
>
> It's not that hard to figure that out because it's well documented.

For example, for every patch I send, I _always_ do:

$ git format-patch HEAD~
$ ./scripts/checkpatch.pl <patchfile>
$ ./scripts/get_maintainer.pl <patchfile>

Then put the above in my invocation of `git send-email` with
maintainers explicitly in --to and lists+everyone else on --cc.

> > GCC and Clang both have builtins to read from and write to the
> > EFLAGS register. This allows the compiler to determine the best way
> > to generate the code, which can improve code generation.
>
> Emphasis on *can*. Just claiming that this might improve things does not
> cut it. Where is the prove?

At the least, I expect the compiler *could* re-schedule the
instructions in the pair, which it *cant* do for inline asm. Whether
it *would* or if that's a win performance wise...*shrug*.  I'd expect
the estimated code size to be more accurate, too.

>
> IIRC, this was proposed before and the real reason was not better code
> generation but to address the confusion of clang vs. the '=rm'
> constraint which is still correct despite some clang folks having
> different opinions.
>
> So what has changed since then? AFAICT, nothing. So I consider this as
> another attempt of "let's see whether it sticks".

I wouldn't resend this kernel change until the builtins were fixed
first.  I think Reid and Phoebe's suggestion in:
https://reviews.llvm.org/D92695#inline-1086936
is probably a good start?

Once fixed, say in clang-14, the next question becomes "are we trading
sub-optimal codegen for worse codegen with previously released
versions of clang?"

Otherwise for "rm" I suspect that the code I read recently is
partially related to the issue at hand.
https://github.com/llvm/llvm-project/issues/20571#issuecomment-992965798
See this comment in source:
https://github.com/llvm/llvm-project/blob/9043c3d65b11b442226015acfbf8167684586cfa/llvm/lib/CodeGen/SelectionDAG/TargetLowering.cpp#L5002-L5003

IIRC, I think you (Bill) mentioned somewhere before that we might need
a new TargetLowering::ConstraintType, perhaps something like
`TargetLowering::C_Register_Or_Memory`?  I suspect that the
conservative approach of "m" being chosen over "r" in "rm" is to avoid
register exhaustion during register allocation.  I'm not sure if the
`TargetLowering::ConstraintType` or `TargetLowering::AsmOperandInfo`
makes it through to register allocation, but I'd imagine if they did
then we'd first try to allocate these to a register, and if there was
later register pressure, we could then consider these as a possible
spill candidate, evicting them from a dedicated physical register.

Take that with a grain of salt; while that sounds nice, it's not often
I've touched register allocation!  I've also only really studied the
greedy register allocator.

On Thu, Dec 16, 2021 at 11:55 AM Bill Wendling <morbo@google.com> wrote:
> The minimal version of GCC is now 5.1, which supports these builtins.
> That wasn't the case before.

That's worthwhile to put in the commit message.
-- 
Thanks,
~Nick Desaulniers
