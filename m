Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3C73FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 19:46:10 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id k13so871183lfv.2
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x8yJeL9IaeMJNKciVPbI0B3y4VivrodBAJBKdlNt/EY=;
        b=MvIPaYviMa6bUaahGefLg7MqZeyl5u9ob4BwphzBuC0SpT6uFW4ChNga/yMrclrhbR
         rizIHwOMPweM98hVjXEg812jsnx3bpEmMfuQ0N7W1frLnYXSqcUNqsYp4i89XnWBwzpD
         FryiWj7xnM1ptXmRAWwqgMTw8fmKM1jCqbJ8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x8yJeL9IaeMJNKciVPbI0B3y4VivrodBAJBKdlNt/EY=;
        b=WeSPU3WTJDsmYjw+ZCAvNGgoG4wIRigPnXFKXjKi4m4UU8/+/VZWhdo7xAhL1mLq/m
         Ag+ta5agCRGMXhloNsmgq5wA76BJ65c8+Vhj+ZeGBsGtB4l3kmqabZrXyuSLPH7FH78Z
         QE1OHCAMd6L3REVgKXBLBdgkELWly+niPaWk8vjYth5x9ms97Bb/rbO434Y+QM9M6aFc
         HlQOJRynvyV2+dT8NRe4ZxyGi/5SQPNADV/9VAHND6IgzTbxgKxCLXa0l45xsKvyD09m
         jA6TZt6nCQy4HRQccRbSx3ZcEC/CmBJZ513alYpTXKmJVtAtmzkoBeQSIibp4PZjg8Iv
         26cw==
X-Gm-Message-State: AOAM531Cip7AG/tndvC9ASxeSc9PzKZ1hhKPjjUq4Fi09wQdWeS9NbMk
	ikFcPLLcXsm9kRljuxhQTLWY7zmNpFUIdW3G+H4=
X-Google-Smtp-Source: ABdhPJzVC4YBZZ1XAZ0C/SbY/yxsy5AYIrQxipxyijbvAs8hAlLi8Gzxc7tuTcO+rm2ZnvYsE3md9g==
X-Received: by 2002:a19:670a:: with SMTP id b10mr13647764lfc.431.1631648766501;
        Tue, 14 Sep 2021 12:46:06 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id x33sm1196688lfu.8.2021.09.14.12.46.05
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 12:46:05 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id q21so770131ljj.6
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:46:05 -0700 (PDT)
X-Received: by 2002:a2e:96c7:: with SMTP id d7mr17124610ljj.191.1631648765005;
 Tue, 14 Sep 2021 12:46:05 -0700 (PDT)
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
 <CAHk-=wgPupayk3GpwSMtkV5_onFzmmK2g3WmBV1EbSCj+D0eqw@mail.gmail.com> <CAKwvOdkab9O5q=DNn643+7HRgTDdD1i201Qi_cSuXYbJbXf1qw@mail.gmail.com>
In-Reply-To: <CAKwvOdkab9O5q=DNn643+7HRgTDdD1i201Qi_cSuXYbJbXf1qw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 12:45:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjf6ABFwPdsbk2674DwSLQCH0jr7w-BYvG-f2nvRQDqtQ@mail.gmail.com>
Message-ID: <CAHk-=wjf6ABFwPdsbk2674DwSLQCH0jr7w-BYvG-f2nvRQDqtQ@mail.gmail.com>
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

On Tue, Sep 14, 2021 at 12:10 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Isn't the parameter `blksize` of `nbd_set_size` declared as `loff_t`?

So?

I'm not seeing your point.

We've checked the range of it - in loff_t.

So the *value* is already checked, and most definitely fits in 'unsigned long'.

So __ffs() is perfectly fine. It will truncate that loff_t to a sane type.

What is the problem you're trying to solve?

         Linus
