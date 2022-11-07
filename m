Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481623FDB
	for <llvm@lists.linux.dev>; Mon,  7 Nov 2022 12:19:29 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id y13so10429327pfp.7
        for <llvm@lists.linux.dev>; Mon, 07 Nov 2022 04:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/AgfJ6TUZlzQk5d03gKr3+MdElNVPRZXFFQ9at+rsns=;
        b=YAcBSTd0dMJb3KAQkOdvROZgky6luNgQw3Qjdfu74kPadqroh/CtuEUt1ie3VU0rwG
         9UvnYPm8iOmCJXxn6qh02ID9BxqvM1Aqg64WmPT2mZSoKsSbvw0OCJ4BSB1rleCc98gu
         1StTWlaGHqUE2SmoPoxPW7UzQeSzWyY6/8Qoi9c8g1qbwbeOI7lts0kAi5Y69jxUYv5u
         z0GaJKW3EMxhRODgezpBrzoK+2MjIZ5NtalanGYDRter5Yqw+OwypP6GKbtZVtcF0auF
         YV5oe484/rs4U6GrFSphXF87+E0Ya8UjtTY4Ommdtovnmv7sGiji8rA+tHJwxTE3+HVM
         Za9Q==
X-Gm-Message-State: ACrzQf1CfBYMQ21ySjsC6EPIInPIzGoCV14sLtliXiwGjXC0nV7Wx2aI
	AneSCZGpASl/mZEgc+vvTEsA+M8umWIoGHxaDVU=
X-Google-Smtp-Source: AMsMyM5h/BPmN+HKzf3ZxgzirDseIUYmunAECaTkA6cYcdWefwCTJtocyTu8wrFF6oQqgsCos80qSD83q8+mKLOkzsc=
X-Received: by 2002:a05:6a00:1792:b0:56c:c9aa:95ce with SMTP id
 s18-20020a056a00179200b0056cc9aa95cemr50037513pfg.69.1667823568683; Mon, 07
 Nov 2022 04:19:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
 <20221106095106.849154-2-mailhol.vincent@wanadoo.fr> <Y2jSMz4GtXGJk6rS@hirez.programming.kicks-ass.net>
In-Reply-To: <Y2jSMz4GtXGJk6rS@hirez.programming.kicks-ass.net>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Mon, 7 Nov 2022 21:19:17 +0900
Message-ID: <CAMZ6Rq+Fo=-D5So=KQCvbfaD0XmcFooi9aUV=uhVAe-UfDa9aQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] x86/asm/bitops: Replace __fls() by its generic
 builtin implementation
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, llvm@lists.linux.dev, 
	Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Mon. 7 Nov. 2022 at 18:38, Peter Zijlstra <peterz@infradead.org> wrote:
> On Sun, Nov 06, 2022 at 06:51:05PM +0900, Vincent Mailhol wrote:
> > The builtin implementation is better for two reasons:
> >
> >   1/ it saves two instructions on clang (a push and a stack pointer
> >      decrement) because of a useless tentative to save rax.
>
> I'm thinking this is the same old clang-sucks-at-"rm" constraints and
> *really* should not be a reason to change things. Clang should get fixed
> already.
>
> >   2/ when used on constant expressions, the compiler is only able to
> >      fold the builtin version (c.f. [2]).
> >
> > For those two reasons, replace the assembly implementation by its
> > builtin counterpart.
> >
> > [1] https://elixir.bootlin.com/linux/v6.0/source/include/asm-generic/bitops/builtin-__fls.h
> >
> > [2] commit 146034fed6ee ("x86/asm/bitops: Use __builtin_ffs() to evaluate constant expressions")
>
> I would much prefer consistently with 146034fed6ee.

There is one big difference between 146034fed6ee and this patch. For
the ffs() functions, the x86 asm produces *better* code so there is a
reason to keep the x86 asm.
The clang missed optimization is not the core reason for me to send
this patch. The purpose of the x86 asm code is to be more performant
than the generic implementation, isn't it? Let's imagine for a moment
that the x86 asm and the builtin produced exactly the same output,
then what would be the reason for keeping the x86 asm version?

My point is not that x86 asm is worse, but that x86 asm isn't better.
The clang missed optimization is one additional reason for this patch,
not the main one.

Yours sincerely,
Vincent Mailhol
