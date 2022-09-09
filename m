Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246CB7E3
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 08:44:32 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 130so1648739ybw.8
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UxHqcjqLV5SMzyyvdPn90TGI1ZaTqe/aoS8WhMGAgLo=;
        b=sw9SXPNgEqTzFEbub1fMIikW5XRHX3LXyotY2uUKcbNka3uMRULDKd2+TtJU9JhNsY
         HuRyRmzy75Vl795pPEj7Snw+41oN5Vj2TSr/I+MajIzPkaarOdZNazWvUr0P6Q2gXg23
         /eaTrmPP+f8iXnq3Ad2kFaC4PWXlDf10Zb9eSYkDI+Ke8zXfheTbaYDe7QxQcuuo8H8I
         JDc1wga/VBWxbOPuVo/H5bPeQ3ad4yNhMM/jqc4LUHGUiJCFuLTMJZEtBeRyvN3yA6kR
         5RPxxKX4BULHj0BKRJFwnYqFK/P5B3n6yVQbxK8G5FpaZ7374oOeYy5ksTOUcd/2wN3B
         p+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UxHqcjqLV5SMzyyvdPn90TGI1ZaTqe/aoS8WhMGAgLo=;
        b=Xql1Lj9kSx8nI8zr+7YlR16HCEEhASTBygd+pf/6PUszF4aw/2le8oosssqgKks4Tz
         3lVpVip4Ddn2XOreThfOle5VdykFlAghZIPDaZsVDQdoZpgGNkiIamEqxtUc5WkAI2pi
         QmCv5f3+vLTGd0mH/DUEJV9KMsQ+KYHTdCWvR5xOEzmkYsjOb4503SaQLDcm4n5qUXVQ
         q0OX8RNXuPAk1JkXma0yC0js3J8mxW1G/2+CdY1FEfDhFj9iJW5bgeak1X73RG78i1qf
         Csw58CuDxrf6vlbkgW9ZnDwgkM/k/kuKV4vx0tmnE31rMP6af2ErvMrN2AbXVdW7e9jh
         CN4w==
X-Gm-Message-State: ACgBeo0UeP/YlCeIgDIC59NvM2wEe+xZ1vujIL2jZTIifzk+3ZUB+yZ8
	+eKAhuFg6pGoetyHV3QpKe8e1HbgU8PODUeqbzODTw==
X-Google-Smtp-Source: AA6agR50LVYT/iKxeiXfZ1bnFnp7Ke4DBBdARvNMANKD4ACstbuhW0lSj6LRta+0KeY8t2U7vFcCdnQLIe3Imfh2cWQ=
X-Received: by 2002:a25:d686:0:b0:6a8:e9a8:54f7 with SMTP id
 n128-20020a25d686000000b006a8e9a854f7mr10920047ybg.611.1662713070956; Fri, 09
 Sep 2022 01:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220909073840.45349-1-elver@google.com> <20220909073840.45349-2-elver@google.com>
 <CACT4Y+Zuf+ynzSbboTAN0_VLedeVErO6qm49H4YzuR1e8EgJUQ@mail.gmail.com>
In-Reply-To: <CACT4Y+Zuf+ynzSbboTAN0_VLedeVErO6qm49H4YzuR1e8EgJUQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Fri, 9 Sep 2022 10:43:54 +0200
Message-ID: <CANpmjNOz9bomQv=Zem6kw9xamhp1yPKf3iCrVvhkzHxE2pcp0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kcsan: Instrument memcpy/memset/memmove with newer Clang
To: Dmitry Vyukov <dvyukov@google.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-s390@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Sept 2022 at 10:38, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, 9 Sept 2022 at 09:38, Marco Elver <elver@google.com> wrote:
> >
> > With Clang version 16+, -fsanitize=thread will turn
> > memcpy/memset/memmove calls in instrumented functions into
> > __tsan_memcpy/__tsan_memset/__tsan_memmove calls respectively.
> >
> > Add these functions to the core KCSAN runtime, so that we (a) catch data
> > races with mem* functions, and (b) won't run into linker errors with
> > such newer compilers.
> >
> > Cc: stable@vger.kernel.org # v5.10+
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v2:
> > * Fix for architectures which do not provide their own
> >   memcpy/memset/memmove and instead use the generic versions in
> >   lib/string. In this case we'll just alias the __tsan_ variants.
> > ---
> >  kernel/kcsan/core.c | 39 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >
> > diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
> > index fe12dfe254ec..4015f2a3e7f6 100644
> > --- a/kernel/kcsan/core.c
> > +++ b/kernel/kcsan/core.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/percpu.h>
> >  #include <linux/preempt.h>
> >  #include <linux/sched.h>
> > +#include <linux/string.h>
> >  #include <linux/uaccess.h>
> >
> >  #include "encoding.h"
> > @@ -1308,3 +1309,41 @@ noinline void __tsan_atomic_signal_fence(int memorder)
> >         }
> >  }
> >  EXPORT_SYMBOL(__tsan_atomic_signal_fence);
> > +
> > +#ifdef __HAVE_ARCH_MEMSET
> > +void *__tsan_memset(void *s, int c, size_t count);
> > +noinline void *__tsan_memset(void *s, int c, size_t count)
> > +{
> > +       check_access(s, count, KCSAN_ACCESS_WRITE, _RET_IP_);
>
> These can use large sizes, does it make sense to truncate it to
> MAX_ENCODABLE_SIZE?

Hmm, good point - that way it can still set up watchpoints on them.
I'll do a v3.
