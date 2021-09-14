Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2663FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 18:55:10 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id i7so360132lfr.13
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HAWRHOZnhfc5sJQwmFRR3wNRJqZ8RPcCxQgHb6VmErs=;
        b=MDR8/f38E4BJxRXds0pk7dS579DaATHlNEbmBac6+WXoidZawjqzTuSaacwxz8PEL0
         y7SqugNLK79gw2t3EWNtKI4Q1nSea4QNZPtNeZ18JMI4cqi4zbtBwwMHkOVksXbtLN7T
         +XmrLAa8eReVIxeTPcUXSg8VZa1XN2hq+GeqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HAWRHOZnhfc5sJQwmFRR3wNRJqZ8RPcCxQgHb6VmErs=;
        b=IJaOU6JHa9yRqmfYL2s4gI+8FksRFaP231GrP4+A+4XQUoPJZLw1F9NtJ4+PW9Fj74
         zykM2to0BvzlSrKK35ZZz6/TrSeA4Ln4yv34fxwa3RSBxFq/QOVm5ebsGj+SfOZ06Wjq
         6xbnA/7icF23O7f0bwuupMkIwRZqcNi2QyyQId7WB4nQAe1lZk6x7X/e2FQaByiTubW1
         Gd89NZKxIr+BXBYu2kay5FeqhspCyIVbSRzGpRib5F3ceL3gFlZOIV1JfKhOvGmC29iQ
         m/O9/t+qKfzV8X5XBCoxIRVEtDpzsL817Ot186UAtezVAeDg44MRgp6tM4qO7WtwZW+M
         D4DQ==
X-Gm-Message-State: AOAM531tikaZBmdqXwojbg44F/jmVBIm+mh30DXzo+y1XDRUQ4TRFbR3
	Uk8zX6Q09QAre2uaTL43KXScDExzkDzx9UngOWk=
X-Google-Smtp-Source: ABdhPJxShzPjzszlM8XyVS9jen+CKYa2ewQlvYrCpTGUZ+CwxDFiTjjpGv4Dur43FBMwReT2fAi2iw==
X-Received: by 2002:a05:6512:a84:: with SMTP id m4mr14248188lfu.574.1631645708249;
        Tue, 14 Sep 2021 11:55:08 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id c10sm1529951ljn.54.2021.09.14.11.55.07
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 11:55:07 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id o11so445378ljp.8
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:55:07 -0700 (PDT)
X-Received: by 2002:a2e:96c7:: with SMTP id d7mr16954865ljj.191.1631645707082;
 Tue, 14 Sep 2021 11:55:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk> <202109141031.AEFD06F03F@keescook>
 <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
 <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com> <202109141144.1AE2DDB@keescook>
In-Reply-To: <202109141144.1AE2DDB@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 11:54:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=whU_p489R+ZYPh_AehJRQJKp_0oJ3zB73wgCtB_k3vwvA@mail.gmail.com>
Message-ID: <CAHk-=whU_p489R+ZYPh_AehJRQJKp_0oJ3zB73wgCtB_k3vwvA@mail.gmail.com>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
To: Kees Cook <keescook@chromium.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nick Desaulniers <ndesaulniers@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 11:48 AM Kees Cook <keescook@chromium.org> wrote:
>
> FWIW, it's probably better to avoid open-coding the check. There are
> helpers for shift-left too. :)

I actually looked for them.

But I only did so with a grep for "check_shift_overflow".

Which didn't find anything.

I didn't think anybody would call a shift overflow function "shl",
since a right-shift by definition cannot overflow.

But no complaints about using the oddly named overflow function,
though - it makes it more obvious that the patch is purely about
changing 'blksize' to use a bit count.

Btw, these kinds of issues is exactly why I've been hardnosed about
64-bit divides for decades. 64-bit divides on 32-bit machines are
*expensive*. It's why I don't like saying "just use '/' and we'll pick
up the routines from libgcc".

In almost all real-life cases - at least in a kernel - the full divide
is unnecessary. It's almost always people being silly and lazy, and
the very expensive operation can be avoided entirely (or at least
minimized to something like 64/32).

           Linus
