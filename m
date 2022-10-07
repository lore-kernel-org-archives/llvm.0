Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442C95380
	for <llvm@lists.linux.dev>; Fri,  7 Oct 2022 22:55:10 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id a23so5811055pgi.10
        for <llvm@lists.linux.dev>; Fri, 07 Oct 2022 15:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rtoZt27StfCUmX+Bnz3gqQ40JrFnPYdCDaiJ+WdcE2I=;
        b=O4FzzAzt8PMUC+TkOyyRMf3xSZI0c6cT+ueviXF2ICIKJ+guY6PjTyhMjIRxKIBj/v
         DZjKSG7YFiJQYd53b6YdCTDTjFAusIuw3FyQjWCBGzzwq/OZL3zScBgq7Kn2ZE/oIVU0
         2gKCZvl/IlARDEimjpvPwZO01vBCNN0cBXzE7Sl9YOZIfML0fxgQwu3sw6dnJXA34XLK
         LZH7Zag7hQybphtYetu8IKgfub7kAw8sC0JTwmlMoQ/WVrqOxDfA11FFpLdDv60jJXus
         6+Bb+WgApraXNrYLvlvEhwmN5L0x1o4I0YOlA0cMYcBknpGn8awfPFH7oQB101ArUNBH
         wf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtoZt27StfCUmX+Bnz3gqQ40JrFnPYdCDaiJ+WdcE2I=;
        b=o4P4b9Iu+5OC3DUBtgYDHxYa3rN9TyHCMsgAL9dBXxaJ/5/hZa6ulc+NVfphZe7PJr
         tfjZ6acs+KKHH4XsGBoDBD4XSyWTQ8EsTcN4ztlaWpAv/Fcr9UptcouT9LX7D4VnPPR1
         pNzc7yzL2m06OaodnZF3F8beBENHsn/6zZ9wN2/Y3IOFHyKRg5PBQ3XwQQXJJt3vWNoM
         SXvbJn28lir+4aPi38Zt/JEkKevNnImNMzf64fiQiJOTHZMnZSin2IOfvOFRc2LDNQv4
         brRqD8rtLnp4l+q3vGQh+WyR9Xp5R+pckQ1vqzHTitDs7tAhjTj3xlhSMsCY7EWzuOkT
         vR1g==
X-Gm-Message-State: ACrzQf0zMZe4VmNqBBs43Df9Iw60YxQndH8YQYEIElXD4u0f/oz85p/L
	Dr7ROpqSR7ZJ8HdZ8JEdcgiGdCFYbxI9XxYdkK7Pfg==
X-Google-Smtp-Source: AMsMyM51fdeGUqT7QtPa9chaJQbN6LzlFpMhIv4wL7yOUtVYIqqOmYkTCzTn/FrZ+uZo3sktDNvgQvlJ9KKJbs6r1CI=
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id
 b9-20020a63e709000000b0043898e80d1cmr6567201pgi.403.1665183309403; Fri, 07
 Oct 2022 15:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20190307090146.1874906-1-arnd@arndb.de> <20221006222124.aabaemy7ofop7ccz@google.com>
 <c646ea1e-c860-41cf-9a8e-9abe541034ff@app.fastmail.com> <CAKwvOdkEied8hf6Oid0sGf0ybF2WqrzOvtRiXa=j7Ms-Rc6uBA@mail.gmail.com>
 <e554eb3c-d065-4aad-b6d2-a12469eaf49c@app.fastmail.com>
In-Reply-To: <e554eb3c-d065-4aad-b6d2-a12469eaf49c@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Oct 2022 15:54:57 -0700
Message-ID: <CAKwvOdmNiSok3sAMJs2PQLs0yVzOfMTaQTWjyW8q2oc3VF60sw@mail.gmail.com>
Subject: Re: [PATCH] fs/select: avoid clang stack usage warning
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <keescook@chromium.org>, linux-fsdevel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Andi Kleen <ak@linux.intel.com>, Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, 
	"Darrick J. Wong" <darrick.wong@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Paul Kirth <paulkirth@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 7, 2022 at 2:43 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Oct 7, 2022, at 9:04 PM, Nick Desaulniers wrote:
> > On Fri, Oct 7, 2022 at 1:28 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Fri, Oct 7, 2022, at 12:21 AM, Nick Desaulniers wrote:
> >> > On Thu, Mar 07, 2019 at 10:01:36AM +0100, Arnd Bergmann wrote:
> >>
> >> - If I mark 'do_select' as noinline_for_stack, the reported frame
> >>   size is decreased a lot and is suddenly independent of
> >>   -fsanitize=local-bounds:
> >>   fs/select.c:625:5: error: stack frame size (336) exceeds limit (100) in 'core_sys_select' [-Werror,-Wframe-larger-than]
> >> int core_sys_select(int n, fd_set __user *inp, fd_set __user *outp,
> >>   fs/select.c:479:21: error: stack frame size (684) exceeds limit (100) in 'do_select' [-Werror,-Wframe-larger-than]
> >> static noinline int do_select(int n, fd_set_bits *fds, struct timespec64 *end_time)
> >
> > I think this approach makes the most sense to me; the caller
> > core_sys_select() has a large stack allocation `stack_fds`, and so
> > does the callee do_select with `table`.  Add in inlining and long live
> > ranges and it makes sense that stack spills are going to tip us over
> > the threshold set by -Wframe-larger-than.
> >
> > Whether you make do_select() `noinline_for_stack` conditional on
> > additional configs like CC_IS_CLANG or CONFIG_UBSAN_LOCAL_BOUNDS is
> > perhaps also worth considering.
> >
> > How would you feel about a patch that:
> > 1. reverts commit ad312f95d41c ("fs/select: avoid clang stack usage warning")
> > 2. marks do_select noinline_for_stack
> >
> > ?
>
> That is probably ok, but it does need proper testing to ensure that
> there are no performance regressions.

Any recommendations on how to do so?

> Do you know if gcc inlines the
> function by default? If not, we probably don't need to make it
> conditional.

Ah good idea.  For i386 defconfig and x86_64 defconfig, it does not!

Here's how I tested that:
$ make -j128 defconfig fs/select.o
$ llvm-objdump -Dr --disassemble-symbols=core_sys_select fs/select.o |
grep do_select

This seems to be affected by -fno-conserve-stack, a currently gcc-only
command line flag. If I remove that, then i386 defconfig will inline
do_select but x86_64 defconfig will not.

I have a sneaking suspicion that -fno-conserve-stack and
-Wframe-larger-than conspire in GCC to avoid inlining when doing so
would trip `-Wframe-larger-than` warnings, but it's just a conspiracy
theory; I haven't read the source.  Probably should implement exactly
that behavior in LLVM.

I'll triple check 32b+64b arm configs next week to verify.  But if GCC
is not inlining do_select into core_sys_select then I think my patch
https://lore.kernel.org/llvm/20221007201140.1744961-1-ndesaulniers@google.com/
is on the right track; probably could drop the 32b-only condition and
make a note of GCC in the commit message.

Also, my colleague Paul just whipped up a neat tool to help debug
-Wframe-larger-than.
https://reviews.llvm.org/D135488
See the output from my run here:
https://paste.debian.net/1256338/
It's a very early WIP, but I think it would be incredibly helpful to
have this, and will probably help us improve Clang's stack usage.


-- 
Thanks,
~Nick Desaulniers
