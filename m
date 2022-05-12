Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E2117C1
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 04:29:59 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-2ec42eae76bso42761337b3.10
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 21:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XqBqQ+XRvyAHUyGfBZIABF5Embq5Xn1tLFaDAHrehy0=;
        b=YFlc3b6vkpblg27loguTcVtPtqr2PpswDYTuXGqboC5q+Fu2qjKMCqDecHWcVvbemX
         iprD8dzzsj2b3ixoPNEE4kLOa7nYGWcx12DrDx2fxARYKpYhb2MixH/dRthQHHlXMznL
         TlZ+RHJvr7A9UmUo++PpHL2/2uRd3QqfC4NFuH77OKI84His8lpEU2weW43XtLFfYQjU
         kyqqsAQtJ7FsgBlJu+0tXY2e5dJOrF691C9rmDqy212e1OzpUJgL/qvGd9Fk3DT/nmSM
         qG9QCDZK/1oph0XaSURcWnMqWpJadpdzePdu/NpxJrI0bV2viHlmqTe3HLZ5vNcTtbEM
         mMOA==
X-Gm-Message-State: AOAM5338pLI44evXWFpqQgHL9rIML6vQg+5OfDY2C1c/ubtF5WqfIbwP
	NQuPZ6WzhCs8TLvkNRDJJ807tnoaITy2LD5Yi+U=
X-Google-Smtp-Source: ABdhPJyyVkmDxcTDBFjfTHOEDq9W/5HTODdg+KeIBAkAVH3WC7JPKZR0Bvog0/jCQrKv80S+rQPqP4YDlS9waRSLq3Y=
X-Received: by 2002:a81:34f:0:b0:2f7:bbb1:1576 with SMTP id
 76-20020a81034f000000b002f7bbb11576mr28802714ywd.45.1652329798501; Wed, 11
 May 2022 21:29:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220512011855.1189653-1-mailhol.vincent@wanadoo.fr> <20220512011855.1189653-2-mailhol.vincent@wanadoo.fr>
 <154f41707c58acdac26c3300c5b429f381c45708.camel@perches.com>
In-Reply-To: <154f41707c58acdac26c3300c5b429f381c45708.camel@perches.com>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Thu, 12 May 2022 13:29:47 +0900
Message-ID: <CAMZ6Rq+Nm9wSajUFP7PyctB50t5ANpe9LhRmO3GJvmgkuXzEOA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate
 constant expressions
To: Joe Perches <joe@perches.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu. 12 May 2022 at 12:02, Joe Perches <joe@perches.com> wrote:
> On Thu, 2022-05-12 at 10:18 +0900, Vincent Mailhol wrote:
> > For x86_64, the current ffs() implementation does not produce
> > optimized code when called with a constant expression. On the
> > contrary, the __builtin_ffs() function of both GCC and clang is able
> > to simplify the expression into a single instruction.
> []
> > -static __always_inline int ffs(int x)
> > +static __always_inline int variable_ffs(int x)
> >  {
> >       int r;
> >
> > @@ -310,6 +299,19 @@ static __always_inline int ffs(int x)
> >       return r + 1;
> >  }
> >
> > +/**
> > + * ffs - find first set bit in word
> > + * @x: the word to search
> > + *
> > + * This is defined the same way as the libc and compiler builtin ffs
> > + * routines, therefore differs in spirit from the other bitops.
> > + *
> > + * ffs(value) returns 0 if value is 0 or the position of the first
> > + * set bit if value is nonzero. The first (least significant) bit
> > + * is at position 1.
> > + */
> > +#define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : variable_=
ffs(x))
>
> How about not defining another function and using parentheses around
> the function definition to avoid the macro expansion like:
>
> #define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : ffs(x))
>
> and
>
> static __always_inline int (ffs)(int x)
> {
>         etc...
> }

Sorry, but I don=E2=80=99t really like this approach.

Main issue I see is that this code will emit a -Wshadow warning.

And using parentheses around the function definition just seems an
obscure hack to me. The variable_foo() gives me less headache. Was
this pattern ever used anywhere else in the kernel?


Yours sincerely,
Vincent Mailhol
