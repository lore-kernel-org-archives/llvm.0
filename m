Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8D93FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 19:50:58 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id g14so811525ljk.5
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mjBgBxRxl/B/hgYFAVarmXVL7ZSA1rZQ3YIq9oI18JM=;
        b=Kn42sJ9l9FIqoh4GcSXKNdcHPoD8Jqpuz5Fnqohi8xHbpuSD99fZUHwP3QS8Dn0Bka
         P0BV6CpM9U4cxDculERycnenh9YOSOfjc15otl8kqabCgLHGT/OWSWvLe0aQtdZLgR1U
         idK2j7QeTsCwgIq+x62xLfEwjOsZzxV55eygusC/1mwPlIFKRDFtnF37CnRw/lDAqL27
         DYISJYGmkw0PE1au34CVh3K0Z0Q/AjCw/dXTUqivi5jdlwdwwXnnICOQNFNv0q6DikNP
         EfaRoM7UEbYFf7Uq7DjGa4WDIIYIAIJ0qvvJuyoBrQDsgUxI6F7jqsbFKLzyjnKZvpoH
         mxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mjBgBxRxl/B/hgYFAVarmXVL7ZSA1rZQ3YIq9oI18JM=;
        b=IYgtZ0J2lQjJci2LOaA2OfdTB1kF7I9+j1TCZ90BapGrMkG4fYKu7apM20Djs9NuPK
         F3G9C7P6z1NZBcvQd//smcGej+G0mbBcyi9/mM/J1Q8ofzSds5AICSdG7aZxLGoaAh8z
         /+1AgSijnIPnZhPUt+crReImIR4JpQqETE5p8SzvF1eLBRN3Cs9wmaAuMnCbJoYOQW5s
         9T3trG4l5uhlSSVYE4LdQAx92ONF6OF/SIYAVJiZ/lxfWyRLQ+bV7U7jNAG9NEfEgtz4
         YLZjMisg96Fh4Uubkrdh9FskqpzAqbiSQe61xCKHAonOODg3DUBJeRvyOiEH3oJWMlz7
         QvlA==
X-Gm-Message-State: AOAM530y7tdQdwF9Gr4IPfVLITmY9soXjgsd/Q3LUWygh1n2OToFDXcR
	xwEbSZPiAbF8opoQ7aNdisL/EVxVIiqt6TcHHpPcFA==
X-Google-Smtp-Source: ABdhPJxhH+tmzuG796EvukmBg5vtEhNFKWWJvy5/vh8LPGcCc7e9x1k3s9OiQK1nlQm6b3bsL+DQ5G+Ggr37350nA18=
X-Received: by 2002:a2e:750e:: with SMTP id q14mr16729757ljc.338.1631649055525;
 Tue, 14 Sep 2021 12:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk> <202109141031.AEFD06F03F@keescook>
 <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
 <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com>
 <CAKwvOdkOHxtsRGjZ2Y8x84sBaqWy8t-U3F9UbMiR7h=3_+mtqA@mail.gmail.com>
 <CAHk-=wjUR7FwE5LsZNaoQxrKu2TS7T-=1j8XqZK2miQuEmqf3Q@mail.gmail.com>
 <CAHk-=wgPupayk3GpwSMtkV5_onFzmmK2g3WmBV1EbSCj+D0eqw@mail.gmail.com>
 <CAKwvOdkab9O5q=DNn643+7HRgTDdD1i201Qi_cSuXYbJbXf1qw@mail.gmail.com> <CAHk-=wjf6ABFwPdsbk2674DwSLQCH0jr7w-BYvG-f2nvRQDqtQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjf6ABFwPdsbk2674DwSLQCH0jr7w-BYvG-f2nvRQDqtQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 12:50:44 -0700
Message-ID: <CAKwvOdk9yqEMLTAxgZNmHgRSww0AnJ-x9qd7HK3v2Vepi1BdLw@mail.gmail.com>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>, 
	Jens Axboe <axboe@kernel.dk>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 12:46 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 12:10 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Isn't the parameter `blksize` of `nbd_set_size` declared as `loff_t`?
>
> So?
>
> I'm not seeing your point.
>
> We've checked the range of it - in loff_t.
>
> So the *value* is already checked, and most definitely fits in 'unsigned long'.
>
> So __ffs() is perfectly fine. It will truncate that loff_t to a sane type.
>
> What is the problem you're trying to solve?

Just making sure __ffs() works as expected should blksize > LONG_MAX
on 32b targets.  I don't see the range check you're referring to.
loff_t is a long long, yeah?
-- 
Thanks,
~Nick Desaulniers
