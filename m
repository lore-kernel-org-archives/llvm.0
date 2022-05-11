Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB4D3FE0
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 23:30:57 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id i38so6732748ybj.13
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 16:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=82LtQvcmXEI9bSU6aE32LRoQ75jfHNnbnp/OWfCob4A=;
        b=JmmK2sf0lFyUuVKQJ8Ih3HoRHztv9krN48SclJaHLi1NxYEknUFWTnYLrApY6jdZ5b
         O8CUWxRDyYh51H70kkZqzYMkxg2UbTFvLoD4RF3kxIFfVp/GQPJeDH2ihZvqcny8Vyd9
         wWGOL6Jy/5ve5bdR4HIdwwtnFJAj6ud5UDMkyaQ59QjWtmkJazia2ylituN1rQs30PUG
         l7oqzzGZL21eCGjKI7S6GFgwlKOuIKrGRsahermH+WjwMbDbvNw9g7bb0XryhtDId03s
         EuP609s2dRrqTJ1hxLqOCtvyT6L64avu4j/HEdsF0d+IwOsuV42W9579L5ZB9PchrK7d
         wQVA==
X-Gm-Message-State: AOAM532Nrfcn1nYMbixkKat0Avn3LuUk9oeA8jdF7+woCv26iCEiMF8j
	F28DcpHsCaraNa4LHSzV3xxW9oOldEXCb78fCx0=
X-Google-Smtp-Source: ABdhPJy6L7LndQLIhm/RpB8v7sd4uAh7ABfVk1w7xt0uCtyO2bIyQJnNwA8Gu9veZKKBbC2qShJmh6PD9uKoehe0cTU=
X-Received: by 2002:a5b:491:0:b0:64a:f42f:6973 with SMTP id
 n17-20020a5b0491000000b0064af42f6973mr12909923ybp.20.1652311856106; Wed, 11
 May 2022 16:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220511160319.1045812-2-mailhol.vincent@wanadoo.fr> <324f245e-15e2-a1f2-bc8a-46255a1a859f@wanadoo.fr>
In-Reply-To: <324f245e-15e2-a1f2-bc8a-46255a1a859f@wanadoo.fr>
From: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date: Thu, 12 May 2022 08:30:45 +0900
Message-ID: <CAMZ6Rq+d_eKXQQZ1p-yUpqC-SOjpa83o_QpZci-GN9qd9UKa5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86/asm/bitops: ffs: use __builtin_ffs to evaluate
 constant expressions
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	David Howells <dhowells@redhat.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu. 12 May 2022 at 05:56, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> Le 11/05/2022 =C3=A0 18:03, Vincent Mailhol a =C3=A9crit :
> > For x86_64, the current ffs() implementation does not produce
> > optimized code when called with a constant expression. On the
> > contrary, the __builtin_ffs() function of both GCC and clang is able
> > to simplify the expression into a single instruction.
> >
>
> [...]
>
> >
> > ** Statistics **
> >
> > On a allyesconfig, before applying this patch...:
> >
> > | $ objdump -d vmlinux.o | grep bsf | wc -l
> > | 3607
> >
> > ...and after:
> >
> > | $ objdump -d vmlinux.o | grep bsf | wc -l
> > | 792
> >
> > So, roughly 26.7% of the call to ffs() were using constant expression
> > and were optimized out.
> >
> >
> nitpicking: numbers look odd.

And they are. Thanks for spotting the issue.

>     3607 is the exact same number as in patch 2/2. (ok, could be)
>     26.7% is surprising with these numbers. (I guess it is (total_before
> - remaining) / total_before x 100 =3D (3607-792)/36.07 =3D 78.0%)

The 3607 is incorrect (copy/paste issue, sorry). The correct figure is
1081. And:

(1081-792)/1081 =3D 26.7%

Will amend the comment and send v3 right away.

> (but patch looks great to me :)

Thanks! :)

> CJ
