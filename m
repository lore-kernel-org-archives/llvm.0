Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9433FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 18:56:34 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id i7so368558lfr.13
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cGrN7bFxVsTMQhopk72/7YCXP3j0jBNbxEncpxpEckY=;
        b=XBhw4gx6pKPX9FTE2Eo/3NvHlQRAMmv9E9aB6Bo3AatyW184lGQOMpy2MUIM0C1xMu
         zrYVIhbhax7GofDWNS57pA/zEuqz0YO6lum+nndDm7CLkzecR08Z0NS8jGmeuARX9lD+
         uARK/NNdjmoTyKLRp+oOwHgDszSkWdNeze/wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cGrN7bFxVsTMQhopk72/7YCXP3j0jBNbxEncpxpEckY=;
        b=1YndAQ4mHVMEANYicCFU3kr2dA7POICo4iutXLDIY5k5WezwJT02Aqt2eP0XRxQicc
         vIOptq87/wKFVj0KaqpyiJQSDh2QsA1I5xzVvL/AJpR2GHFX5nhKXtodPFCF51S5C0kL
         3osGBCXTSr02JPmljUATudSHYL9puBjEl0oV0VfgLsK+9q5hGaiQb+L6PFJ6iu7I6Sds
         55TW0fQcR3UTEF2sdGkaowVtspw3/nqaABIEMNcrrLqcvAdC9KIWs/VBq13Fbyg3XCPi
         hEtEno8UvwZWluxmc3H4fP92mqRU/1jxpfiiuFjskb8PDp1GzG7Aw57jqJg7frYoChwc
         kpLQ==
X-Gm-Message-State: AOAM530ZZ7qXIri5nYnr22L3qz/qU06wzIsq1ZNydbbEZPWxG7ZNxda6
	yAfEnV7gaHIrZGgD8bnL6qqR6+vL4vyoO7N+C3Q=
X-Google-Smtp-Source: ABdhPJy5hx6xJM31npLe/j9q1n0RngAWMI0GX9CiBl91gRTPYg1bb5vLSpZiEE/uy7bQp9AwMQnTMg==
X-Received: by 2002:a05:6512:44f:: with SMTP id y15mr12502315lfk.559.1631645792683;
        Tue, 14 Sep 2021 11:56:32 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id r13sm392408lff.10.2021.09.14.11.56.31
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 11:56:32 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id j12so434233ljg.10
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:56:31 -0700 (PDT)
X-Received: by 2002:a2e:b53a:: with SMTP id z26mr16048407ljm.95.1631645791577;
 Tue, 14 Sep 2021 11:56:31 -0700 (PDT)
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
 <CAKwvOdkOHxtsRGjZ2Y8x84sBaqWy8t-U3F9UbMiR7h=3_+mtqA@mail.gmail.com> <CAHk-=wjUR7FwE5LsZNaoQxrKu2TS7T-=1j8XqZK2miQuEmqf3Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjUR7FwE5LsZNaoQxrKu2TS7T-=1j8XqZK2miQuEmqf3Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 11:56:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPupayk3GpwSMtkV5_onFzmmK2g3WmBV1EbSCj+D0eqw@mail.gmail.com>
Message-ID: <CAHk-=wgPupayk3GpwSMtkV5_onFzmmK2g3WmBV1EbSCj+D0eqw@mail.gmail.com>
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

On Tue, Sep 14, 2021 at 11:48 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> There was never anything "loff_t" about bitmask at any point.

Not 'bitmask'. It's 'blksize'. Hopefully that was obvious in context.

               Linus
