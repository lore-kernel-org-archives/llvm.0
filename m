Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2215C1368
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 11:55:25 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31f661b3f89so7428917b3.11
        for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 04:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PNBikb0xhnt9Fd0jSSfSSfR2sxz3CzKFgt8jDKr0/dw=;
        b=gwkufaDeL0mGnwstK5dIP1u3e20BvF45Psyw2xSCtvwmknpDWf3JhXAN2bp+P+r3/E
         Pp1t36hw2UNyl26NrP5+afpKzKh+KE5RWx3y/ADj9m968hg6oe6fmQVU5I39x9Bnmu4v
         9ZDbBfZzT+BF5wjrhS1jrv/oJ2VsAjUT2ujBvmNOqqi27IbAjN0GG36sIaIVnWqUg6PF
         gyHvNF/H5em2g3fB05B7koLFUgCjxvPnMUbZdMVWagdiZ67UJ822Rfo0da/RDBefia92
         68vxAQlAfzfCpr1mhwZORHUs5yBDJM9ccMFVNTw4iPiX8SYQi6HdFh4DQCtf6YTmmQBu
         /zVg==
X-Gm-Message-State: ACgBeo1LI5FPxJdnKpPSew9uwGiccI85Tb8ZLmJj3Xgnq4XOYFfxTnfp
	0XBed3ym0st7PHkCc/Ghi/R0Zi+hl0UH7AKfeu4=
X-Google-Smtp-Source: AA6agR5mr6Qg2/yIsE9vf+WvDD+w6wxmNJ+ViiqI3LaJ4g0funJYgF5sa8xR3gFlg+YxXSNd2uwbYac6mnjauNeJJQk=
X-Received: by 2002:a81:11c2:0:b0:31f:5a44:c0b7 with SMTP id
 185-20020a8111c2000000b0031f5a44c0b7mr3537115ywr.518.1660305324059; Fri, 12
 Aug 2022 04:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220723151521.51451-1-mailhol.vincent@wanadoo.fr> <20220723151521.51451-2-mailhol.vincent@wanadoo.fr>
 <YvUZVYxbOMcZtR5G@zn.tnic>
In-Reply-To: <YvUZVYxbOMcZtR5G@zn.tnic>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Fri, 12 Aug 2022 20:55:11 +0900
Message-ID: <CAMZ6Rq+k-5PKesdW7z9DdDMUNSKQR-c1qmQADvJ6VKZA2CM8nw@mail.gmail.com>
Subject: Re: [RESEND PATCH v4 1/2] x86/asm/bitops: ffs: use __builtin_ffs to
 evaluate constant expressions
To: Borislav Petkov <bp@alien8.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Joe Perches <joe@perches.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

On Thu. 11 Aug 2022 at 23:59, Borislav Petkov <bp@alien8.de> wrote:
> On Sun, Jul 24, 2022 at 12:15:20AM +0900, Vincent Mailhol wrote:
> > For x86_64, the current ffs() implementation does not produce
> > optimized code when called with a constant expression. On the
> > contrary, the __builtin_ffs() function of both GCC and clang is able
> > to simplify the expression into a single instruction.
> >
> > * Example *
> >
> > Let's consider two dummy functions foo() and bar() as below:
> >
> > | #include <linux/bitops.h>
> > | #define CONST 0x01000000
>
> Those code examples you can simply indent with two spaces.
>
> > In both examples, we clearly see the benefit of using __builtin_ffs()
>
> Who's "we"?
>
> Please use passive voice in your commit message: no "we" or "I", etc,
> and describe your changes in imperative mood.
>
> > instead of the kernel's asm implementation for constant expressions.
> >
> > However, for non constant expressions, the ffs() asm version of the
> > kernel remains better for x86_64 because, contrary to GCC, it doesn't
> > emit the CMOV assembly instruction, c.f. [1] (noticeably, clang is
> > able optimize out the CMOV call).
> >
> > This patch uses the __builtin_constant_p() to select between the
>
> Avoid having "This patch" or "This commit" in the commit message. It is
> tautologically useless.
>
> Also, do
>
> $ git grep 'This patch' Documentation/process
>
> for more details.
>
> > kernel's ffs() and the __builtin_ffs() depending on whether the
> > argument is constant or not.
>
> In general, you don't have to say what the patch does - that should be
> visible from the diff. The more important part is the *why*. And that
> you do.
>
> Rest looks ok.

Thank you for the review!
I addressed all your comments and sent a v5:
https://lore.kernel.org/all/20220812114438.1574-1-mailhol.vincent@wanadoo.fr/


Yours sincerely,
Vincent Mailhol
