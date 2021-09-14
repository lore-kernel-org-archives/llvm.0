Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338413FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 19:58:04 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id s12so959994ljg.0
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=edx594esEetpbovYxJC0BKmrfmnFRZoGc83fmQOGtYU=;
        b=Ai5hcu7Lb33IoQQz7PYAvlBa5vu0YJnGQdY2K6Ya5ZxVajxC9hiSGS5AtFs/3zOcXR
         HxKE9r8vz0vWGEgG0dXg/BW0cXBZlaetKrVwvdj8Z4lnG7DZx0pLp24h0K2IgX4G45im
         TVleKsbcXnk247tzWLJYQ5Q4g3R/vIxeMhoWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=edx594esEetpbovYxJC0BKmrfmnFRZoGc83fmQOGtYU=;
        b=ADtTQ9vczIDkpwXbZKFXr7oSigCx0OKjkT1fukrC1fKbYVX2nWdXXrz9yDKPW8sP1e
         yHAigLAETC2bHDLuHp0PUuuhyeu85JGQDbyOeCs8PAn/kpR6XZEwV7NKDuRSDDXgQXfB
         7CM9sCh93HylioN6zD1mbuNjEvrv3AS67xfhrsw3Nnsv1Ybtd/eBrtn0FqkuZBdHrDOj
         BO0l1OkUNCgEWDZ+W3059DltV1zZcwiIqH1QdeszdakcqHO1ZwEp1IrXoCXrnVQ4jtnP
         k+4UPdTryQ4ypZPA4ocYfgVKPBwG1sdqu4IZh82lYCxprQWFRYb1AvtwISZhLJudMiTK
         tyNQ==
X-Gm-Message-State: AOAM532Qj8y7ZzSUsK4eDldbkLX++1aMqy6HqdxHhC9TUC1P/u18nqXO
	MP5LoP1i5tgu0GbatM5EVgfuBtinaWAUy4WwedM=
X-Google-Smtp-Source: ABdhPJztfmqRaFQVsecAKVkNJQ+CaT7kb+an7jP0qmM0x/V9yiYWxl3OT/e3hJ0DR4wYF0VMJQ6XDA==
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr17278544ljj.285.1631649481409;
        Tue, 14 Sep 2021 12:58:01 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 138sm1428541ljj.128.2021.09.14.12.57.59
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 12:57:59 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id i4so916978lfv.4
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:57:59 -0700 (PDT)
X-Received: by 2002:a05:6512:3991:: with SMTP id j17mr3042014lfu.280.1631649479060;
 Tue, 14 Sep 2021 12:57:59 -0700 (PDT)
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
 <CAKwvOdkab9O5q=DNn643+7HRgTDdD1i201Qi_cSuXYbJbXf1qw@mail.gmail.com>
 <CAHk-=wjf6ABFwPdsbk2674DwSLQCH0jr7w-BYvG-f2nvRQDqtQ@mail.gmail.com> <CAKwvOdk9yqEMLTAxgZNmHgRSww0AnJ-x9qd7HK3v2Vepi1BdLw@mail.gmail.com>
In-Reply-To: <CAKwvOdk9yqEMLTAxgZNmHgRSww0AnJ-x9qd7HK3v2Vepi1BdLw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 12:57:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=whmcqmpPJQrAw4vX-Z6ePjeydjw7s6tzqzvB=uBp0=6fw@mail.gmail.com>
Message-ID: <CAHk-=whmcqmpPJQrAw4vX-Z6ePjeydjw7s6tzqzvB=uBp0=6fw@mail.gmail.com>
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

On Tue, Sep 14, 2021 at 12:50 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Just making sure __ffs() works as expected should blksize > LONG_MAX
> on 32b targets.  I don't see the range check you're referring to.
> loff_t is a long long, yeah?

Christ Nick.

Stop wasting my time.

Read the patch:

        if (!blksize)
-               blksize = NBD_DEF_BLKSIZE;
+               blksize = 1u << NBD_DEF_BLKSIZE_BITS;
        if (blksize < 512 || blksize > PAGE_SIZE || !is_power_of_2(blksize))
                return -EINVAL;

        nbd->config->bytesize = bytesize;
-       nbd->config->blksize = blksize;
+       nbd->config->blksize_bits = __ffs(blksize);

See that range check?

Seriously, I've now replied several times to you just because you were
too damn lazy to just look three lines up from the __ffs() that you
reacted to, when I explicitly mentioned the range check several times,
including in the original submission, and when it was RIGHT THERE IN
THE PATCH IN THE ONLY PLACE THAT DID THAT __FFS.

(Ok, so the lower check of range was 512, not 1024, sue me).

It was all there in the diff all the time.

Don't email me again about this. At least not without spending the
FIVE SECONDS to look at what the hell you are emailing me about.

           Linus
