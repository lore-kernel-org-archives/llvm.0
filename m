Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8512F29CA
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 18:48:37 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id i4so508479lfv.4
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cvy/3cks7+AuDHThaVCr3UhYuSpZtaPh/ikUmHeeXhY=;
        b=hocWtyfAC0qLzU9IRZfRW2zgutMT4k840BOcq6knAFFTggyPI4Hd9Vo/+WPPFiIy9p
         9fgdgt1g1ltDXstVcb+3kXtEig6vMf2rEOBNAeGcrPZGjZGH5zACgRKuFKfpA+otOkk1
         y60/ZvGQqUnSPr9zmPRfACmbfXbAzSWSuIUks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cvy/3cks7+AuDHThaVCr3UhYuSpZtaPh/ikUmHeeXhY=;
        b=NLhvEYPX1jOKqqrnfY2Rv5+YVZQK28i+VLKy0+qZFyHwyBZ8xWKvoBkdpPgP84XQ3w
         nMttHnu9s0k9FoYU2nvpXD1UtWjk7J9LGfe9i0qI393oLag4JboMZ4ugUOUlckjMbscF
         3fuN74w1Qii+QZ/rRsGCdfTMzsnI5U+3X220BoB/QQYDaSLXLL1LPArJxx4Qo+6x+ioi
         29Se2uiOcWnS86H03i2NTbwncSJMZsaI/8epCQ6nDgocoDakcF8xIhFcZZNPqbdwer74
         9goccXUIq/a1sgAAyIlRYox2YY7zJsaDZ7zAvlzk//RhGzNaAqiWdoqxSaz5Mynsnl0m
         aFpg==
X-Gm-Message-State: AOAM5338D2c0OPIfcl1HL+pLBXb5RJt6MacotufkINi6dMmkKaI7uk8Q
	qYjm+L/t40REXQbXanMlvOAoCbeEYLvxotWsflw=
X-Google-Smtp-Source: ABdhPJzNFK7KwBjh63vAd41AAmhGZtdSBXIjuwwrMHXcBM5MaYmhJQOpVu78ZzEwJ2t7jV6P1aIYJQ==
X-Received: by 2002:a05:6512:3b0b:: with SMTP id f11mr11633946lfv.585.1631645315318;
        Tue, 14 Sep 2021 11:48:35 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id y9sm1427653ljm.5.2021.09.14.11.48.34
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 11:48:34 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id k4so469241lfj.7
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:48:34 -0700 (PDT)
X-Received: by 2002:a05:6512:3991:: with SMTP id j17mr2829477lfu.280.1631645314444;
 Tue, 14 Sep 2021 11:48:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk> <202109141031.AEFD06F03F@keescook>
 <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
 <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com> <CAKwvOdkOHxtsRGjZ2Y8x84sBaqWy8t-U3F9UbMiR7h=3_+mtqA@mail.gmail.com>
In-Reply-To: <CAKwvOdkOHxtsRGjZ2Y8x84sBaqWy8t-U3F9UbMiR7h=3_+mtqA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 11:48:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjUR7FwE5LsZNaoQxrKu2TS7T-=1j8XqZK2miQuEmqf3Q@mail.gmail.com>
Message-ID: <CAHk-=wjUR7FwE5LsZNaoQxrKu2TS7T-=1j8XqZK2miQuEmqf3Q@mail.gmail.com>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>, 
	Jens Axboe <axboe@kernel.dk>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 11:45 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Any issues passing an loff_t (aka long long) to __ffs which expects an
> unsigned long for ilp32 targets?

No.

We literally _just_ checked that the value is a power-of-two, and that
it's in the range [1024, PAGE_SIZE].

There was never anything "loff_t" about bitmask at any point.

> Any issues modifying the sysfs interface? Perhaps something in
> userspace relies on parsing those strings?

See my comment about how it could use DEFINE_SHOW_ATTRIBUTE() to
always show the bits as a value.

But it's not even sysfs. It's debugfs. So nobody _should_ have relied
on any of this anyway.

Of course, "should have" is just a dream world - but the point is that
if somebody complains, it's very fixable.

           Linus
