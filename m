Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CD92908
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 15:20:39 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id d12so26588629ybc.4
        for <llvm@lists.linux.dev>; Mon, 02 May 2022 08:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VG2N1KHd1YR2ZF1sjkCgsuS94s3wv0dEZ2AS2biKRuc=;
        b=nCCr/m44vAOB3fWxcTwSvULnXuiNVu4xAEa/q8PX0e8wp//HRJ3pAwZlfI8oXQakqb
         PBNA5VrluDTvJXwHjjEqKVrz+t1ZAhOuAy0UZ/lpPuIF5TfAQhvGp0eP9kDlGthADP7B
         jQS2jgmlIf2O2YIMWFKayiS6OkGnXXTuI6mSozGLIgWSqWTudoL0mragtOrIMycv0iNu
         cZvbiKKjzeuQMjCAHgd1ar9MSdep3a1AilDwleb2gMChOjj8zJLFVuMg4VeHUCWQC8gh
         4i9wU09zBuZyOBMRAX6+2An3+4aqYMkmsLVezmWAt06zT2xLERXvPiNYHUXkJ6I1taeF
         kDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VG2N1KHd1YR2ZF1sjkCgsuS94s3wv0dEZ2AS2biKRuc=;
        b=aSEA/Q6BRfQ+Qr+VcPaVfZoj4DVXR/QTQXKLaPuh2jNeKcdBsbFgY1Ap0nGyMhEfar
         cqANlEhwD+/gen6Qj4/pkDv+0mDTucmm0F2/Vmu7KpkuzWwKlEnd4CyauIASWhYs7bAo
         m+Cc5xpC0zd849N6EM+78k05zImzP/ezYRymhLTgsI509/r6r7nb35y5iQHGpXE79WEa
         1s51uBxuFjYPu23SpUJZt8ZoAN56hRa6C4IT+bfUz77+M7FOGqBELmrsXUb02WfAkrst
         MEtTCj7UGAqDL8UcfNrLN2H+cNrvPUV5m1mcdDrDQn/dFmdUQhQ/OtUvAj0pZwY71EmS
         BbCQ==
X-Gm-Message-State: AOAM530xGyMC4yzosvs1PKTZrWOxhDExBeFw0O45sBb4q3/5nmVkWwGL
	sw5v2k61NClUCh1HWdOrlBJKcE6SIFH+jT7GK2IehA==
X-Google-Smtp-Source: ABdhPJzqk8+IJH8fkyTp0bTuIuMWgJsHqUrnpAZSbYcMmkZ/+21K1dsNoH6iUg94I0Y7z6gpiKYrRf3BnqDN09p5vbs=
X-Received: by 2002:a25:3455:0:b0:648:44db:51e0 with SMTP id
 b82-20020a253455000000b0064844db51e0mr10124096yba.314.1651504838091; Mon, 02
 May 2022 08:20:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
 <20220429203644.2868448-22-samitolvanen@google.com> <Ym0ASy87mE3r3EVE@hirez.programming.kicks-ass.net>
In-Reply-To: <Ym0ASy87mE3r3EVE@hirez.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 2 May 2022 08:20:05 -0700
Message-ID: <CABCJKucK39XnVPA=EhLSJ+vcgVLCSgnGzLrRy9tZSM2jzZtUBg@mail.gmail.com>
Subject: Re: [RFC PATCH 21/21] x86: Add support for CONFIG_CFI_CLANG
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 30, 2022 at 2:24 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Apr 29, 2022 at 01:36:44PM -0700, Sami Tolvanen wrote:
> > -     if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN) {
> > +     if (report_bug(regs->ip, regs) == BUG_TRAP_TYPE_WARN ||
> > +         report_cfi(regs->ip, regs) == BUG_TRAP_TYPE_WARN) {
>
> This way you'll first get a BUG splat and then tack on the CFI thing.

The CFI ud2 isn't in the bug table, which means find_bug returns
BUG_TRAP_TYPE_NONE and report_bug bails out before printing out
anything.

Sami
