Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BA2158E
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 16:56:15 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id y129so57912058ybe.7
        for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 08:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YlbnjTvgntnfVcOa/EhaC2z63qHnpSdTA6htlssL+WQ=;
        b=bk46Vhc2ajd84HHhGeRXsqLbc/cGSRyxZX/c1Llf14vsw65KsEUPwwU9HPp51fw4Xq
         3q58SrpUFqhbH2GFeBSprgbQTqriEp3/k5p2gQ976nKGKFWKCxBix+9i5VvHuh02/sun
         oO+En9eTYtfeMyiHeEoOlNEcIyYqM54DuS3oAOG8pDKIjRaEFME7K5qYBUmK36bwP/4X
         GVpDqdTe1cmb79rWnDO0cRl7vsVSnibSGnWzvo809InInrTuGPFphqNB30AxGC1UcaYI
         FKoXi0Ewc+M7Rxg1/S59gYqmJurInYl7YAmAIcivnj9uXodYpXdUKOlQT/LoTJgQNuQF
         P0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YlbnjTvgntnfVcOa/EhaC2z63qHnpSdTA6htlssL+WQ=;
        b=JQJ2qjMXKQB5EFbP7v3XSkNWGs6VT8L+fUdyetbtio1GRDysWnc2TnsSC78Vq5T1+Q
         Qurc1aR2y+E2JZ8xY/qHNVQDDbuE4mDD1FcR0HUklklL6IF5iVvf+N+/+qYFVNjdvwg2
         l21DRwLq59Zn01tIXVMMsCRg5ZFZ/I8hq+Zj+WJ112OSw2QWSCGa/IqjkRYnUzVZ0j8K
         W4/ZzPaUDUePDvW/0HS444SCEVRzD6o7ARTOfRXb/BEY5jpfV7ONTKmqRLDRGe9TeY3K
         7G3IYFq2uaCFVe9l2wjjvKupWEIl74ApKYoAHCxEWsCJaBW7H6nIWZAQxG+hFRUA4iOE
         n4/g==
X-Gm-Message-State: AOAM530b8L8S6CIJiIYPg0QNzSPs612bU+GYgNhDBkt1omekP+4iGleZ
	voixkGcrHskMLKFdsvr1GycQKs63FjUx90vWMKNc5g==
X-Google-Smtp-Source: ABdhPJzikU0YU5BH/siNLMr0CFiPW39DzXn9G0PWcetR0q2McVSRzNwb57LXXgFzjHK4V7Q5u7TpAbaWPvg5gf658uk=
X-Received: by 2002:a25:1845:: with SMTP id 66mr4653694yby.196.1644944174316;
 Tue, 15 Feb 2022 08:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211122170301.764232470@infradead.org> <20211122170805.338489412@infradead.org>
 <6ebb0ab131c522f20c094294d49091fc@overdrivepizza.com> <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com> <202202082003.FA77867@keescook>
 <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com> <20220211133803.GV23216@worktop.programming.kicks-ass.net>
 <CABCJKuciRBnz4JxBDJC=+kuJn4pU2uBkWPBov7-VL2o2j0F4SA@mail.gmail.com> <20220214222550.GB23216@worktop.programming.kicks-ass.net>
In-Reply-To: <20220214222550.GB23216@worktop.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 15 Feb 2022 08:56:03 -0800
Message-ID: <CABCJKuf-wouSCh4u43GPQHPPgG=mqOGboSoHPQRfmgQSBkFrMg@mail.gmail.com>
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
To: Peter Zijlstra <peterz@infradead.org>
Cc: Joao Moreira <joao@overdrivepizza.com>, Kees Cook <keescook@chromium.org>, 
	X86 ML <x86@kernel.org>, hjl.tools@gmail.com, Josh Poimboeuf <jpoimboe@redhat.com>, 
	andrew.cooper3@citrix.com, LKML <linux-kernel@vger.kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 14, 2022 at 2:25 PM Peter Zijlstra <peterz@infradead.org> wrote:
> On Mon, Feb 14, 2022 at 01:38:18PM -0800, Sami Tolvanen wrote:
> > I'm fine with adding a trap mode that's used by default, but having
> > more helpful diagnostics when something fails is useful even in
> > production systems in my experience. This change results in a vmlinux
> > that's another 0.92% smaller.
>
> You can easily have the exception generate a nice warning, you can even
> have it continue. You really don't need a call for that.

Sure, but wouldn't that require us to generate something like
__bug_table, so we know where the CFI specific traps are?

> > In this case the function has two indirect calls and Clang seems to
> > prefer to emit just one ud2.
>
> That will not allow you to recover from the exception. UD2 is not an
> unconditional fail. It should have an out-going edge in this case too.

Yes, CFI failures are not recoverable in that code. In fact, LLVM
assumes that the llvm.trap intrinsic (i.e. ud2) never returns, but I
suppose we could just use an int3 instead. I assume that's sufficient
to stop speculation?

> Also, you really should add a CS prefix to the retpoline thunk call if
> you insist on using r11 (or any of the higher regs).

I actually didn't touch the retpoline thunk call, that's exactly the
code Clang normally generates.

> > How would you like to deal with the 4-byte hashes in objtool? We
> > either need to annotate all function symbols in the kernel, or we need
> > a way to distinguish the hashes from random instructions, so we can
> > also have functions that don't have a type hash.
>
> Easiest would be to create a special section with all the hash offsets
> in I suppose. A bit like -mfentry-section=name.

OK, I'll take a look. With 64-bit hashes I was planning to use a known
prefix, but that's not really an option with a 32-bit hash.

Sami
