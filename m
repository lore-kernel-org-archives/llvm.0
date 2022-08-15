Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768051C38
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 15:58:41 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s11so10091685edd.13
        for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Kw9cCSp2v6lTn00tET+V9Ob4XlH+2ZWKz74aJFYqrBc=;
        b=OOAA4IE6YBl7I5aP5vqsyGb/fF3W0qtrjDDLFG25fNI3zcQhBBR6oZzj2bRlF76zjV
         vjxur8+z8enpP3yFWyEk6jUzu1VUyVgsKZ3N5vJ0h2l2qkeVgA0yXpE4niDvp8ilL/Zd
         gjRsa5+9mR31oxFzFIq254w04NLlaQgVTVcBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Kw9cCSp2v6lTn00tET+V9Ob4XlH+2ZWKz74aJFYqrBc=;
        b=eP76jkO0NQujpu/IecIqgq+GWQPOKKMt+KhRGIZT112bw0XT2OQ7+L5r47nh+vAged
         ffhSjdjNcjLTZOwb3Q4rONwjYLiOOzYpXlIoMu5qvmz3AmRqeMSdJGprN4UTxF4GUZzu
         KL+ALRUGu3kCVVBfNMUX030nmc91MczYsTmL4LpVb/3aAEBZEBIDnhNUiR0qSjlwdiyv
         IPAIrpsdbeAlm+A2k970ewf2PVEHQEJ4qV60GZ666MD1/rzSe5dFAr9jt5fMrEktaenL
         xh3MurIZejSJ9FA9BPfwUSDhFhaJHhRnz6aVgIwnas4zS0J3sKXRM8IXb9NiXtPpHHhl
         FLew==
X-Gm-Message-State: ACgBeo2VPddt6Abu/cFq2QPzo7q8e+Axhd+LJbww3iAhAT9NvazhYHI7
	wzZA7tjYig1mZSeyUflZHHW61Dd7GXDWou8O
X-Google-Smtp-Source: AA6agR6BR2Fok8M3DJ2iULwxG1I9KqSBioB+f0wq7dtwHgwqisFd0ebDaLKeJgDFEHfeGq4n5VJONA==
X-Received: by 2002:a05:6402:26cb:b0:43e:6fab:11c6 with SMTP id x11-20020a05640226cb00b0043e6fab11c6mr14440850edd.272.1660579119453;
        Mon, 15 Aug 2022 08:58:39 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id t20-20020aa7d714000000b0043a554818afsm6809224edq.42.2022.08.15.08.58.37
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 08:58:38 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id r83-20020a1c4456000000b003a5cb389944so4097124wma.4
        for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 08:58:37 -0700 (PDT)
X-Received: by 2002:a05:600c:3556:b0:3a5:f526:cdb4 with SMTP id
 i22-20020a05600c355600b003a5f526cdb4mr3233474wmq.145.1660579117166; Mon, 15
 Aug 2022 08:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wh1xHi-WeytuAK1-iSsR0wi=6e4-WgFq6ZPt8Z1mvqoNA@mail.gmail.com>
 <Yvny9L3tw1EolqQ4@worktop.programming.kicks-ass.net>
In-Reply-To: <Yvny9L3tw1EolqQ4@worktop.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Aug 2022 08:58:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnEN3Apb5gRXSZK7BM+MOby9VCZe3sDcW34Zme_wk3uA@mail.gmail.com>
Message-ID: <CAHk-=whnEN3Apb5gRXSZK7BM+MOby9VCZe3sDcW34Zme_wk3uA@mail.gmail.com>
Subject: Re: Simplify load_unaligned_zeropad() (was Re: [GIT PULL] Ceph
 updates for 5.20-rc1)
To: Peter Zijlstra <peterz@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jeff Layton <jlayton@kernel.org>, 
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 12:17 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> So obviously we could use _ASM_EXTABLE_TYPE_REG together with something
> like: "mov (%[reg]), %[reg]" to not depend on these fixed registers, but
> yeah, that doesn't seem needed. Code-gen is fine as is.

I looked at using TYPE_REG, but it got *much* more complicated for no
obvious gain.

The biggest downside of the fixed registers is actually the address,
which in the fs/dcache.c case doesn't matter (the address is just in a
register anyway, and the compiler can pick the register it wants to
and seems to happily pick %rdx).

But in fs/namei.c, the code *used* to be able to use register indexed
addressing, and now needs to use a 'lea' to generate the address into
a single register.

Using _ASM_EXTABLE_TYPE_REG wouldn't help that case - we'd have to
actually disassemble the instruction that faulted, and figure out the
address that way. Because while the fault itself gives us an address,
it gives us the address of the fault, which will be the first byte of
the next page, not the beginning address for the access that we want.

And no, disassembling the instruction wouldn't kill us either (we know
it's a "mov" instruction, so it's just the modrm bytes), but again it
really didn't seem worth the pain. The generated code with the fixed
registers wasn't optimal, but it was close enough that it really
doesn't seem to matter.

> > +     regs->ip = ex_fixup_addr(e);
> > +     return true;
>
> I think the convention here is to do:
>
>         return ex_handler_default(e, regs);

Ahh, yes, except for the FP case where we restore it first (because
the code seems to want to print out the restored address for some
reason).

I had just started with the ex_handler_default() implementation as the
boiler plate, which is why I did that thing by hand.

Will fix.

The other question I had was actually the "return false" above - I
decided that if the address of the fault does *not* match the expected
"round %rdx up" address, we shouldn't do any fixup at all, and treat
it as a regular kernel oops - as if the exception table hadn't been
found at all.

That seems to be a good policy, but no other exception handler does
anything like that, so maybe somebody has comments about that thing?
All the other exception handler fixup functions always return true
unconditionally, but the fixup_exception() code is clearly written to
be able to return 0 for "no fixup".

I may have written that code originally, but it's _soo_ long ago that ....

              Linus
