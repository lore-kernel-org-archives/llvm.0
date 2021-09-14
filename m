Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9B3FC5
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 18:14:23 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id i7so117820lfr.13
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tB+lkmxk3tKI/MJRPQRK4BJvhar4Pog83c0dLCo4qBc=;
        b=APWO50Tu6+F3lchlef1OPW7JWa4s1zf7krPq8+7nfdu8nKvODuqNVZDvNLujK7FWZq
         o+NUizJa6v0F8H516YXhrwdzC/iOXgR9NjarcW/mIVbqdNIfTb/g5I93Ir+JMv3CiWdS
         /+N7QpVFPcfT0W8QgAL8/SJEjEHNyXtFVLpfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tB+lkmxk3tKI/MJRPQRK4BJvhar4Pog83c0dLCo4qBc=;
        b=F97tX70oSxZPdDNv+oBvfna4Pl8O+f8//7Eed0qh+RodIw5c4gPKnn7QJJn/D/traZ
         wzFwj1WMcWQp1XouUDU81WtrFhHM0++FiTOJ+7z9+iIDxvc01JwraunUiViViEfKM93P
         lRHfNzGzqhMr1TrmyvQhN+60md3T1zlhJuiRb3EbCjg8ynOMBbBSyGlSmmx9DrOoqd9H
         5W9Na6PQUFYazS1ksvMjUe8nXlXDfU90rCrMiOyW2QqZAJKlGpWF0QCtcyVzLC7G6j/A
         1HBOUdsCdm07/hK85IbFe43qinJO5SNQ0q1xatJ6dJhXSeE1RrWJNxwx2s1XGDLPdlIX
         7Q5g==
X-Gm-Message-State: AOAM533+bK9DKop+gwtsu9zRR5w5ivWH+2m0SmnVDsOrT3z2H80sjdS0
	yQmBCViTMJy63ahbe4MwcuiyJdoUNweFdJEpAG4=
X-Google-Smtp-Source: ABdhPJwOAJRXy5vuOFI1rT2PKEnMmXc5bxA2kPW6gT7jSkyqGk7GaAWf9eL5NC1ZGIXbF5+JddCbdw==
X-Received: by 2002:ac2:52b0:: with SMTP id r16mr7120574lfm.323.1631643260741;
        Tue, 14 Sep 2021 11:14:20 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id n5sm1417632ljj.97.2021.09.14.11.14.17
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 11:14:18 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id w4so188282ljh.13
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:14:17 -0700 (PDT)
X-Received: by 2002:a2e:96c7:: with SMTP id d7mr16810179ljj.191.1631643257587;
 Tue, 14 Sep 2021 11:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk> <202109141031.AEFD06F03F@keescook>
In-Reply-To: <202109141031.AEFD06F03F@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 11:14:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
Message-ID: <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
To: Kees Cook <keescook@chromium.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nick Desaulniers <ndesaulniers@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 10:32 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Sep 13, 2021 at 11:05:02PM +0200, Rasmus Villemoes wrote:
> > So, I'd sleep a little better if we got the 64 bit tests commented back
> > in in test_overflow.c, and [assuming that the above would actually make
> > that file build with gcc 4.9] that patch also backported to 5.10, so we
> > had some confidence that the whole house of cards is actually solid.
>
> Yeah, I'm all for that too.

Hmm.

Another thing that might be worth doing is to just say "don't do that".

IOW, don't do silly overflow checks with 64-bit things on 32-bit architectures.

Apparently the first and only use case of this is the ndb code, and
the fact is, that ndb code is just being truly horrendously stupid.

That 'blksize' thing shouldn't be a blocksize, it should be a
blockshift instead. The code to set blksize already expressly verifies
that it's a power-of-2, and less or equial to PAGE_SIZE so this:

        loff_t blksize;

is just plain silly. Doubly silly. Why is it a 'loff_t'? It should
never have been a loff_t in the first place, and honestly, it really
should have been a shift count that fits in a few bits.

All this pain could have been trivially avoided with just people
writing better code, knowing that multiplies and divides are
expensive, and that shift counts are small and cheap.

               Linus
